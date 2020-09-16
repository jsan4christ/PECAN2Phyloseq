

library("dada2")
packageVersion("dada2")
path<-getwd()

## list all of the files matching the pattern
tables<-list.files(path, pattern="-dada2_abundance_table.rds", full.names=TRUE)
stats<-list.files(path, pattern="-dada2_part1_stats.txt", full.names=TRUE)

## get the run names using splitstring on the tables where - exists
sample.names <- sapply(strsplit(basename(tables), "-"), `[`, 1)
##sample.names
##names(tables) <- sample.names

runs <- vector("list", length(sample.names))
names(runs) <- sample.names
for(run in tables) {
  cat("Reading in:", run, "
")
  runs[[run]] <- readRDS(run)
}

runstats <- vector("list", length(sample.names))
names(runstats) <- sample.names
for(run in stats) {
  cat("Reading in:", run, "
")
  runstats[[run]] <- read.delim(run, )
}

unqs <- unique(c(sapply(runs, colnames), recursive=TRUE))
n<-sum(unlist(lapply(X=runs, FUN = nrow)))
st <- matrix(0L, nrow=n, ncol=length(unqs))
rownames(st) <- c(sapply(runs, rownames), recursive=TRUE)
colnames(st) <- unqs
for(sti in runs) {
  st[rownames(sti), colnames(sti)] <- sti
}
st <- st[,order(colSums(st), decreasing=TRUE)]

##st.all<-mergeSequenceTables(runs)
# Remove chimeras
seqtab <- removeBimeraDenovo(st, method="consensus", multithread=TRUE)
# Assign taxonomy
silva <- assignTaxonomy(seqtab, "/local/projects-t3/MSL/16S_dev/gits/IGS_dada2_pipeline/taxonomy/silva_nr_v138_train_set.fa.gz", multithread=TRUE)
# Write to disk
saveRDS(seqtab, "all_runs_dada2_abundance_table.rds") # CHANGE ME to where you want sequence table saved
write.csv(seqtab, "all_runs_dada2_abundance_table.csv", quote=FALSE)
write.csv(silva, "silva_classification.csv", quote=FALSE)

fc = file("all_runs_dada2_ASV.fasta")
fltp = character()
for( i in 1:ncol(seqtab))
{
  fltp <- append(fltp, paste0(">", colnames(seqtab)[i]))
  fltp <- append(fltp, colnames(seqtab)[i])
}
writeLines(fltp, fc)
rm(fltp)
close(fc)

track<-as.matrix(rowSums(seqtab))
colnames(track) <- c("nonchimeric")
write.table(track, "dada2_part2_stats.txt", quote=FALSE, append=FALSE, sep="	", row.names=TRUE, col.names=TRUE)
 