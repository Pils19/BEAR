#!/bin/bash

policies="ic"
categories="mat diff ver"
#queries="s-queries-lowCardinality.txt s-queries-highCardinality.txt p-queries-highCardinality.txt p-queries-lowCardinality.txt o-queries-highCardinality.txt o-queries-lowCardinality.txt po-queries-highCardinality.txt po-queries-lowCardinality.txt so-queries-lowCardinality.txt sp-queries-highCardinality.txt sp-queries-lowCardinality.txt spo-queries.txt"
queries="p.txt po.txt"

# TODO
#categories="mat diff ver"
#queries="p.txt"
#queries="po-queries-highCardinality.txt po-queries-lowCardinality.txt so-queries-lowCardinality.txt sp-queries-highCardinality.txt sp-queries-lowCardinality.txt spo-queries.txt"
#queries=$(cd /mnt/datastore/data/dslab/experimental/patch/BEAR/queries_bearb/ && ls -v)

for policy in ${policies[@]}; do
for category in ${categories[@]}; do
for query in ${queries[@]}; do

docker run -it --rm \
    -e POLICY="$policy" \
    -e ROLE="SPO" \
    -e CATEGORY="$category" \
    -e QUERY="$query" \
    -v $(pwd)/data:/var/data/dataset/ \
    -v $(pwd)/queries:/var/data/queries/ \
    -v $(pwd)/output:/var/data/output/ \
    bear-jena

done
done
done
