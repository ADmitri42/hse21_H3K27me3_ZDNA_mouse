# hse21_H3K27me3_ZDNA_mouse

Repository for minor Bioinformatics

## Гистограмма длин участков 

Так как я сразу скачал нужную версию генома мыши, поэтому мне не нужно было переводить его в mm10, поэтому я построил две гистограммы

### ENCFF110HRW

![ENCFF110HRW](images/len_hist.H3K27me3_C2C12.ENCFF110HRW.mm10.png)

### ENCFF736SSJ

![ENCFF736SSJ](images/len_hist.H3K27me3_C2C12.ENCFF736SSJ.mm10.png)

## Outliers
Выкидываем последовательности длинны больше 8000

### ENCFF110HRW

![ENCFF110HRW](images/filter_peaks.H3K27me3_C2C12.ENCFF110HRW.mm10.filtered.hist.png)

### ENCFF736SSJ

![ENCFF736SSJ](images/filter_peaks.H3K27me3_C2C12.ENCFF736SSJ.mm10.filtered.hist.png)

## Рассмотрим расположение пиков гистоновой метки относительно аннотированных генов

### ENCFF110HRW

![ENCFF110HRW](images/chip_seeker.H3K27me3_C2C12.ENCFF110HRW.mm10.plotAnnoPie.png)

### ENCFF736SSJ

![ENCFF736SSJ](images/chip_seeker.H3K27me3_C2C12.ENCFF736SSJ.mm10.plotAnnoPie.png)