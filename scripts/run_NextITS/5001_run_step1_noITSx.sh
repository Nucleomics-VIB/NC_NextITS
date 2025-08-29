#! /bin/bash

# run NextITS from the singularity image
# from:= https://next-its.github.io/usage/
# and: https://next-its.github.io/parameters/
# SP@NC; 2025-06-11; v1.0

infolder="/data/splaisan/NC_projects/5001_SWeckx_NextITS/fastq_ITS"
outfolder="/data/splaisan/NC_projects/5001_SWeckx_NextITS/NextITS_analysis_noITSx"
runid="run1"

profile="/data/splaisan/NC_projects/5001_SWeckx_NextITS/NextITS/conf/wallace.config"

# create folder and contained workdir
mkdir -p ${outfolder}/workdir

# set to the current version of the nextflow pipeline
ver="main"

# primers adapted to the project sequences
forp="TCCGTAGGTGAACCTGC"
revp="CCTSCSCTTANTDATATGC"

# compute length -2
forl=$((${#forp} - 2))
revl=$((${#revp} - 2))

# database for chimera
# downloaded from https://owncloud.ut.ee/owncloud/s/PkasGDNDimNssm3
chimeraDB="/data/splaisan/biodata/NextITS_chimeraDB/UN95_chimera.udb"

# -with-singularity /opt/sif_files/vmiks_nextits_0.8.2.sif \
cmd="nextflow run vmikk/NextITS -r ${ver} \
  -with-singularity /opt/sif_files/vmiks_nextits_0.8.2.sif \
  -c ${profile} \
  --step "Step1" \
  --input ${infolder} \
  --demultiplexed true \
  --primer_forward ${forp} \
  --primer_reverse ${revp} \
  --primer_mismatches 2 \
  --primer_foverlap ${forl} \
  --primer_roverlap ${revl} \
  --chimera_db ${chimeraDB} \
  --its_region 'none' \
  --ITSx_tax 'all' \
  --ITSx_evalue 0.1 \
  --ITSx_partial 0 \
  --outdir ${outfolder}/nextits_Step1/${runid} \
  -work-dir ${outfolder}/workdir \
  --storagemode 'copy'"

# copy mode is not yet working, need to make a complete copy
echo "# ${cmd}"
eval ${cmd} && \
  mkdir -p ${outfolder}/final_results && \
  cp -rL ${outfolder}/nextits_Step1/${runid} ${outfolder}/final_results/Step1_results

echo "# Step1 completed, complete results are in ${outfolder}/final_results/Step1_results"
