# Air Boltic dbt project

## Homework Part 1 and 2 notes

Homework Part 1 implementation notes and answers to questions in Part 2 can be found in the [/notes](notes) directory.

## Project set up
1. **Set up and run the Databricks notebook**  
   
   First, follow the instructions in [databricks_notebooks/README.md](databricks_notebooks/README.md) to configure and run the Databricks notebook. 
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
   The documentation is also available in the [docs](docs) directory. Simply open the `index.html` file in your browser (I had to open it through IntelliJ IDEA for it to work). 