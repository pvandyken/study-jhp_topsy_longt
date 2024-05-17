#!/bin/bash

~/.local/pipx/venvs/snakemake/bin/python ../apps/averager/averager/run.py \
    ../../jhp/ ../../jhp/derivatives/averager/ participant \
    "$@" \
    --pybidsdb-dir ../../jhp/.pybids/ \
    --filter-volume desc:match='MD|RD|L1'  --groupby subject desc suffix datatype