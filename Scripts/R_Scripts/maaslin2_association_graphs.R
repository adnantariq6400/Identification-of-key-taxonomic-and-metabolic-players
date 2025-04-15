# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)
library(patchwork)  # Load patchwork library

#############################   Siderophore   #########################
# Read the data
abundance_data <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/Siderophore_Abundant.csv")
metadata <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/metadata_postmen_control_case.csv")
significant_results <- read_csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/Siderophore_Significant.csv")

# Merge data if necessary
merged_data <- merge(abundance_data, metadata, by = "Sample")

# Ensure necessary columns are present
if (!all(c("Group", "Siderophore") %in% colnames(merged_data))) {
  stop("Required columns are missing in the merged data.")
}

# Add a new column for custom facet label
custom_label <- "Siderophore"
merged_data$FacetLabel <- custom_label

# Define colors
boxplot_colors <- c("Postmenopause_Control" = "#AE93BEFF", "Postmenopause_Case" = "#E7A79BFF")
jitter_colors <- c("Postmenopause_Control" = "#7B5380FF", "Postmenopause_Case" = "#A35857FF")

# Plotting
ggplot(merged_data, aes(x = Group, y = Siderophore, fill = Group)) +
  geom_boxplot(width = 0.6, outlier.shape = NA) +
  geom_jitter(aes(color = Group), width = 0.2, size = 2.5, alpha = 0.7) +
  scale_fill_manual(values = boxplot_colors) +
  scale_color_manual(values = jitter_colors) +
  labs(y = "Relative Abundance", x = NULL, fill = "Group", color = "Group") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, size = 0.5),
    strip.background = element_rect(color = "black", fill = "lightgray", size = 0.5),
    strip.text = element_text(size = 10, face = "bold"),
    strip.placement = "outside",
    plot.margin = margin(1, 1, 1, 1, "cm"),
    plot.title = element_text(hjust = 0.5)
  ) +
  facet_wrap(~FacetLabel, strip.position = "top") +
  annotate("text",
           x = 1.5,
           y = max(merged_data$Siderophore, na.rm = TRUE) * 1.05,
           label = paste("FDR:", significant_results$FDR[1],
                         "\nCoefficient:", significant_results$Coefficient[1],
                         "\nValue:", significant_results$Value[1]),
           hjust = 0.5,
           vjust = 0.8,
           size = 3)


#############################   Thiopeptide   #########################
# Read the data
abundance_data <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/Thiopeptide_Abundant.csv")
metadata <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/metadata_postmen_control_case.csv")
significant_results <- read_csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/Thiopeptide_Significant.csv")

# Merge data if necessary
merged_data <- merge(abundance_data, metadata, by = "Sample")

# Ensure necessary columns are present
if (!all(c("Group", "Thiopeptide") %in% colnames(merged_data))) {
  stop("Required columns are missing in the merged data.")
}

# Add a new column for custom facet label
custom_label <- "Thiopeptide"
merged_data$FacetLabel <- custom_label

# Define colors
boxplot_colors <- c("Postmenopause_Control" = "#AE93BEFF", "Postmenopause_Case" = "#E7A79BFF")
jitter_colors <- c("Postmenopause_Control" = "#7B5380FF", "Postmenopause_Case" = "#A35857FF")

# Plotting
ggplot(merged_data, aes(x = Group, y = Thiopeptide, fill = Group)) +
  geom_boxplot(width = 0.6, outlier.shape = NA) +
  geom_jitter(aes(color = Group), width = 0.2, size = 2.5, alpha = 0.7) +
  scale_fill_manual(values = boxplot_colors) +
  scale_color_manual(values = jitter_colors) +
  labs(y = "Relative Abundance", x = NULL, fill = "Group", color = "Group") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, size = 0.5),
    strip.background = element_rect(color = "black", fill = "lightgray", size = 0.5),
    strip.text = element_text(size = 10, face = "bold"),
    strip.placement = "outside",
    plot.margin = margin(1, 1, 1, 1, "cm"),
    plot.title = element_text(hjust = 0.5)
  ) +
  facet_wrap(~FacetLabel, strip.position = "top") +
  annotate("text",
           x = 1.5,
           y = max(merged_data$Thiopeptide, na.rm = TRUE) * 1.05,
           label = paste("FDR:", significant_results$FDR[1],
                         "\nCoefficient:", significant_results$Coefficient[1],
                         "\nValue:", significant_results$Value[1]),
           hjust = 0.5,
           vjust = 0.8,
           size = 3)


