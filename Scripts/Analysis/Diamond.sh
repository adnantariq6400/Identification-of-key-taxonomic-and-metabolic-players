#!/bin/bash

# Set paths to your files
diamond_db="./database/CAZyDB.07262023.fa.txt"
query_file="./Cluster0.80.faa"
output_file="Diamond_Cluster.tsv"

# Run diamond blastp
diamond blastp -d "$diamond_db" -q "$query_file" -o narrow_table_temp.tsv --outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp --evalue 1e-5 --id 70 --max-hsps 1 --query-cover 80 --top 1

# Sort the temporary file based on query ID and bitscore, and keep only the top hit for each query
sort -k1,1 -k12,12nr narrow_table_temp.tsv | awk '!seen[$1]++' > "$output_file"

# Remove the temporary file
rm narrow_table_temp.tsv

echo "Results saved in $output_file"

