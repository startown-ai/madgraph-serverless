import os
import sys
import tarfile
import time

import pexpect
import runpod
import s3fs

S3_ENDPOINT = os.environ["ENDPOINT"]
S3_ACCESS_KEY_ID = os.environ["ACCESS_KEY_ID"]
S3_SECRET_ACCESS_KEY = os.environ["SECRET_ACCESS_KEY"]
S3_BUCKET = os.environ["BUCKET"]

s3 = s3fs.S3FileSystem(
    endpoint_url=S3_ENDPOINT,
    key=S3_ACCESS_KEY_ID,
    secret=S3_SECRET_ACCESS_KEY,
)


def handler(event: dict):
    commands = [" ".join(cmd.split()) for cmd in event["input"].get("commands", [])]
    commands = [cmd for cmd in commands if cmd and not cmd.startswith("!")]
    if not commands:
        return {"error": "No commands provided"}

    outputs = (cmd.split(" ")[1] for cmd in commands if cmd.startswith("output "))
    output_path = next(outputs, None)
    if not output_path:
        return {"error": "No output path provided"}

    script_path = "commands.mg5"
    with open(script_path, "w") as f:
        f.write("\n".join(commands))
    status = f"Running mg5_aMC {script_path}"
    print(f"{status}...")
    start = time.monotonic()
    pexpect.run(
        command=f"mg5_aMC {script_path}",
        timeout=None,
        logfile=sys.stdout,
        encoding="utf-8",
    )
    print(f"{status}...done ({time.monotonic() - start:.1f} s)")

    if not os.path.exists(output_path):
        return {"error": f"Output path '{output_path}' not found after execution"}

    archive_path = f"{output_path}.tar"
    status = f"Archiving {output_path} to {archive_path}"
    print(f"{status}...")
    start = time.monotonic()
    with tarfile.open(archive_path, "w") as tar:
        tar.add(output_path)
    size = f"{os.path.getsize(archive_path) / 1e6:.1f} MB"
    print(f"{status}...done ({size}, {time.monotonic() - start:.1f} s)")

    s3_path = f"{S3_BUCKET}/{archive_path}"
    status = f"Uploading {archive_path} to {s3_path}"
    print(f"{status}...")
    start = time.monotonic()
    s3.put(archive_path, s3_path, ContentType="application/x-tar")
    print(f"{status}...done ({size}, {time.monotonic() - start:.1f} s)")

    return {"output_path": s3_path}


if __name__ == "__main__":
    runpod.serverless.start({"handler": handler})
