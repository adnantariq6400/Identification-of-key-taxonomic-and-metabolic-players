#Metagenome Project
# Identification of Key Taxonomic and Metabolic Players in the Gut Metagenome of T2D Patients

This repository presents a comprehensive bioinformatics analysis of gut metagenomic data from Chinese Type 2 Diabetes (T2D) patients. The study investigates microbial taxonomic composition, functional potential, gene/protein annotations (including CAZyme families), and applies machine learning to associate microbial patterns with clinical metadata.

---

## 📊 Project Overview

- **Study Design:** Longitudinal analysis of gut microbiota in T2D patients pre- and post-treatment.
- **Samples:** 162 fecal samples from 91 patients, treated with either Acarbose or Vildagliptin.
- **Goals:**  
  - Reconstruct metagenomes from sequencing data  
  - Identify microbial taxa and metabolic functions  
  - Annotate CAZyme families  
  - Analyze species and functions using statistical and ML approaches

---

## 🧬 Materials and Methods

- **Data Acquisition:** Retrieved from NCBI BioProject.
- **Preprocessing:** Quality control (FastQC, fastp), host read removal (BBDuk).
- **Assembly:** De novo assembly using metaSPAdes via KBase.
- **Taxonomic Profiling:** MetaPhlAn v4 with Bowtie2.
- **Functional Profiling:** HUMAnN v3.9 using UniRef50_EC.
- **Gene Prediction:** Prodigal with `meta` mode.
- **Non-redundant Catalog:** Clustered genes/proteins using MMseqs2 (90% identity, 80% coverage).
- **CAZyme Annotation:** DIAMOND BLASTP against CAZyme DB.
- **Quantification:** CoverM used to estimate gene counts.
- **Machine Learning:** Random Forest, SVM, XGBoost, etc. applied to species/protein metadata.
- **Statistical Analyses:**  
  - **HALLA:** Mutual information-based association analysis  
  - **MaAsLin2:** Linear model-based multivariate association testing

> Ready to apply this analysis to your own data? All the necessary code and scripts to replicate these steps are available in the [**scripts**](./scripts/) folder of this repository.

---

## 📈 Results and Discussion (Highlights)

- Significant variation in microbial taxa after drug treatment (Acarbose vs. Vildagliptin).
- Identification of key metabolic pathways, especially carbohydrate metabolism.
- CAZyme families (e.g., GH13, GH2) were enriched in high responders.
- ML models (e.g., XGBoost, Random Forest) achieved high accuracy in predicting drug response based on microbiome profiles.
- HALLA and MaAsLin2 revealed associations between specific microbes and clinical markers (GLP-1, BMI, etc.)

> Full visualizations and detailed results are available in the `results/` and `images/` directories.

---

## ▶️ Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Identification-of-key-taxonomic-and-metabolic-players-in-the-gut-metagenome-of-T2D-Patients.git
   cd Identification-of-key-taxonomic-and-metabolic-players
   ```

2. Ensure required tools are installed:  
   - FastQC  
   - fastp  
   - BBMap (BBDuk)  
   - metaSPAdes / KBase  
   - MetaPhlAn  
   - HUMAnN  
   - Prodigal  
   - MMseqs2  
   - DIAMOND  
   - CoverM  
   - Python, R (for ML and stats analysis)  

---

## 📜 License

This project is open-source and available under the MIT License. You're free to use and adapt the code, data, and results with proper attribution.

---

## 🙏 Acknowledgments

- Zhang et al. (2022) for the dataset  
- Developers of all the open-source tools used  
- Community resources and collaborators who supported this project

---

> 🔬 Designed and analyzed by a Bioinformatics MS graduate with expertise in metagenomics and ML applications in microbiome research.

