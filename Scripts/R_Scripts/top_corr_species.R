# Install and load necessary packages
install.packages("corrplot")
install.packages("openxlsx")
library(corrplot)
library(openxlsx)

# Read the abundance values matrix from the CSV file
file_path <- "E:/Correlation_data/all_correlation/specie/abundance_matrix_out/premen_ctrl_species_abund_matrix.csv"
abundance_matrix <- as.matrix(read.csv(file_path, row.names = 1, header = TRUE))

# Calculate the total abundance of each species
total_abundance <- colSums(abundance_matrix)

# Sort species based on abundance and select the top 50
top_50_species <- names(sort(total_abundance, decreasing = TRUE)[1:50])

# Subset abundance matrix to include only the top 50 abundant species
abundance_matrix_top_50 <- abundance_matrix[, top_50_species]

# Create the correlation matrix
correlation_matrix <- cor(abundance_matrix_top_50)

# Initialize empty data frame to store correlations and p-values
correlation_results <- data.frame(Species1 = character(),
                                  Species2 = character(),
                                  Correlation = numeric(),
                                  P_Value = numeric(),
                                  stringsAsFactors = FALSE)

# Iterate over pairs of species
for (i in 1:(ncol(correlation_matrix) - 1)) {
  for (j in (i + 1):ncol(correlation_matrix)) {
    # Compute correlation coefficient and p-value using Pearson's method
    corr_test <- cor.test(abundance_matrix_top_50[, i], abundance_matrix_top_50[, j], method = "pearson")
    
    # Add to results data frame
    correlation_results <- rbind(correlation_results, 
                                 data.frame(Species1 = colnames(abundance_matrix_top_50)[i],
                                            Species2 = colnames(abundance_matrix_top_50)[j],
                                            Correlation = corr_test$estimate,
                                            P_Value = corr_test$p.value))
  }
}

# Format the P_Value column with scientific notation to capture very small numbers
correlation_results$P_Value <- format(correlation_results$P_Value, scientific = TRUE, digits = 15)

# Print formatted p-values to ensure they are displayed correctly
print("Formatted P-Values before saving:")
print(correlation_results$P_Value)

# Sort by p-value and select top 10
top_10_correlations <- correlation_results[order(correlation_results$P_Value), ][1:50, ]

# Define the output file name for Excel
output_file_xlsx <- paste0(tools::file_path_sans_ext(file_path), "_top_50_corr.xlsx")

# Write the formatted top 10 correlations to an Excel file
write.xlsx(top_10_correlations, file = output_file_xlsx)

# Print or further process the top 10 correlations
print(paste("Top 50 most significant correlations with p-values stored in:", output_file_xlsx))

