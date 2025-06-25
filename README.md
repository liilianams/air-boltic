# Air Boltic dbt project

1. **Set up and run the Databricks notebook**  
   First, follow the instructions in [`databricks_notebooks/README.md`](databricks_notebooks/README.md) to configure and run the Databricks notebook. 
   This step prepares the raw data required for the project.


2. **Set up the Python virtual environment**

   ```
   python -m venv .venv
   source .venv/bin/activate
   ```
   
3. **Install dependencies**

   ```
   pip install -r requirements.txt
   ```

4. **Run the dbt project and tests**

   ```
   dbt run
   dbt test
   ```

5. **Generate and view dbt documentation**

   ```
   dbt docs generate
   dbt docs serve
   ```