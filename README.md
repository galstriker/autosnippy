# autosnippy
A snakemake script to run core snp phylogeny to a batch of fasta files using Snippy.
## Usage
### Preparation
1.Reference genome:fasta format was only tested right now. 

Change the full path of your reference genome in **autosnippy.smk** file

2.fasta.txt:a file containing the samples and their full path.Such as:

```
a the/full/path/of/a.fasta
b the/full/path/of/b.fasta
```

3.Change the number after "--cpus" to the suitable number of your computer or server.

### Analyse
Just type

`
snakemake -s autosnippy.smk -c 16
`

and wait. 

All will be done.
## Reference
1.[Snippy](https://github.com/tseemann/snippy) The main software of this small script, if you use this script for your work, please cite Snippy in your paper or study.


