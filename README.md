# E-commerce Marketplace Performance Analysis Dashboard

##  About This Project

Hi there! I am an aspiring data scientist and a recent graduate. I built this project to practice handling a complete data analytics project from start to finish.

I took a large, raw public dataset from Olist (a huge e-commerce marketplace in Brazil) and wanted to answer simple but important business questions: *What are we selling the most? Where are our customers located? When do people love to shop? How much money are we making?*

To figure this out, I used a mix of three tools that I’ve been working hard to master:

1. **Python** to clean up the messy data and glue different tables together.
2. **SQL** to run deep queries and calculate numbers like monthly trends and customer behavior.
3. **A Visual Dashboard** to put all my findings into a single, easy-to-read page for anyone to understand.

---

##  The Big Numbers (KPIs)

After cleaning the data and looking only at successfully delivered orders, here are the main stats I found:

* **Total Revenue:** $13.22 Million
* **Total Orders:** 110,197 orders
* **Average Order Value:** ~$120.00 per purchase
* **Unique Customers:** Around 93,000 people bought from the marketplace

Here is a look at the dashboard I designed to show these numbers:


---

##  Step-by-Step: How I Built It

### Step 1: Cleaning and Preprocessing (Python)

The original dataset came in multiple separate CSV files (customers, orders, items, products, etc.). I used **Pandas** to explore them and clean things up:

* I filtered the data to focus strictly on orders marked as **"delivered"**.
* I merged the orders, items, customers, and products tables into one master file.
* I handled missing values by filling empty product dimensions with the median value and labeling empty categories as "Unknown".

### Step 2: Deep-Dive Analysis (SQL)

Once I had my clean data, I imported it into SQL Server to practice my querying skills. I wrote scripts to find:

* Exact revenue and sales volumes broken down by year and month.
* Customer distribution (counting how many times an individual customer came back).
* Peak shopping hours and the most popular days of the week.

### Step 3: Data Visualization (Dashboard)

Finally, I built a dashboard to bring the numbers to life. I chose a dark theme and focused on clean charts: line graphs for monthly trends, bar charts for states, a pie chart for days of the week, and a distribution chart for shopping hours.

---

##  Cool Things I Discovered (Business Insights)

* **São Paulo is the Core Market:** Out of all the states in Brazil, São Paulo (`SP`) is massive. It brought in over **$5.06 Million in revenue** and **46,448 orders**. The business should definitely focus its main marketing and warehouse efforts there!
* **The "One-and-Done" Problem:** I found a massive retention bottleneck. A total of **81,748 customers bought something only once**. Only a small fraction came back to buy a second or third time. This tells me the company needs better loyalty programs or email marketing to bring people back.
* **Mondays are for Shopping:** People buy the most at the very start of the week. **Monday (17,973 orders) and Tuesday (17,858 orders)** are the busiest days, while weekends are the slowest. Also, most orders happen during the day between 10:00 AM and 4:00 PM.
* **Volume vs. Value:** *Cama, Mesa, Banho* (Bed, Table, & Bath) is the most ordered item category by volume (10,953 orders). However, *Beleza & Saúde* (Health & Beauty) brings in the highest total revenue ($1.23 Million).

---

##  What I Learned From This Project

As a fresh graduate, this project taught me a lot of practical lessons that you don't always get in a classroom:

* **Data is messy:** In the real world, datasets don't come perfect. Learning how to handle missing data and properly join tables without creating duplicates was a huge learning curve.
* **SQL and Python complement each other:** Python is amazing for the initial data cleanup, but SQL makes it incredibly fast and organized to group and aggregate complex data points.
* **Keep dashboards simple:** I learned that it's tempting to add too many charts, but it's much better to pick 5 or 6 clear visual elements that quickly answer concrete business questions.

---

##  Project Structure

* `notebooks/` - Contains my Python data exploration and cleaning steps.
* `sql/` - Contains the T-SQL script with all the business metric queries.
* `dashboard/` - Contains the screenshot file of my final performance dashboard.

> **Note on Data:** Because the source raw files are too large for GitHub, you can download the public dataset directly from [Kaggle's Brazilian E-Commerce page](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).
