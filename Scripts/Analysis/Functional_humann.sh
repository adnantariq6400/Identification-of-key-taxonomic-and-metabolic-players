#!/bin/bash

# Define the input and output directories
input_dir="/home3/mrg002/hg1/"
output_dir="/home3/mrg002/human_output"
mkdir -p "${output_dir}"

# Loop through all .sam files in the input directory
for fastq_file in "${input_dir}"*.fastq.gz; do
    # Get the base name of the file without the extension
    base_name=$(basename -- "$fastq_file" .fastq.gz)
    
    # Run humann for each .sam file
    humann -i "${fastq_file}"  --bypass-nucleotide-search --threads 110  --output "${output_dir}/${base_name}" --bypass-nucleotide-index --memory-use maximum --evalue 0.00005 --remove-temp-output --remove-stratified-output --bypass-prescreen
done

