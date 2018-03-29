#Single_copy_genes_phylo_tree_pipeline

The provided pipeline has the following steps:

1. Find single-copy genes generated using protein sequences through get_homologues.pl (https://github.com/eead-csic-compbio/get_homologues/releases)

2. Align the single-copy genes using muscle (https://www.drive5.com/muscle/downloads.htm)

3. Concatinate alighnment using FASconCAT (https://github.com/PatrickKueck/FASconCAT)

4. Find the best-fit model of amino acid replacement using prottest3 (https://github.com/ddarriba/prottest3/blob/master/README.md)

5. Construct the tree using raxml  https://sco.h-its.org/exelixis/web/software/raxml/index.html using the single alignment and the predicted amino acid replacement model

