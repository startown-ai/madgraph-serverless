# MadGraph Serverless

![madgraph-serverless image size](https://img.shields.io/docker/image-size/startown/madgraph-serverless/0.1.0?arch=amd64&logo=docker&label=madgraph-serverless&style=flat-square)

Run MadGraph5_aMC@NLO on Runpod Serverless with a simple HTTP request.

MadGraph5_aMC@NLO is a widely used tool in high-energy physics (HEP) for simulating particle collisions. Setting up its runtime environment -- Pythia, Delphes, LHAPDF, ROOT, and others -- can be tricky. Once running, individual simulations are CPU-intensive, long-running, and use a lot of disk space.

This project adds a Runpod handler to [`startown/madgraph:3.5.17`](https://github.com/startown-ai/madgraph) -- MadGraph 3.5.17 with Pythia 8.317, Delphes 3.5.1, ROOT, FastJet, LHAPDF, and eMELA -- and publishes it as `startown/madgraph-serverless:0.1.0` (amd64). You submit a run via an HTTP request with the same commands you'd enter in MadGraph, pay only for the compute you use, and run many simulations in parallel without managing infrastructure.

## Deploy on Runpod Serverless

### 1. Create the endpoint

From the Runpod console, go to **[Serverless](https://console.runpod.io/serverless)** and click **[New endpoint](https://console.runpod.io/serverless/new-endpoint)**. Select **Deploy from a Docker image**.

In **Container Name**, enter `startown/madgraph-serverless:0.1.0`. Under **Container configuration**, set the container disk to **100 GB**. Then, under **Environment variables**, add these four so the worker can upload its output to S3-compatible storage (e.g. Cloudflare R2):

- `ENDPOINT` -- your storage endpoint URL
- `ACCESS_KEY_ID` -- your access key ID
- `SECRET_ACCESS_KEY` -- your secret access key
- `BUCKET` -- the bucket name, optionally followed by a folder (e.g. `my-bucket/runpod`)

> **All four are required.** A worker missing any of them stops at startup, before it takes a job.

Click **Next**. Name the endpoint, then choose **CPU**, **5 GHz Compute Optimized**, **32 vCPU**. Enable **FlashBoot**, disable **Execution Timeout**, and click **Deploy**.

### 2. Wait for workers

Workers will initialize and pull the Docker image. Once the status shows **Ready**, the endpoint is live.

### 3. Configure auto-scaling (optional)

Click **Manage > Edit endpoint** to adjust the auto-scaling strategy. **Request count** with 1 request per worker works well for MadGraph since each simulation fully occupies a worker.

### 4. Submit a run

**Via the console:** Go to the **Requests** tab, paste your request body, and click **Run**. The request enters the queue and is picked up by an available worker.

**Via the API:** You can submit runs programmatically using the Runpod REST API. Replace `{endpoint_id}` and `{api_key}` with your values from the Runpod console.

```bash
curl -X POST "https://api.runpod.io/v2/{endpoint_id}/run" \
  -H "Authorization: Bearer {api_key}" \
  -H "Content-Type: application/json" \
  -d '{
    "input": {
      "commands": [
        "generate p p > w+ w-, w+ > j j, w- > j j",
        "output WWToJJJJ_pp-13TeV_madgraph-pythia8-delphes_1k_s1",
        "launch",
        "shower=pythia8",
        "detector=delphes",
        "done",
        "set iseed 1",
        "set ebeam 6500",
        "set nevents 1000",
        "add pythia8_card Random:setSeed = on",
        "add pythia8_card Random:seed = 1",
        "add delphes_card --line_position=0 set RandomSeed 1",
        "done"
      ]
    }
  }'
```

The seed is set in all three stages -- `iseed` for MadGraph, `Random:seed` for Pythia, and `RandomSeed` for Delphes -- so the whole chain is reproducible, not only the parton-level events. Use seeds of 1 or more: with 0, each program picks its own random seed. Without the two `Random:` lines, Pythia uses the same built-in seed in every run.

You can submit multiple requests at once -- each one runs on a separate worker in parallel. Give each request its own random seed in all three stages (consecutive seeds 1, 2, 3, ... give independent runs), and put the seed in the output name. Requests with the same seed generate identical events, and requests with the same output name overwrite each other in your storage bucket. Only these lines change between requests:

```
# request 1
"output WWToJJJJ_pp-13TeV_madgraph-pythia8-delphes_1k_s1",
"set iseed 1",
"add pythia8_card Random:seed = 1",
"add delphes_card --line_position=0 set RandomSeed 1",

# request 2
"output WWToJJJJ_pp-13TeV_madgraph-pythia8-delphes_1k_s2",
"set iseed 2",
"add pythia8_card Random:seed = 2",
"add delphes_card --line_position=0 set RandomSeed 2",
```

> **Runs longer than a day:** Runpod removes a job 24 hours after it is submitted by default, even while it is still running. For longer runs, add `"policy": {"ttl": <milliseconds>}` next to `"input"` in the request body (up to 7 days).

### 5. Get your results

When a run completes, the whole MadGraph output directory is uploaded as `{BUCKET}/{name}.tar`, where `{name}` is the name given to the `output` command (the event files inside are already compressed). The events are under `Events/run_01/`:

- `unweighted_events.lhe.gz` -- parton-level events from MadGraph
- `tag_1_pythia8_events.hepmc.gz` -- showered events from Pythia, with `shower=pythia8`
- `tag_1_delphes_events.root` -- reconstructed events from Delphes, with `detector=delphes`

**Via the console:** Open the request on the **Requests** tab to see its status and output.

**Via the API:** Submitting with `/run` returns a job `id` right away. Use it to check the job's status; once it shows `COMPLETED`, the `output` field holds `{"output_path": "{BUCKET}/{name}.tar"}`.

```bash
curl "https://api.runpod.io/v2/{endpoint_id}/status/{job_id}" \
  -H "Authorization: Bearer {api_key}"
```
