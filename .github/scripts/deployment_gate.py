"""Fail closed: authorize only merged PRs targeting a vX.XX branch."""
import json
import os
import re


def deployment_commit(event_name, event, repository):
    if event_name != "pull_request" or event.get("action") != "closed":
        return None
    pr = event.get("pull_request") or {}
    base = pr.get("base") or {}
    base_repo = base.get("repo") or {}
    sha = pr.get("merge_commit_sha") or ""
    if pr.get("merged") is not True or base_repo.get("full_name") != repository:
        return None
    if base.get("ref") != "v0.05":
        return None
    return sha if re.fullmatch(r"[0-9a-f]{40}", sha) else None


if __name__ == "__main__":
    with open(os.environ["GITHUB_EVENT_PATH"], encoding="utf-8") as source:
        event = json.load(source)
    sha = deployment_commit(os.environ["GITHUB_EVENT_NAME"], event, os.environ["GITHUB_REPOSITORY"])
    with open(os.environ["GITHUB_OUTPUT"], "a", encoding="utf-8") as output:
        output.write(f"allowed={'true' if sha else 'false'}\n")
        output.write(f"commit={sha or ''}\n")
