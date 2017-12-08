Pipeline for exome
--------------------------------

1.Installing the necessary resources and creating workdir

```
sh NGS_DNA-resources.sh
sh makestructure.sh
```

2.creating samplesheet from bam files, the outfile is Exomeproject.csv

```
sh creat_samplesheet.sh -{PATH of samples}
```

3.Preparing and running NGS_DNA pipeline
NOTE: the latest version of NGS_NDA is 3.4.3, but the Boxy cluster can not load it. We should install it in our {HOME} directory.
So do some change in generate_template.sh:
1) module load NGS_DNA/3.4.3-beta
2) module load module load Python/2.7.11-foss-2015b
3) RE-SET {tmpDirectory}, {workDir} and {group}

```
group="umcg-weersma"
tmpName="tmp03"
cp –rf samples.bam /${group}/${tmpName}/WES-project/rawdata/ngs/

module load NGS_DNA

folder="samplesheet"
mkdir /${group}/${tmpName}/WES-project/generatedscripts/$folder/
cd /${group}/${tmpName}/WES-project/generatedscripts/$folder/
cp -rf samplesheet.csv ./
cp -rf ~/github/NGS_DNA/templates/generate_template.sh
sh generate_template.sh
cd scripts
sh submit.sh
cd ../../../../projects/Exomeproject/run01/jobs/
sh submit.sh
```

4.BamToFastq

```
sbatch bamTofastq.sh
```


