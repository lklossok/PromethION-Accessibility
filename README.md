# PromethION-Accessibility
This pipeline subsets whole genome PromethION BAM files to regions identified as accessible by ATACseq .narrowPeak files. The resulting BAMs contain only reads overlapping open chromatin. This enables efficient analysis of ONT methylation signals within regulatory regions, and reduces compute required for downstream methylation callers.
