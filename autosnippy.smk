##replace the full path of your reference sequence，only test for fasta/fna.
ref = "/data/HYB/2023/April/test/reference/L.gasseri.GCF_902386655.1.fna"
rule all:
    input:
        "core.full.aln",
        "clean.core.aln",
        "clean.core.tree.newick"
        
##make the .sh file and peform cgSNP."--cpus" is up to you and change it to the suitable number.
rule snippymulti:
    input:
        "fasta.txt"    
    output:
        "core.full.aln"
    params:
        r=ref
    shell:
        """
        snippy-multi fasta.txt --cpus 64 --reference {params.r} > run.sh
        sh ./run.sh
        """
## cleaning and recombination removal
rule cleaning:
    input:
        "core.full.aln"
    output:
        "clean.core.aln"
    shell:
        """
        snippy-clean_full_aln core.full.aln > clean.full.aln
        run_gubbins.py -p gubbins clean.full.aln
        snp-sites -c gubbins.filtered_polymorphic_sites.fasta > clean.core.aln
        """
#bulid a tree based on clean.core.aln
rule tree:
    input:
        "clean.core.aln"
    output:
        "clean.core.tree.newick"
    shell:
        "FastTreeMP -gtr -nt clean.core.aln > clean.core.tree.newick"

