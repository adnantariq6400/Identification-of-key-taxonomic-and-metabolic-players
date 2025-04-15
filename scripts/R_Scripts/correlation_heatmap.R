# Install and load necessary packages
install.packages("corrplot")
library(corrplot)

# Read the abundance values matrix from the CSV file
file_path <- "E:/Correlation_data/all_correlation/specie/abundance_matrix_out/premen_ctrl_species_abund_matrix.csv"
abundance_matrix <- as.matrix(read.csv(file_path, row.names = 1, header = TRUE))

# Create the correlation matrix
correlation_matrix <- cor(abundance_matrix)

# Define the output file name
output_file <- paste0(tools::file_path_sans_ext(file_path), "_corr.csv")

# Write the correlation matrix to a CSV file
write.csv(correlation_matrix, file = output_file)

# Print or further process the correlation_matrix
print(paste("correlation matrix stored in:", output_file))


# Create the correlation heatmap
corrplot(correlation_matrix, method = "circle", type = "lower", 
         tl.col = "black", tl.srt = 45, diag = TRUE)

