#!/bin/bash
policies="ic cb"
categories="mat diff ver"
declare -a policiesnames
policiesnames=("" _CB)
declare -a categoriesnames
categoriesnames=(matVersion diffJump5 versionQuery)

poli=0
for policy in ${policies[@]}; do
cati=0
for category in ${categories[@]}; do
g++ -std=gnu++11 \
    -L/usr/local/src/hdt-cpp/hdt-lib/ \
    -L/usr/local/src/hdt-cpp/libcds-v1.0.12/lib/ \
    -I include \
    -o /opt/bear/query-$policy-$category \
    /tmp/tools/${categoriesnames[$cati]}${policiesnames[$poli]}.cpp \
    -lhdt \
    -lcds \
    -lz \
    -lraptor2 \
    -lserd-0
let cati++
done
let poli++
done
