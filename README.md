# GitHub Action for Factorio mod packaging

Create a Factorio mod package that can be used locally or uploaded to the mod portal

## Usage

This action can be used with a repository contain a Factorio mod at base level.

All the relevant information for naming are taken from the `info.json`

The action can be used as follows:

```yaml
on: push
name: Check & Release
jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Create Factorio mod package
        uses: Roang-zero1/factorio-mod-package@master
```

## Inputs

### `mod_base_dir`

Path to the directory where package creation will be executed in.

## Sample Workflow

A sample workflow that uses this action can be found at [Roang-zero1/factorio-mod-actions](https://github.com/Roang-zero1/factorio-mod-actions/blob/master/sample/push-check-release.yml)
