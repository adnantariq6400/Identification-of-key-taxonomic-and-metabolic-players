#!/bin/bash

mkdir -p gene_pred nucl_pred prot_pred
for samples in `cat sample_list`; do
prodigal -i ./Assembly_Files/${samples}.assembly.fa \
	-o ./gene_pred/${samples}_GEN.gbk \
       	-a ./prot_pred/${samples}_PROT.faa \
       	-d ./nucl_pred/${samples}_NUC.fa \
	-p meta
done
