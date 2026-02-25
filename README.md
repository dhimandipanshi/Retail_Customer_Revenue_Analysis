# 🔐 Cybercrime & Fraud in Canada — Data Analysis (2021–2025)

> *Identifying fraud patterns, victim demographics, and financial loss trends across Canada to support evidence-based prevention strategies and policy decisions.*

---

## Table of Contents

1. [Project Background](#1-project-background)
2. [Executive Summary](#2-executive-summary)
3. [Dataset & Methodology](#3-dataset--methodology)
4. [Data Cleaning & Preparation](#4-data-cleaning--preparation)
5. [Findings & Analysis](#5-findings--analysis)
6. [Key Insights](#6-key-insights)
7. [Business Recommendations](#7-business-recommendations)
8. [Dashboard](#8-dashboard)
9. [Limitations & Assumptions](#9-limitations--assumptions)
10. [Tools & Technologies](#10-tools--technologies)

---

## 1. Project Background

### Context

Cybercrime and fraud represent one of the fastest-growing threats to Canadian individuals and institutions. From investment scams to phishing attacks, perpetrators exploit digital channels to extract billions of dollars annually from victims across every province, age group, and demographic.

This project analyzes a national cybercrime dataset spanning **2021–2025**, covering **295,480 reported victims**, a combined financial loss of **CAD $637.55 million**, and fraud incidents reported across all major Canadian provinces.

### Problem Statement

Despite growing public awareness, fraud complaints surged in 2021 before declining sharply — yet financial losses remained substantial. The core analytical question was:

> *"Where are Canadians most vulnerable — and which fraud types, demographics, and channels are driving the greatest harm?"*

### Objectives

- Quantify total victim volume and financial loss by fraud category
- Identify the demographic groups and provinces most affected
- Analyze solicitation method trends across internet, phone, email, and social channels
- Examine gender-based disparities in reported financial losses
- Deliver prioritized, evidence-based recommendations aligned with Canadian federal frameworks
- Build a Power BI dashboard for ongoing fraud trend monitoring

---

## 2. Executive Summary

| Metric | Value |
|--------|-------|
| Total Victims Analyzed | 295,480 |
| Total Dollar Loss | CAD $637.55M |
| Average Dollar Loss (Canada) | CAD $8,780 per victim |
| Analysis Period | 2021–2025 |
| Highest-Loss Fraud Category | Investment Fraud (~$300M) |
| Peak Victim Age Group | 50–59 years |
| Highest-Complaint Province | Ontario (89K complaints) |
| Gender with Higher Loss Share | Female (60.03%) |
| Complaint Decline (2021→2025) | ~90% drop in reported volume |

### The Core Finding

> **Investment fraud alone accounts for nearly half of all financial losses — while women bear over 60% of total damages and middle-aged Canadians are the most targeted demographic.**

These are not random patterns. They reveal specific, addressable vulnerabilities in how fraud is solicited, who it targets, and where prevention resources are most needed.

---

```
╔══════════════════════════════════════════════════════════════════╗
║           FRAUD LOSS BY CATEGORY — FULL OVERVIEW                 ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Investments       ████████████████████████  ~$300M  🔴 Critical ║
║  Spear Phishing    ████████████              ~$120M  🔴 High     ║
║  Romance           ████████                  ~$80M   🟠 Moderate ║
║  Job Fraud         █████                     ~$50M   🟡 Moderate ║
║  Service Fraud     ███                       ~$30M   🟡 Lower    ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  TOTAL LOSS: $637.55M  |  295,480 VICTIMS  |  2021–2025          ║
║  INVESTMENT FRAUD OUTPACES ALL OTHER CATEGORIES COMBINED         ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## 3. Dataset & Methodology

### Data Sources

| Table | Description | Volume |
|-------|-------------|--------|
| `fraud_reports` | Victim-level complaint records | 295K+ records |
| `demographic_profiles` | Age, gender, province per victim | 295K+ records |
| `solicitation_methods` | Channel used per fraud incident | 295K+ records |
| `financial_losses` | Dollar loss per incident and category | 295K+ records |

### Key Fields

- Fraud category — Investments, Spear Phishing, Romance, Job, Service
- Solicitation method — Internet, Direct Call, Email, Social Media, Other
- Victim demographics — Age group, gender
- Geographic data — Province/territory
- Financial impact — Dollar loss per incident
- Temporal data — Year of complaint (2021–2025)

### Analytical Approach

```
RAW FRAUD REPORT DATA
        ↓
STAGING TABLES (data integrity preserved)
        ↓
CLEANING & VALIDATION (Python + SQL)
        ↓
EXPLORATORY DATA ANALYSIS
        ↓
SEGMENTATION BY CATEGORY, DEMOGRAPHICS, CHANNEL & GEOGRAPHY
        ↓
INSIGHTS & BUSINESS NARRATIVE
        ↓
POWER BI DASHBOARD (stakeholder delivery)
```

---

## 4. Data Cleaning & Preparation

**Script:** `/notebooks/data_cleaning.ipynb`

All preparation was performed in **Python (Pandas & NumPy)** using a staging workflow to preserve raw data integrity throughout.

### Cleaning Steps

| Step | Action | Business Outcome |
|------|--------|-----------------|
| Staging tables | Preserved raw records before transformation | Zero data loss, full auditability |
| Missing value imputation | Median imputation per fraud category | No gaps in financial loss analysis |
| Categorical standardization | Normalized province, gender, channel fields | Consistent, reliable segmentation |
| Column renaming | Standardized all fields to `snake_case` | Clean, readable schema |
| Feature engineering | Created `age_group`, `loss_severity_tier`, `complaint_year` | Richer segmentation capability |
| Redundancy removal | Dropped correlated/duplicate columns post-analysis | Lean, efficient dataset |
| Database integration | Loaded cleaned data into PostgreSQL | Scalable SQL querying and reporting |

---

## 5. Findings & Analysis

**SQL Script:** `/sql/eda.sql`

### Loss by Fraud Category

```
╔══════════════════════════════════════════════════════════════════╗
║                  FRAUD CATEGORY BREAKDOWN                        ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Investments       ~$300M   ████████████████████  🔴 #1 threat  ║
║  Spear Phishing    ~$120M   ████████              🔴 High        ║
║  Romance            ~$80M   █████                 🟠 Moderate    ║
║  Job Fraud          ~$50M   ███                   🟡 Moderate    ║
║  Service Fraud      ~$30M   ██                    🟡 Lower       ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  Investment fraud causes 2.5x more damage than the next category ║
╚══════════════════════════════════════════════════════════════════╝
```

---

### Victims by Age Group

```
╔══════════════════════════════════════════════════════════════════╗
║                  VICTIM AGE DISTRIBUTION                         ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  10–29    ██████                  Low exposure                   ║
║  30–39    █████████████           Moderate                       ║
║  40–49    ████████████████████    Elevated                       ║
║  50–59    ████████████████████████  ~40K  ⚠️ PEAK VULNERABILITY  ║
║  60–69    ███████████████████     Elevated                       ║
║  70–79    █████████████           Moderate                       ║
║  80–99    ████                    Lower (possible underreporting) ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  Ages 40–79 represent the highest-risk demographic band          ║
╚══════════════════════════════════════════════════════════════════╝
```

---

### Complaints by Year

```
╔══════════════════════════════════════════════════════════════════╗
║                COMPLAINT VOLUME TREND (2021–2025)                ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  2021    ████████████████████████   ~95,000  📈 Peak             ║
║  2022    ███████████████████        ~75,000  ↘ Declining         ║
║  2023    ████████████               ~50,000  ↘ Declining         ║
║  2024    ███████                    ~30,000  ↘ Declining         ║
║  2025    ██                         ~10,000  ↘ Sharp drop        ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  90%+ decline in 4 years — prevention gains or underreporting?   ║
╚══════════════════════════════════════════════════════════════════╝
```

---

### Geographic Distribution

```
╔══════════════════════════════════════════════════════════════════╗
║               COMPLAINTS BY PROVINCE (TOP 8)                     ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Ontario            ████████████████████████   89K  🔴 Highest  ║
║  Quebec             ████████████████           58K  🔴 High     ║
║  British Columbia   █████████                  31K  🟠 Moderate ║
║  Alberta            ███████                    26K  🟠 Moderate ║
║  Manitoba           ███                         9K  🟡 Lower    ║
║  Saskatchewan       ██                          6K  🟡 Lower    ║
║  Nova Scotia        █                           5K              ║
║  New Brunswick      █                           5K              ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  Ontario + Quebec = ~50% of all national complaints              ║
╚══════════════════════════════════════════════════════════════════╝
```

---

### Solicitation Method Breakdown

```
╔══════════════════════════════════════════════════════════════════╗
║                  SOLICITATION CHANNELS                           ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Other          29.99%   ██████████████████  Emerging vectors    ║
║  Internet       28.33%   █████████████████   ⚠️ Dominant channel ║
║  Direct Call    15.15%   █████████           Active threat       ║
║  Email          13.71%   ████████            Persistent vector   ║
║  Social Media   12.83%   ████████            Growing risk        ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  No single channel dominates — perpetrators use multi-vector     ║
║  approaches requiring multi-channel prevention responses         ║
╚══════════════════════════════════════════════════════════════════╝
```

---

### Loss by Gender

```
╔══════════════════════════════════════════════════════════════════╗
║                    LOSS BY GENDER                                ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Female   60.03%   ████████████████████████   ⚠️ Majority share ║
║  Male     39.97%   ████████████████                              ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  Women absorb a disproportionate share of total financial losses ║
║  Linked to higher exposure to romance & social engineering fraud ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## 6. Key Insights

### Insight 1 — Investment Fraud Is Canada's Costliest Cybercrime 🔴

> **Investment fraud accounts for ~$300M in losses — nearly half of all recorded damages and 2.5x the next highest category.**

These are not impulsive scams. Investment fraud targets individuals with accumulated savings through elaborate, trust-building deception — often sustained over weeks or months. Victims tend to be older, financially literate, and higher-net-worth, making per-incident losses exceptionally high.

**Implication:** Dedicated enforcement coordination between OSC, AMF, BCSC, and FINTRAC is critical to disrupt fraudulent investment solicitation before it reaches victims.

---

### Insight 2 — Middle-Aged Canadians Are the Most Targeted Demographic 🔴

> **Victimization peaks sharply at ages 50–59, with ~40,000 victims in this cohort alone. Risk remains elevated across the full 40–79 band.**

This demographic coincides with peak retirement savings accumulation — making it the highest-value target for investment and romance fraud. The 50–59 cohort is digitally active enough to be reachable online, yet may have less exposure to modern fraud tactics than younger users.

**Implication:** Public awareness campaigns must prioritize this age band with targeted, platform-appropriate messaging through channels where this demographic is most active.

---

### Insight 3 — The 90% Complaint Decline Requires Careful Interpretation 🟠

> **Complaints fell from ~95,000 in 2021 to ~10,000 in 2025 — a 90%+ reduction in four years.**

This trend does not straightforwardly indicate a 90% reduction in fraud. It may reflect improved prevention, but could equally signal **underreporting fatigue**, reduced trust in reporting mechanisms, or a shift toward fraud vectors that are harder to detect and report.

**Implication:** Before treating this as a success metric, reporting accessibility and completeness should be audited. Anonymous and streamlined reporting pathways may reveal a truer picture of current fraud prevalence.

---

### Insight 4 — Women Bear a Disproportionate Share of Losses 🟠

> **Female victims account for 60.03% of total financial losses despite representing roughly half the population.**

This disparity likely reflects disproportionate targeting through romance fraud and social engineering — tactics that exploit trust relationships rather than technical vulnerabilities. This is a structural pattern, not a coincidence.

**Implication:** Gender-responsive fraud prevention materials and campaigns are not optional — they are a necessary component of a complete national strategy.

---

### Insight 5 — Multi-Vector Solicitation Demands Multi-Channel Prevention 🟡

> **No single solicitation method exceeds 30% share. Fraud is distributed across internet, phone, email, social media, and emerging channels.**

The "Other" category (29.99%) — the largest single segment — likely captures newer vectors such as messaging apps, QR code phishing, and AI-assisted voice fraud that current taxonomies have not yet classified.

**Implication:** Siloed prevention efforts targeting only one channel will not be sufficient. A coordinated, cross-channel prevention framework is required.

---

## 7. Business Recommendations

### Priority Matrix

| Priority | Recommendation | Effort | Impact |
|----------|---------------|--------|--------|
| 🔴 P1 | Strengthen investment fraud enforcement | Medium | Very High |
| 🔴 P2 | Launch age-targeted awareness campaigns (40–79) | Low | Very High |
| 🟠 P3 | Audit and address complaint underreporting | Medium | High |
| 🟠 P4 | Develop gender-responsive prevention programs | Low | High |
| 🟡 P5 | Classify and monitor emerging solicitation vectors | Medium | Medium |
| 🟡 P6 | Enhance Ontario & Quebec provincial coordination | Low | Medium |

---

### P1 — Strengthen Investment Fraud Enforcement 🔴

**Target agencies:** OSC, AMF, BCSC, FINTRAC, RCMP Cybercrime Division

- Increase proactive monitoring of unregistered investment solicitations, particularly via social media and direct outreach targeting older Canadians
- Fast-track cross-provincial intelligence sharing between securities regulators and law enforcement
- Mandate registered investment platforms to display verified registration status prominently
- Publish real-time fraud alert registries accessible to the public

---

### P2 — Launch Age-Targeted Awareness Campaigns 🔴

**Target agencies:** CAFC, CARP, Public Safety Canada

- Design fraud awareness materials specifically for Canadians aged 40–79, distributed through community centres, financial institutions, and healthcare settings
- Partner with CARP (Canadian Association of Retired Persons) to amplify reach within the highest-risk demographic
- Align campaign timing with **Fraud Prevention Month (March)** and tax season — peak periods for investment and service fraud
- Use plain-language, scenario-based content rather than technical messaging

---

### P3 — Audit Complaint Underreporting 🟠

**Target agencies:** CAFC, Statistics Canada, OPC

- Commission a study to distinguish genuine fraud reduction from reporting decline
- Introduce anonymous reporting pathways to reduce stigma and barriers for victims
- Integrate fraud reporting prompts into banking apps and digital platforms where fraud is most often first detected
- Set national reporting rate benchmarks informed by international comparators (e.g., UK Action Fraud, US FTC)

---

### P4 — Develop Gender-Responsive Prevention Programs 🟠

**Target agencies:** Status of Women Canada, CAFC, Provincial Consumer Protection Offices

- Incorporate gender-sensitive messaging into all national fraud prevention campaigns
- Address romance fraud and social engineering tactics specifically in materials targeting women
- Partner with women's financial literacy organizations to build fraud resilience
- Track and report gender-disaggregated fraud loss data annually as a standard metric

---

### Expected Cumulative Impact

```
╔══════════════════════════════════════════════════════════════════╗
║              PROJECTED PREVENTION IMPACT                         ║
╠══════════════════════════════════════════════════════════════════╣
║                                                                  ║
║  Investment fraud enforcement     -15–25% investment losses      ║
║  Age-targeted awareness           -10–15% 40–79 victimization    ║
║  Underreporting audit             +20–30% reporting completeness ║
║  Gender-responsive campaigns      -8–12% female loss share gap   ║
║                                                                  ║
╠══════════════════════════════════════════════════════════════════╣
║  Combined potential: materially reduce Canada's ~$637M           ║
║  annual fraud loss WITHOUT increasing enforcement budgets        ║
╚══════════════════════════════════════════════════════════════════╝
```

---

## 8. Dashboard

An interactive **Power BI dashboard** was built to enable stakeholder exploration and self-serve analysis across all key fraud dimensions.

**Dashboard Features:**
- Loss severity visualization by fraud category (bar chart)
- Victim age distribution across the full demographic spectrum (area chart)
- Year-over-year complaint trend analysis 2021–2025 (line chart)
- Province-level complaint volume with geographic ranking (horizontal bar)
- Solicitation method frequency breakdown (donut chart)
- Gender-based financial loss distribution (pie chart)
- KPI summary cards — total victims, total dollar loss, average Canadian loss

🔗 **[View Interactive Power BI Dashboard](#)**

---

## 9. Limitations & Assumptions

> Acknowledging analytical boundaries is a hallmark of rigorous, trustworthy analysis.

| Limitation | Potential Impact | Mitigation Applied |
|------------|-----------------|-------------------|
| Self-reported complaints only | True fraud prevalence likely much higher | Underreporting acknowledged throughout |
| No per-incident LTV data | Revenue impact estimates are approximated | Population-level averages used for projections |
| Gender binary classification | Non-binary victims may be undercounted | Reflects source data structure; noted as limitation |
| 5-year analysis window | Long-term cyclical patterns may not be captured | Recommend extending to rolling 10-year analysis |
| "Other" solicitation category | Emerging vectors are underclassified | Flagged as research priority in recommendations |
| Provincial data only | Municipal-level patterns not visible | City-level analysis recommended for Ontario and Quebec |
| Impact estimates are directional | Not guaranteed outcomes | Based on comparable national fraud prevention studies |

---

## 10. Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Python (Pandas, NumPy, Matplotlib, Seaborn)** | Data cleaning, EDA, feature engineering, visualization |
| **SQL** | Structured storage, SQL analysis, aggregations |
| **Power BI** | Interactive dashboard, stakeholder reporting |
| **Git & GitHub** | Version control and portfolio publishing |

---

## Project Structure

```
cybercrime-fraud-canada-2021-2025/
│
├── data/
│   ├── raw_data.csv                  # Original fraud report data
│   └── cleaned_data.csv              # Processed, analysis-ready dataset
│
├── notebooks/
│   └── data_cleaning_eda.ipynb       # Python cleaning and EDA workflow
│
├── sql/
│   └── analysis_queries.sql          # Segmentation, aggregations, trend queries
│
├── dashboard/
│   └── cybercrime_dashboard.pbix     # Power BI workbook
│
├── assets/
│   └── dashboard.png                 # Dashboard preview image
│
└── README.md                         # Project report (this file)
```

---

## Author

**Dipanshi Dhiman**
Data Analyst | Toronto, Ontario, Canada

Focused on public sector analytics, fraud intelligence, and translating complex datasets into actionable strategies that drive measurable outcomes.

📧 dhimandipanshi713@gmail.com
💼 [LinkedIn](https://www.linkedin.com/in/dipanshidhiman)
🐙 [GitHub](https://github.com/dhimandipanshi)

---

*Portfolio Project — Canadian Cybercrime & Fraud Intelligence Analysis | 2025*
