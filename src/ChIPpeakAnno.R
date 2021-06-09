library(ChIPpeakAnno)
#library(TxDb.Hsapiens.UCSC.hg19.knownGene)
#library(org.Hs.eg.db)
library(TxDb.Mmusculus.UCSC.mm10.knownGene)
library(org.Mm.eg.db)

###
DATA_DIR <- 'data/intersect/'
OUT_DIR <- 'images/'

#NAMES <- list('H3K27me3_C2C12.ENCFF736SSJ.mm10', 'H3K27me3_C2C12.ENCFF110HRW.mm10')
NAME <- 'H3K27me3_C2C12.intersect_with_DeepZ.bed'

peaks <- toGRanges(paste0(DATA_DIR, NAME), format="BED")
peaks[1:2]

annoData <- toGRanges(TxDb.Mmusculus.UCSC.mm10.knownGene)
annoData[1:2]


anno <- annotatePeakInBatch(peaks, AnnotationData=annoData, 
                            output="overlapping", 
                            FeatureLocForDistance="TSS",
                            bindingRegion=c(-2000, 300))
data.frame(anno) %>% head()

anno$symbol <- xget(anno$feature, org.Mm.egSYMBOL)
data.frame(anno) %>% head()

anno_df <- data.frame(anno)
write.table(anno_df, file=paste0(DATA_DIR, 'H3K27me3_C2C12.intersect_with_DeepZ.genes.txt'),
            col.names = TRUE, row.names = FALSE, sep = '\t', quote = FALSE)

uniq_genes_df <- unique(anno_df['symbol'])
write.table(uniq_genes_df, file=paste0(DATA_DIR, 'H3K27me3_C2C12.intersect_with_DeepZ.genes_uniq.txt'),
            col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)