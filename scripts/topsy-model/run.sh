#!/bin/bash
set -eu
echo "$@"

model=$1
shift

BASE=../../../topsy

data="$(yglu models.yaml)"
get () {
    echo "$data" | yq ".${model} ${1}"
}

ttest_array=()
while IFS= read -r -d '' arg; do
    ttest_array+=("$arg");
done < <(
    get '.ttests | .[] | "--ttest \"" + .test + "\" \"name=" + .name + "\""' |
    xargs printf '%s\0'
)

exchange=$(get ' | select(.exchange != null) | .exchange')
if [[ -n "$exchange" ]]; then
    exchange="--exchange-blocks ${exchange}"
fi

get ' | select(.args != null) | .args' | xargs \
    /home/knavynde/.local/pipx/venvs/snakemake/bin/python \
    /scratch/knavynde/snakemodel/snakemodel/run.py \
    $BASE $BASE/derivatives/models-v0.1.0/ group \
    "$@" \
    --pybidsdb-dir $BASE/.pybids/ --derivatives \
    --metadata-mapping ./metadata-map.yaml \
    --component $(get '.component') --model $(get '.model') --desc $(get '.desc') \
    $(get '
        .filters |
        to_entries |
        .[] |
        "--filter-" + .key + " " + (
                [.value | to_entries |  .[] | .key + "=" + .value ] | join(" ")
        )
    ') \
    $(get '
        .filter-participants |
        .[] |
        "--filter-participants " + .
    ') \
    --design "$(get '.design')" \
    $exchange \
    "${ttest_array[@]}" 



