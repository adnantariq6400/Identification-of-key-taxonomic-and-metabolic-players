if(!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Maaslin2")


library(Maaslin2)
input_data <- as.data.frame(grouped_data)
input_metadata <-HR_metadata
fit_data <- Maaslin2(
  input_data, input_metadata, "C:/FYP/CAZyme/MaAsLin2/output/HR_results",
  normalization='NONE',
  analysis_method='LM',
  fixed_effects = c('Time'),
  random_effects = c('PatientID'),
  save_scatter = TRUE
)

#################################Drug#########################
library(Maaslin2)
input_data <- as.data.frame(grouped_data)
input_metadata <-Vildagliptin_data
fit_data <- Maaslin2(
  input_data, input_metadata, "C:/FYP/CAZyme/MaAsLin2/output/Vild_results",
  normalization='NONE',
  analysis_method='LM',
  fixed_effects = c('Time','Respond'),
  random_effects = c('PatientID'),
  save_scatter = TRUE
)

