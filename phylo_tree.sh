#!/bin/sh
#-------
#check or download the following tools
#get_homologues.pl from https://github.com/eead-csic-compbio/get_homologues/releases
#muscle from https://www.drive5.com/muscle/downloads.htm
#FASconCAT_v1.0.pl from https://github.com/PatrickKueck/FASconCAT
#-------

#get single-copy orthologous genes
#get_homologues.pl -e -M -d $input_protein_folder
#get alighnment of single-copy genes using muscle
#prottest-3.4.2.jar from 
#raxmlHPC from https://sco.h-its.org/exelixis/web/software/raxml/index.html

for file in $orthology_output_folder/*.faa

do
	filename=$(basename $file .faa);
	muscle -in $file -out ./tmp/output_dir/$filename'.fas';
done

cd ./tmp/output_dir/$filename

# Concatinate all alighnments
perl FASconCAT_v1.0.pl -s -p -p

#find best amino acid replacement using prottest v3
java -jar prottest-3.4.2.jar -i ./tmp/output_dir/$filename/FcC_smatrix.phy  -o  prottest_output

#run raxml
raxmlHPC  -m $Predicted_Model -J MR -p 12345 -x 12345 -N 100 -s ./tmp/output_dir/$filename/FcC_smatrix.phy -n paratree -w raxml

