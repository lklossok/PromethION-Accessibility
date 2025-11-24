import os

configfile: "config/config.yaml"

PROM_DIR = config["PromethION_bam_dir"]
ATAC_DIR = config["ATACseq_narrowPeak_dir"]

SAMPLES = config["sample_identifier"]  # dictionary 

rule all:
    input:
        expand("data/prom_subset/{sample}_PROMsubset.bam", sample=SAMPLES.keys())


rule subset_promethion_to_peaks: 
    input:
        bam = lambda w: os.path.join(PROM_DIR, f"{SAMPLES[w.sample]['prom']}.bam"),
        narrowpeak = lambda w: os.path.join(ATAC_DIR, f"{SAMPLES[w.sample]['atac']}.narrowPeak")
    output:
        "data/prom_subset/{sample}_PROMsubset.bam"
    threads: 8
    conda: "envs/PromethION.yaml"
    shell:
        """
        mkdir -p data/prom_subset/

        cut -f1-3 {input.narrowpeak} \
            | samtools view -@ {threads} -b -L - {input.bam} > {output}
        samtools index {output}
        """
