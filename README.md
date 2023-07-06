# autosnippy
A snakemake script to run core snp phylogeny to a batch of fasta files using snippy.
## Usage
### Preparation
1.Reference genome:fasta format was only tested right now. 

Change the full path of your reference genome in **autosnippy.smk** file

2.fasta.txt:a file containing the samples and their full path.

### Analyse
Just type

`
snakemake -s autosnippy.smk -c 16
`
and wait. 
All will be done.

