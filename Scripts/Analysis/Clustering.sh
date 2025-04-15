#source activate mmseq2

mkdir -p Clustering
mkdir -p Clustering/Clustering_tmp

#mmseqs createdb ./combined_output.fa ./Clustering/MAG_Proteins --dbtype 1

for id in  0.9 ;do

mkdir -p ./Clustering/Cluster_${id}/
mkdir -p ./Clustering/Cluster_${id}/Cluster_${id}_tmp

mmseqs linclust \
	./Clustering/MAG_Proteins \
	./Clustering/Cluster_${id}/Cluster_${id}.fa \
	./Clustering/Cluster_${id}/Cluster_${id}_tmp \
	--cov-mode 1 \
	-c 0.8 \
	--min-seq-id ${id} \
	--cluster-mode 2 \
	--kmer-per-seq 80 \
	--threads 8

mmseqs createsubdb ./Clustering/Cluster_${id}/Cluster_${id}.fa.index \
									 ./Clustering/MAG_Proteins \
									 ./Clustering/Cluster_${id}/Cluster_${id}_rep

mmseqs convert2fasta ./Clustering/Cluster_${id}/Cluster_${id}_rep \
										 ./Clustering/Cluster_${id}/Cluster_${id}_representatives.fa

mv ./Clustering/Cluster_${id}/Cluster_${id}_representatives.fa ./Clustering/Cluster${id}.fa

done