library(SingleCellExperiment)
library(SingleR)
library(BiocParallel)
load("bped.rda")
load("normed_pbmc3k.rda")
mm = as.matrix(assays(normed_pbmc3k)$logcounts)
rownames(mm) = make.names(rowData(normed_pbmc3k)$Symbol)
okg = intersect(rownames(bped), rownames(mm))
mmm = mm[okg,]
bp2 = bped[okg,]
tt = trainSingleR(bp2, bp2$label.main)  # blueprint encode
cld = classifySingleR(mmm, tt, BPPARAM=MulticoreParam(4))
simb = read.csv("~/Downloads/simba_fig2b_classes.csv")
rownames(simb) = simb$X
colnames(normed_pbmc3k) = normed_pbmc3k$Barcode
simb2 = simb[colnames(normed_pbmc3k),]
table(cld$labels, simb2$celltype)
tt2 = trainSingleR(bp2, bp2$label.fine)  # blueprint encode
cld2 = classifySingleR(mmm, tt2, BPPARAM=MulticoreParam(4))
table(cld2$labels, simb2$celltype)
