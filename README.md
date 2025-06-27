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

4. **Configure dbt to connect to Databricks**

   To connect dbt to Databricks, create a `profiles.yml` file in your `~/.dbt` directory (if it doesn't already exist), with the following structure:

   ```
   air_boltic:
     outputs:
       dev:
         catalog: workspace
         host: <your-databricks-instance>.cloud.databricks.com
         http_path: /sql/1.0/warehouses/<your-sql-warehouse-id>
         schema: air_boltic
         threads: 1
         token: <your-databricks-personal-access-token>
         type: databricks
     target: dev
   ```

   - `host` & `http_path`: In Databricks, navigate to SQL Warehouses → select your warehouse → Connection details. 
   - `token`: In Databricks, click on User top right corner → Settings → Developer → Access tokens → Generate new token.

5. **Run the dbt project and tests**

   ```
   dbt run
   dbt test
   ```

6. **Generate and view dbt documentation**

   ```
   dbt docs generate
   dbt docs serve
   ```
   The documentation is also available in the [docs](docs) directory. Simply open the `index.html` file in your browser (I had to open it through IntelliJ IDEA for it to work). 