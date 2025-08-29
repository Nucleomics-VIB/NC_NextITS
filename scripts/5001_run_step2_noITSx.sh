#! /bin/bash

# run NextITS from the singularity image
# from:= https://next-its.github.io/usage/
# and: https://next-its.github.io/parameters/
# SP@NC; 2025-06-11; v1.0

outfolder="/data/splaisan/NC_projects/5001_SWeckx_NextITS/NextITS_analysis_noITSx"

# set to the current version of the nextflow pipeline
ver="main"

profile="/data/splaisan/NC_projects/5001_SWeckx_NextITS/NextITS/conf/wallace.config"

cmd="nextflow run vmikk/NextITS -r ${ver} \
  -with-singularity /opt/sif_files/vmiks_nextits_0.8.2.sif \
  -c ${profile} \
  --step 'Step2' \
  --data_path ${outfolder}/nextits_Step1\
  --outdir ${outfolder}/nextits_Step2 \
  --clustering_method 'vsearch' \
  --otu_id 0.98 \
  --storagemode 'copy'"

echo "# ${cmd}"
eval ${cmd} && \
  mkdir -p ${outfolder}/final_results && \
  cp -rL ${outfolder}/nextits_Step2 ${outfolder}/final_results/Step2_results

echo "# Step2 completed, complete results are in ${outfolder}/final_results/Step2_results"
