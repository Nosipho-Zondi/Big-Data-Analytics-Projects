# Diabetes Patient Readmission — Descriptive Analytics

## Business Questions Answered

1. What is the distribution of patients' age?
2. What is the distribution of patients who were readmitted?
3. How does readmission rate vary by gender?
4. What is the average time spent in the hospital?

## Contents

| File | Description |
| `diabetes_analysis.py` | Full analysis script — loads the data, generates all charts, prints summary stats |
| `Diabetes.csv` | Source dataset (not included in repo — see Data below) |
| `1_age_distribution.png` | Bar chart of patient counts by age group |
| `3_readmission_by_gender.png` | Stacked bar chart of readmission rate by gender |
| `4_discharge_disposition_30day.png` | Horizontal bar chart of discharge dispositions for <30-day readmits |
| `5_time_in_hospital.png` | Histogram of length of stay with average marked |

## Key Insights

- **Age**: Patients skew older, peaking in the **70–80** age group (~26,000 patients); very few are under 30.
- **Readmission**: 53.9% of patients were **not readmitted**, 34.9% were readmitted **after 30 days**, and 11.2% **within 30 days**.
- **Gender**: Readmission rates are nearly identical between Female and Male patients (~11% <30-day for both) — gender is not a strong driver.
- **Discharge disposition**: Most <30-day readmits were originally **discharged straight home** (~5,600 of 11,357), followed by transfers to a **skilled nursing facility** and **home with home health service** — patients sent home without extra support may be more likely to bounce back.
- **Length of stay**: Average of **4.40 days** (median 4.0), right-skewed, with most stays between 1–6 days.

## Setup & Usage

# Install dependencies
pip install pandas matplotlib seaborn

# Run the analysis
python diabetes_analysis.py
 

## Tech Stack

- Python 3
- pandas
- matplotlib
- seaborn

## 📄 License

This project is for educational purposes as part of a data analytics training exercise.
