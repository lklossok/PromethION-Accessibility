# PromethION-Accessibility
This pipeline subsets whole genome PromethION BAM files to regions identified as accessible by ATACseq .narrowPeak files. The resulting BAMs contain only reads overlapping open chromatin. This enables efficient analysis of ONT methylation signals within regulatory regions, and reduces compute required for downstream methylation callers.

# Pipeline steps:

`subset_promethion_to_peaks` - Intersects each PromethION BAM with ATACseq .narrowPeak regions, producing BAM files restricted to accessible regulatory loci.

# Inputs:

Preprocessed PromethION BAM files 

Genome-wide ATACseq narrowPeak files

# Outputs:

PromethION BAM files subsetted to ATACseq open chromatin regions
