#! /bin/bash
# written by Martin Schilling
#
# this script goes through all *.fastq files and aligns to a consensus file; splits out .sam files

# edit this first line to contain the file path for the fastq files for all individuals
for i in ~/Documents/pteridium/inds/new/*.fastq; do
    file=$(echo $i | cut -f8 -d/)
    ids=$(echo $file | cut -f1 -d.)
    #id=$(echo $id | cut -f7 -d/)
    #RG=${variable}'@RG:\tID:'${id}
    # we will use a newer version of bwa (v 0.7.12-r1044)
	echo $ids

    #~/bwa/bwa mem -t 10 -w 50 -k 20 -a -C -R "@RG\tID:$id\tLB:$id\tSM:$id\tPL:ILLUMINA" ~/Desktop/stricta/stricta_assembly/v1.2/assembly/Bstricta_278_v1.fa $i > bwaMEMout/${id}.sam
    #~/bwa/bwa mem -t 10 -w 50 -k 20 -a -C -R "@RG\tID:$id\tLB:$id\tSM:$id\tPL:ILLUMINA" l105_88strictaMEM2Cns76_5.fasta $i > out/AllRds/${id}.sam

    # edit the path to bwa mem and the name of your consensus file
    ~/hts_tools/bwa/bwa mem -t 10 -w 50 -k 20 -a -C -R "@RG\tID:$ids\tLB:$ids\tSM:$ids\tPL:ILLUMINA" consensus.fasta $i > out/${ids}.sam

done

