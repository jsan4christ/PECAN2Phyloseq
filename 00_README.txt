META
history - scripts used to process andile_fq.zip, and STDOUT/SDTDERR
00_README.txt - this file
andile_part2_16S_pipeline_log.txt
REPORT - HTML report (all files in ./REPORT are needed to display the report)
    - summarizes project-level count tables and sample stats

RUN-LEVEL DATA
run_artifacts - probably unneeded
run_summaries - count tables and sample read counts

PROJECT-LEVEL DATA
all_runs_dada2_ASV.fasta - ASV sequences and IDs
stats_file_cmp.txt - Sample read stats
all_runs_dada2_abundance_table.rds - Sample x ASV sequence count table
rTmp.R - artifact from chimera removal
rTmp.Rout - artifact from chimera removal

TAXONOMY KEYS
andile_MC_order7_results.txt - PECAN
andile_silva_classification.csv - RDP Classifier w SILVA138
silva_condensed.txt - andile_silva_classification.csv, reformatted
cmb_tx.txt - ASV-annotation key used to produce SILVA-PECAN count tables

TAXONOMIZED COUNT TABLES
andile_all_runs_dada2_abundance_table.csv - Sample x ASV ID count table
andile_all_runs_dada2_abundance_table_PECAN_asvs+taxa.csv - 
andile_all_runs_dada2_abundance_table_PECAN_taxa-merged.csv
andile_all_runs_dada2_abundance_table_PECAN_taxa-merged_StR_CST.csv
andile_all_runs_dada2_abundance_table_SILVA_asvs+taxa.csv
andile_all_runs_dada2_abundance_table_SILVA-PECAN_asvs+taxa.csv
andile_all_runs_dada2_abundance_table_SILVA-PECAN_taxa-merged.csv
andile_all_runs_dada2_abundance_table_SILVA_taxa-merged.csv
