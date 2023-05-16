# Changelog
All notable changes to this project will be documented in this file.


## [0.4.0] - 2023-05-08

- Add Step-2 workflow for pooling, dereplicating, and clustering sequences from Step-1
    - Read clustering with VSEARCH ([Rognes et al., 2016 DOI:10.7717/peerj.2584](https://peerj.com/articles/2584/))  
    - Error-correction with UNOISE2 ([Edgar, 2016 DOI:10.1101/081257](https://www.biorxiv.org/content/10.1101/081257v1))  
    - Post-clustering curation with LULU ([Frøslev et al., 2017 DOI:doi.org/10.1038](https://www.nature.com/articles/s41467-017-01312-x))  
- Add run summary for Step-1 (read counts at different pipeline stages)  
- Separate config for HPC clusters  
- Add Docker container  


## [0.3.0] - 2023-03-02

- Add support for pre-demultiplexed data as input  
- Add option for semi-full-length ITS (especially useful when forward primer is located at the very end of SSU and the HMM site can not be recognized by ITSx)  
- Add removal of long homopolymer artifacts at QC stage  
- Correct handling of a case with no valid sequences at primer checking step (thank to Taavi Riit for reporting the bug)  
- Bug fixed in `assemble_its` (thanks to Kadri Põldmaa for discovering the error)  
- Addition of ITSx detailed results (with information on the HMM profile used for ITS extraction)  
- Fixed sample names for the rescued chimeric sequences  
- Minor fixes related with the Singularity container, output directory, help message, and single-end QC  

## [0.2.0] - 2022-09-30

- Add Ilumina-based workflow (see `--seqplatform` flag)  
- Publish Singularity image to Singularity library  
- Minor bugfixes in `primer_check` (multiprimer artefacts), `pool_seqs` (sequence headers), and `prep_asvtab` (aggregation of non-unique joined Illumina sequences) processes  
- New logo design (thanks to Olesya Dulya)  

## [0.0.1] - 2022-07-07

- Initial release  
