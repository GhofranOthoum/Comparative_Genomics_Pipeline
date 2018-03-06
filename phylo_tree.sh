
#get single-copy orthoulogous genes
 get_homologues.pl -e -M -d input_protein_files
#get alighnment of single-copy genes using muscle
 for file in /home/othoumgk/para/backup/*.faa
do
filename=$(basename $file .faa);
muscle -in $file -out /home/othoumgk/para/muscleouput/$filename'.fas';
done
# Concatinate all alighnments
perl FASconCAT_v1.0.pl -s -p -p
#find best amino acid replacement using prottest v3
java -jar prottest-3.4.2.jar -i /projects/dragon/bacillus/B_lich/get_homologous/phylogeny/input_homologues/muscle_output/FcC_smatrix.phy  -o test_output
#run raxml
raxmlHPC  -m PROTGAMMAWAG -J MR -p 12345 -x 12345 -N 100 -s FcC_smatrix.fas -n paratree -w raxml
