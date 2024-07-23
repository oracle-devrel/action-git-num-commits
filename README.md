# "Git" (Get) Files Changed

## Introduction
This is designed to be used in GitHub Actions.  It retrieves the changes made in a pull request (PR).

## Inputs
| Input | Type | Description |
|-------|------|-------------|
| `pull_url` | string | The URL for the PR.  When used in a GH workflow, will typically be `${{ github.event.pull_request.url }}`. |

## Outputs
| Output | Type | Description |
|-------|------|-------------|
| `num_commits` | number | How many commits are part of the PR. |
| `fetch_depth` | number | How far to set the depth of the fetch.  Useful for workflows triggered by `pull_request_target`, where the `fetch_depth` needs to be set.  This is really just `num_commits` + 1.  Since GH workflows doesn't allow direct manipulation of values (basic arithmetic, etc.), it's needed to calculate the `fetch_depth` in this action. |

## Usage
Here's a sample:

```
name: Banned file changes (PR)
on:
  pull_request_target:
  
jobs:
  check_for_banned_file_changes:
    name: Look for unsupported (banned) file modifications on PRs
    runs-on: ubuntu-latest
    steps:
      - name: 'Get number of git commits'
        uses: https://github.com/oracledevrel/action-git-num-commits
        id: num_commits
        with:
          pull_url: ${{ github.event.pull_request.url }}
      - name: 'Checkout repo'
        uses: actions/checkout@v2
        with:
          ref: ${{ github.event.pull_request.head.ref }}
          repository: ${{ github.event.pull_request.head.repo.full_name }}
          fetch-depth: ${{ steps.num_commits.outputs.fetch_depth }}
```

## Copyright Notice
Copyright (c) 2024 Oracle and/or its affiliates.