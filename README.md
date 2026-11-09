<h1 align="center">
  <img src="docs/icon.png" alt="" width="120"><br>
  MadGraph Serverless
</h1>

<p align="center">
  <a href="https://console.runpod.io/serverless"><img src="https://img.shields.io/badge/runpod-serverless-5d29f0?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI%2BPHBhdGggZmlsbD0iI2ZmZiIgZmlsbC1ydWxlPSJldmVub2RkIiBkPSJNMjAuOTQgMTkuNDhDMjIuMTkgMTguNzYgMjIuOTYgMTcuNDIgMjIuOTYgMTUuOThMMjIuOTYgOC4wMkMyMi45NiA2LjU4IDIyLjE5IDUuMjQgMjAuOTQgNC41MkwxNC4wMiAwLjU0QzEyLjc3LTAuMTggMTEuMjMtMC4xOCA5Ljk4IDAuNTRMMy4wNiA0LjUyQzEuODEgNS4yNCAxLjA0IDYuNTggMS4wNCA4LjAyTDEuMDQgMTUuOThDMS4wNCAxNy40MiAxLjgxIDE4Ljc2IDMuMDYgMTkuNDhMOS45OCAyMy40NkMxMS4yMyAyNC4xOCAxMi43NyAyNC4xOCAxNC4wMiAyMy40NkwyMC45NCAxOS40OFpNMjAuOTQgMTUuOThDMjAuOTQgMTYuNyAyMC41NSAxNy4zNyAxOS45MiAxNy43M0wxNi4zMSAxOS44MUMxNS45OSAyMCAxNS44MyAyMC4wOSAxNS43IDIwLjA3QzE1LjU4IDIwLjA2IDE1LjQ4IDIwIDE1LjQxIDE5LjkxQzE1LjMzIDE5LjggMTUuMzMgMTkuNjIgMTUuMzMgMTkuMjVMMTUuMzMgMTUuMDlDMTUuMzMgMTQuMzcgMTUuNzIgMTMuNyAxNi4zNSAxMy4zNEwxOC4yOCAxMi4yMkMxOC41NSAxMi4wNyAxOC42OCAxMS45OSAxOC43OCAxMS44OUMxOC44NiAxMS43OSAxOC45MyAxMS42OCAxOC45NyAxMS41NkMxOS4wMSAxMS40MiAxOS4wMSAxMS4yNyAxOS4wMSAxMC45NkwxOS4wMSAxMC44N0MxOS4wMSAxMC40MSAxOS4wMSAxMC4xOCAxOC45MSAxMC4wNUMxOC44MyA5LjkzIDE4LjcgOS44NiAxOC41NiA5Ljg0QzE4LjM5IDkuODMgMTguMiA5Ljk0IDE3LjggMTAuMTdMMTUuMzMgMTEuNTlDMTQuMDggMTIuMzEgMTMuMzEgMTMuNjQgMTMuMzEgMTUuMDlWMjEuMTlDMTMuMzEgMjEuNDEgMTMuMiAyMS42IDEzLjAxIDIxLjcxQzEyLjM5IDIyLjA3IDExLjYxIDIyLjA3IDEwLjk5IDIxLjcxTDQuMDggMTcuNzNDMy40NSAxNy4zNyAzLjA2IDE2LjcgMy4wNiAxNS45OEwzLjA2IDExLjg4QzMuMDYgMTEuNTEgMy4wNiAxMS4zMyAzLjE0IDExLjIyQzMuMjEgMTEuMTMgMy4zMSAxMS4wNyAzLjQzIDExLjA2QzMuNTYgMTEuMDQgMy43MiAxMS4xMyA0LjA0IDExLjMyTDcuNTggMTMuMzZDOC4yIDEzLjcyIDguNTkgMTQuMzkgOC41OSAxNS4xMUw4LjU5IDE3LjIzQzguNTkgMTcuNTQgOC41OSAxNy42OSA4LjY0IDE3LjgzQzguNjcgMTcuOTUgOC43NCAxOC4wNiA4LjgzIDE4LjE2QzguOTIgMTguMjYgOS4wNiAxOC4zNCA5LjMyIDE4LjQ5TDkuNCAxOC41NEM5LjggMTguNzcgMTAgMTguODggMTAuMTYgMTguODZDMTAuMyAxOC44NSAxMC40MyAxOC43NyAxMC41MiAxOC42NkMxMC42MSAxOC41MiAxMC42MSAxOC4zIDEwLjYxIDE3Ljg0TDEwLjYxIDE1LjExQzEwLjYxIDEzLjY2IDkuODQgMTIuMzMgOC41OSAxMS42MUwzLjQyIDguNjNDMy4yIDguNSAzLjA2IDguMjcgMy4wNiA4LjAyQzMuMDYgNy4zIDMuNDUgNi42MyA0LjA4IDYuMjdMMTAuOTkgMi4yOUMxMS42MSAxLjkzIDEyLjM5IDEuOTMgMTMuMDEgMi4yOUwxNi41OSA0LjM1QzE2LjkxIDQuNTMgMTcuMDcgNC42MyAxNy4xMiA0Ljc1QzE3LjE3IDQuODUgMTcuMTcgNC45NyAxNy4xMiA1LjA3QzE3LjA3IDUuMTkgMTYuOTEgNS4yOSAxNi41OSA1LjQ3TDEyLjk2IDcuNTZDMTIuMzMgNy45MiAxMS41NiA3LjkyIDEwLjkzIDcuNTZMOC45IDYuMzlDOC42OSA2LjI3IDguNTkgNi4yMSA4LjQ4IDYuMTlDOC4zOSA2LjE3IDguMjkgNi4xNyA4LjE5IDYuMTlDOC4wOSA2LjIxIDcuOTggNi4yNyA3Ljc4IDYuMzhMNy41MyA2LjUyQzcuMTIgNi43NSA2LjkxIDYuODYgNi44NCA3LjAxQzYuNzggNy4xNCA2Ljc4IDcuMjkgNi44NCA3LjQyQzYuOTEgNy41OCA3LjExIDcuNjkgNy41MSA3LjkzTDkuOTIgOS4zMUMxMS4xNyAxMC4wMyAxMi43MiAxMC4wMyAxMy45NyA5LjMxTDE5LjI1IDYuMjdDMTkuNDYgNi4xNSAxOS43MSA2LjE1IDE5LjkyIDYuMjdDMjAuNTUgNi42MyAyMC45NCA3LjMgMjAuOTQgOC4wMlYxNS45OFoiLz48L3N2Zz4%3D&style=flat-square" alt="Runpod"></a>
  <a href="https://hub.docker.com/r/startown/madgraph-serverless"><img src="https://img.shields.io/docker/v/startown/madgraph-serverless?sort=semver&label=docker%20hub&logo=docker&logoColor=white&style=flat-square" alt="Docker Hub"></a>
  <a href="https://hub.docker.com/r/startown/madgraph-serverless/tags"><img src="https://img.shields.io/docker/image-size/startown/madgraph-serverless/0.1.1?label=size&style=flat-square" alt="Image size"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/startown-ai/madgraph-serverless?style=flat-square" alt="License"></a>