#############################   NRPS   #########################
# Read the data
abundance_data <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/NRPS_Abundant.csv")
metadata <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/metadata_postmen_control_case.csv")
significant_results <- read_csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/NRPS_Significant.csv")

# Merge data if necessary
merged_data <- merge(abundance_data, metadata, by = "Sample")

# Ensure necessary columns are present
if (!all(c("Group", "NRPS") %in% colnames(merged_data))) {
  stop("Required columns are missing in the merged data.")
}

# Add a new column for custom facet label
custom_label <- "NRPS"
merged_data$FacetLabel <- custom_label

# Define colors
boxplot_colors <- c("Postmenopause_Control" = "#AE93BEFF", "Postmenopause_Case" = "#E7A79BFF")
jitter_colors <- c("Postmenopause_Control" = "#7B5380FF", "Postmenopause_Case" = "#A35857FF")

# Plotting
ggplot(merged_data, aes(x = Group, y = NRPS, fill = Group)) +
  geom_boxplot(width = 0.6, outlier.shape = NA) +
  geom_jitter(aes(color = Group), width = 0.2, size = 2.5, alpha = 0.7) +
  scale_fill_manual(values = boxplot_colors) +
  scale_color_manual(values = jitter_colors) +
  labs(y = "Relative Abundance", x = NULL, fill = "Group", color = "Group") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, size = 0.5),
    strip.background = element_rect(color = "black", fill = "lightgray", size = 0.5),
    strip.text = element_text(size = 10, face = "bold"),
    strip.placement = "outside",
    plot.margin = margin(1, 1, 1, 1, "cm"),
    plot.title = element_text(hjust = 0.5)
  ) +
  facet_wrap(~FacetLabel, strip.position = "top") +
  annotate("text",
           x = 1.5,
           y = max(merged_data$NRPS, na.rm = TRUE) * 1.05,
           label = paste("FDR:", significant_results$FDR[1],
                         "\nCoefficient:", significant_results$Coefficient[1],
                         "\nValue:", significant_results$Value[1]),
           hjust = 0.5,
           vjust = 0.8,
           size = 3)


#############################   Cyclic.lactone.autoinducer   #########################
# Read the data
abundance_data <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/Cycliclactone_Abundant.csv")
metadata <- read.csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/metadata_postmen_control_case.csv")
significant_results <- read_csv("E:/Taxa_associations/postmen_ctrl_case/bgc/inputs/Cycliclactone_Significant.csv")

# Merge data if necessary
merged_data <- merge(abundance_data, metadata, by = "Sample")

# Ensure necessary columns are present
if (!all(c("Group", "Cyclic.lactone.autoinducer") %in% colnames(merged_data))) {
  stop("Required columns are missing in the merged data.")
}

# Add a new column for custom facet label
custom_label <- "Cyclic lactone autoinducer"
merged_data$FacetLabel <- custom_label

# Define colors
boxplot_colors <- c("Postmenopause_Control" = "#AE93BEFF", "Postmenopause_Case" = "#E7A79BFF")
jitter_colors <- c("Postmenopause_Control" = "#7B5380FF", "Postmenopause_Case" = "#A35857FF")

# Plotting
ggplot(merged_data, aes(x = Group, y = Cyclic.lactone.autoinducer, fill = Group)) +
  geom_boxplot(width = 0.6, outlier.shape = NA) +
  geom_jitter(aes(color = Group), width = 0.2, size = 2.5, alpha = 0.7) +
  scale_fill_manual(values = boxplot_colors) +
  scale_color_manual(values = jitter_colors) +
  labs(y = "Relative Abundance", x = NULL, fill = "Group", color = "Group") +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, size = 0.5),
    strip.background = element_rect(color = "black", fill = "lightgray", size = 0.5),
    strip.text = element_text(size = 10, face = "bold"),
    strip.placement = "outside",
    plot.margin = margin(1, 1, 1, 1, "cm"),
    plot.title = element_text(hjust = 0.5)
  ) +
  facet_wrap(~FacetLabel, strip.position = "top") +
  annotate("text",
           x = 1.5,
           y = max(merged_data$Cyclic.lactone.autoinducer, na.rm = TRUE) * 1.05,
           label = paste("FDR:", significant_results$FDR[1],
                         "\nCoefficient:", significant_results$Coefficient[1],
                         "\nValue:", significant_results$Value[1]),
           hjust = 0.5,
           vjust = 0.8,
           size = 3)

