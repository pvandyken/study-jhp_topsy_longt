#!/bin/bash

~/.local/pipx/venvs/snakemake/bin/python ../apps/averager/averager/run.py \
    ../../topsy/ ../../topsy/derivatives/averager/ participant \
    "$@" \
    --pybidsdb-dir ../../topsy/.pybids/ \
    --filter-volume 'desc:match=MD|RD|L1'  --groupby subject desc suffix datatype