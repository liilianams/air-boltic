## Running the Air Boltic Notebook in Databricks

1. Import this notebook into Databricks.


### Use Databricks as the data source

2. In Databricks, create **/raw_data** folder in the same directory with the notebook.

3. Copy all the files from this [/raw_data](raw_data) directory to the `/raw_data` directory in Databricks.

4. In the first step of the notebook, set `use_s3` to `False`.

5. Run the notebook.


### Use S3 as the data source

2. Create an S3 bucket and give Databricks permissions to read from that S3 bucket.

3. Copy all the files from this [/raw_data](raw_data) directory to the S3 bucket.

4. In the first step of the notebook, set `use_s3` to `True`.

5. Run the notebook.

### Additional notes

- In step 3 of the notebook, the raw data can be explored. 
- After running the entire notebook, the raw data will vbe stored in 
  `SQL Editor > Catalog > Workspace > air_boltic_raw` table, which is used by this dbt project:

  ![air_boltic_raw](/air_baltic_raw_screenshot.png)