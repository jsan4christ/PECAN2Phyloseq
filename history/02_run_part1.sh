#!/bin/bash

for RUN in *; do
    [[ -d "$RUN" ]] || continue
    
    /home/jolim/IGS_dada2_pipeline/part1.sh -i ~ -p andile -r $RUN  -v V3V4 -m  ~/test.R --debug tagclean --debug dada2
done
