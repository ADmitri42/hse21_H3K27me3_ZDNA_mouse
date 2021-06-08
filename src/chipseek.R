library(ChIPseeker)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(clusterProfiler)
library(ggplot2)
library(dplyr)
library(tidyr)   # replace_na
library(tibble)  # column_to_rownames

###

DATA_DIR <- 'data/'
OUT_DIR <- 'images/'

NAMES <- list('H3K27me3_C2C12.ENCFF736SSJ.mm10', 'H3K27me3_C2C12.ENCFF110HRW.mm10')
#NAMES <- list("mouseZ-DNA1")

txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene

for (NAME in NAMES){
  BED_FN <- paste0(DATA_DIR, NAME, '.bed')
  peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")
  
  #pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
  png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
  plotAnnoPie(peakAnno)
  dev.off()
}
