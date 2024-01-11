#!/bin/bash

# Set job requirements

# SBATCH -p short
# SBATCH -t 4:00

# Change these variables if you want to change the input or output directories
inputdir="$HOME/input"
outputdir="$HOME/result"
resultsfile="result-$SLURM_JOBID.txt"

# Make sure that the outputdir exist
mkdir -p $outputdir

# Count the words of all files in the inputdir and write to outputdirectory
# The freuqency table will be sorted on most common words first.
cat $inputdir/* | tr '[:upper:]' '[:lower:]' | awk '{for(i=1;i<=NF;i++) count[$i]++} END {for(j in count) print j, count[j]}' | sort -k2 -n -r > $outputdir/$resultsfile
