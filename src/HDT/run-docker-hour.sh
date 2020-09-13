#!/bin/bash

policies="ic"
categories="mat diff ver"
#queries="s-queries-lowCardinality.txt s-queries-highCardinality.txt p-queries-highCardinality.txt p-queries-lowCardinality.txt o-queries-highCardinality.txt o-queries-lowCardinality.txt po-queries-highCardinality.txt po-queries-lowCardinality.txt so-queries-lowCardinality.txt sp-queries-highCardinality.txt sp-queries-lowCardinality.txt spo-queries.txt"
queries="p.txt po.txt"
categories="mat"

for policy in ${policies[@]}; do
for category in ${categories[@]}; do
for query in ${queries[@]}; do

docker run -it --rm \
    -e POLICY="$policy" \
    -e CATEGORY="$category" \
    -e QUERY="$query" \
    -v $(pwd)/bear-b/hour/ic/hdt/:/var/data/dataset/ic/ \
    -v $(pwd)/bear-b/hour/ic/queries:/var/data/queries/ \
    -v $(pwd)/bear-b/hour/ic/output/:/var/data/output/ \
    bear-hdt

done
done
done
