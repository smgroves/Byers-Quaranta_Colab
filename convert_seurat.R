library(Seurat)
library(SeuratDisk)
load("~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/Patient_biopsy_relapsed.integrated.Cancer_cells.seurat.RData")
#workaround from https://github.com/mojaveazure/seurat-disk/issues/102
slot(sc$SCT@SCTModel.list[[1]], 'median_umi') = median(sc$SCT@SCTModel.list[[1]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[2]], 'median_umi') = median(sc$SCT@SCTModel.list[[2]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[3]], 'median_umi') = median(sc$SCT@SCTModel.list[[3]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[4]], 'median_umi') = median(sc$SCT@SCTModel.list[[4]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[5]], 'median_umi') = median(sc$SCT@SCTModel.list[[5]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[6]], 'median_umi') = median(sc$SCT@SCTModel.list[[6]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[7]], 'median_umi') = median(sc$SCT@SCTModel.list[[7]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[8]], 'median_umi') = median(sc$SCT@SCTModel.list[[8]]@cell.attributes$umi)
slot(sc$SCT@SCTModel.list[[9]], 'median_umi') = median(sc$SCT@SCTModel.list[[9]]@cell.attributes$umi)

slot(sc$integrated@SCTModel.list[[1]], 'median_umi') = median(sc$integrated@SCTModel.list[[1]]@cell.attributes$umi)

SaveH5Seurat(sc, filename = "biopsy_new.h5Seurat")
Convert("biopsy_new.h5Seurat", dest = "h5ad")

write.csv(umap, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/umap.csv")
write.csv(e_genes, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/e_genes.csv")
write.csv(EMT_score, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/EMT_score.csv")
write.csv(m_genes, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/m_genes.csv")
write.csv(myc_cells, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/myc_cells.csv")
write.csv(yap_taz_genes, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/yap_taz_genes.csv")
write.csv(yap1_cells, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/yap1_cells.csv")
write.csv(YAPTAZ_score, "~/Documents/GitHub/collabs/byers-collaboration/biopsy_updated/YAPTAZ_score.csv")

