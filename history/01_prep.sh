#!/bin/bash

/usr/local/packages/jdk-8u151/bin/jar -xf andile_fq.zip
cd andile_fq
cd fastq_seqs
for RUN in *; do
    [[ -e "$RUN" ]] || continue
    cd $RUN
    cd raw
    rename _001 "" *.gz
    gunzip *.gz
    
    mkdir fwdSplit
    mkdir fwdSplit/split_by_sample_out
    mv *R1.fastq fwdSplit/split_by_sample_out

    mkdir revSplit
    mkdir revSplit/split_by_sample_out
    mv *R2.fastq revSplit/split_by_sample_out

    cd ../
    mv raw/* .
    rm -rf raw
    cd ../
    mv $RUN /local/scratch/andile
    ~/IGS_dada2_pipeline/part1.sh -i ~ -p andile -r $RUN  -v V3V4 -m  ~/test.R --debug tagclean --debug dada2
done
