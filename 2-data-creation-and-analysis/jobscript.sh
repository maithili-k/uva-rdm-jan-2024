#!/bin/bash

# Set job requirements
# We are going to use only one node (-N 1), and use the express
# queue (-p short). And we set the time to 4 minutes (-t 4:00)

#SBATCH -p short
#SBATCH -N 1
#SBATCH -t 4:00

# Change these variables if you want to change the input or output directories
inputdir="$HOME/input"
outputdir="$HOME/result"
resultsfile="result-$SLURM_JOBID.txt"

# Make sure that the outputdir exist
mkdir -p $outputdir

# Count the words of all files in the inputdir and write to outputdirectory
# The freuqency table will be sorted on most common words first.
cat $inputdir/* | tr '[:upper:]' '[:lower:]' | awk '{for(i=1;i<=NF;i++) count[$i]++} END {for(j in count) print j, count[j]}' | sort -k2 -n -r > $outputdir/$resultsfile
