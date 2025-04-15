mkdir -p sams
mkdir -p bowtie2
mkdir -p profiles
for f in fastq/SRR*
do
    echo "Running MetaPhlAn on ${f}"
    bn=$(basename ${f})
    metaphlan ${f} --input_type fastq -s sams/${bn}.sam.bz2 --bowtie2out bowtie2/${bn}.bowtie2.bz2 \
    -o profiles/${bn}_profiled.tsv --nproc 4 --offline
done

