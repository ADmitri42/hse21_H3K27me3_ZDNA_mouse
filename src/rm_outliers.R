library(ggplot2)
library(dplyr)
library(tidyr)   # replace_na
library(tibble)  # column_to_rownames

###

DATA_DIR <- 'data/'
OUT_DIR <- 'images/'

NAMES <- list('H3K27me3_C2C12.ENCFF736SSJ.mm10', 'H3K27me3_C2C12.ENCFF110HRW.mm10')

###
for (NAME in NAMES){
  bed_df <- read.delim(paste0(DATA_DIR, NAME, '.bed'), as.is = TRUE, header = FALSE)
  colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
  bed_df$len <- bed_df$end - bed_df$start
  head(bed_df)
  
  # Remove long peaks
  bed_df <- bed_df %>%
    arrange(-len) %>%
    filter(len < 8000)
  
  ggplot(bed_df) +
    aes(x = len) +
    geom_histogram() +
    ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
    theme_bw()
  ggsave(paste0('filter_peaks.', NAME, '.filtered.hist.png'), path = OUT_DIR)
  
  bed_df %>%
    select(-len) %>%
    write.table(file=paste0(DATA_DIR, NAME ,'.filtered.bed'),
                col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)
}