</p>

[MadGraph5_aMC@NLO](https://github.com/mg5amcnlo/mg5amcnlo) with [Pythia](https://pythia.org) and [Delphes](https://github.com/delphes/delphes) on Runpod Serverless, one HTTP request per run.

It adds a Runpod handler to [`startown/madgraph:3.8.1-7`](https://github.com/startown-ai/madgraph), which bundles Pythia, Delphes, LHAPDF, FastJet, eMELA, and ROOT.

## Installation

In the Runpod console, go to [Serverless](https://console.runpod.io/serverless), click [New endpoint](https://console.runpod.io/serverless/new-endpoint), and choose **Deploy from a Docker image** with these settings:

| Setting           | Value                                 |
| ----------------- | ------------------------------------- |
| Container image   | `startown/madgraph-serverless:0.1.0`  |
| Container disk    | 100 GB                                |
| Worker type       | CPU, 5 GHz Compute Optimized, 32 vCPU |
| FlashBoot         | on                                    |
| Execution timeout | off                                   |

Add these environment variables, so the worker can upload its results to S3-compatible storage such as Cloudflare R2:

| Variable            | Value                                                          |
| ------------------- | -------------------------------------------------------------- |
| `ENDPOINT`          | storage endpoint URL                                           |
| `ACCESS_KEY_ID`     | access key ID                                                  |
| `SECRET_ACCESS_KEY` | secret access key                                              |
| `BUCKET`            | bucket name, optionally with a folder, e.g. `my-bucket/runpod` |

A worker missing any of them stops at startup, before it takes a job.

Once the endpoint shows **Ready**, it takes runs. Each run fully occupies a worker, so under **Manage > Edit endpoint**, scale by **Request count** with 1 request per worker.

## Usage

Submit a run:

```bash
curl -X POST "https://api.runpod.ai/v2/{endpoint_id}/run" \
  -H "Authorization: Bearer {api_key}" \
  -H "Content-Type: application/json" \
  -d @request.json
```

The request holds the commands you'd enter in MadGraph. For example, this `request.json` generates 1,000 top-quark pairs with parton shower and detector simulation. The fixed core count and random seed make it reproducible:

```json
{
  "input": {
    "commands": [
      "set nb_core 32",
      "generate p p > t t~",
      "output pp2tt",
      "launch",
      "shower=Pythia8",
      "detector=Delphes",
      "done",
      "set nevents 1000",
      "set iseed 1",
      "set HEPMCoutput:file hepmc.gz",
      "done"
    ]
  }
}
```

Each request runs on its own worker. To run several in parallel, give each its own seed and output name, such as `pp2tt-s2` with seed 2. Requests with the same seed give identical events, and requests with the same output name overwrite each other's results.

Runpod removes a job 24 hours after it is submitted, even while it is still running. For longer runs, add `"policy": {"ttl": <milliseconds>}` next to `"input"`, up to 7 days.

Check a run with the job `id` that `/run` returns:

```bash
curl "https://api.runpod.ai/v2/{endpoint_id}/status/{job_id}" \
  -H "Authorization: Bearer {api_key}"
```

Once it shows `COMPLETED`, its `output` holds `{"output_path": "{BUCKET}/{name}.tar"}`, where `{name}` is the `output` name. The tar holds the whole output directory, and the results are in `{name}/Events/run_01/`:

| File                            | Contents                           |
| ------------------------------- | ---------------------------------- |
| `run_01_tag_1_banner.txt`       | every card and setting of the run  |
| `unweighted_events.lhe.gz`      | parton-level events                |
| `tag_1_pythia8_events.hepmc.gz` | particle-level events from Pythia  |
| `tag_1_delphes_events.root`     | detector-level events from Delphes |

This image defaults to `HEPMCoutput:file autoremove`, unlike MadGraph's `hepmc.gz`. In MadGraph, this setting deletes the HepMC file at the end of the run; with [`startown/madgraph`](https://github.com/startown-ai/madgraph)'s patches, it runs Delphes inside each Pythia job instead, so no HepMC is written.

You can also submit and follow runs on the endpoint's **Requests** tab in the console.

## License

This repository is licensed under the [Apache License 2.0](LICENSE). The packages it builds on keep their own licenses: see [`startown/madgraph`](https://github.com/startown-ai/madgraph#license) for MadGraph and the tools it bundles.
