for i in `cat samples_list`; do \
	fastp -i ./${i}_RNM_1.fastq.gz \
	-o /mnt/c/FYP/preprocess/clean/${i}_1.fastq.gz \
	-I ./${i}_RNM_2.fastq.gz \
	-O /mnt/c/FYP/preprocess/clean/${i}_2.fastq.gz \
	-D --detect_adapter_for_pe \
	--length_required 100;
done
