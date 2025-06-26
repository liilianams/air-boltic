# Homework Part 1 notes

### Tech stack

- **Github** for version control.
- **S3** for storing data (although the [notebook instructions](../databricks_notebooks/README.md) outline how to run the notebook without an S3 connection as well).
- **Databricks** for viewing the data and doing some initial very basic cleanup (more info in the notebook).
- **dbt** for data transformations. 
- **Databricks** again for storing the results of the final dbt transformations and for displaying the data on dashboards.

I considered using **Lightdash** as an open-source alternative to Looker but decided against it in the interest of time.
I experimented briefly with Databricks dashboards - creating a simple one would have been my next step.

### Databricks

- Everything I did in Databricks is explained in the notebook [here](../databricks_notebooks/Air%20Boltic%20Notebook_Liilia%20Namsing.ipynb). 
- The notebook run instructions are [here](../databricks_notebooks/README.md). 

### dbt models and schemas

Being new to dbt, I used only a small subset of all its available functionality and tools.

#### Models

The models are grouped into [staging ](../models/staging) and [marts ](../models/marts).
- Staging models are 1:1 with raw data tables. 
- Staging models contain relatively small transformations like adjusting column names, determining data types, adding some extra columns here and there that could provide useful for further data analysis downstream, and so on.
- Staging models were used to create [core ](../models/marts/core) dim and fct tables.
- All [metrics ](../models/marts/metrics) were built on top of dim and fct tables.

#### Schemas

- Each directory includes its own schema file, which provides an overview of the models or metrics defined within that directory.
- In some descriptions, I elaborated on my reasoning behind creating specific fields, models, or metrics.
- Not every field in every table has a description - I focused on documenting the columns I created or modified.
- For most columns that already exist in the raw data and are fairly self-explanatory (like seat number in the [order](https://docs.google.com/spreadsheets/d/1x9F8gAosLABNyGdjaDsAnUQ50bIHp9FKOX1j-7ERBsw/edit?gid=212750542#gid=212750542) table), I chose not to include additional descriptions.

### dbt metrics rationale

Regarding the [customer, revenue, and trips metrics](../models/marts/metrics) I created - it was definitely tricky to figure out which metrics might actually help explain the drivers of growth for a service like Air Boltic, especially without any input from real end-users.

Different teams care about different things. Marketing might want revenue by channel, while Operations might care more about trips by route. So I tried to mix in a few more common metrics like active users or revenue over time with more specific `x_by_y`-type metrics like `trips_by_route`, or single-value indicators like `avg_trip_cancellation_rate`.

These metrics definitely don’t represent everything that I think could be useful, but they're a starting point to spark further analysis and lead to requests for new data sources and tables.

For example, if the average trip cancellation rate turns out to be unusually high, that might prompt someone to dig deeper into the why, which could reveal that we’re missing important tables or dimensions we hadn’t thought to include.

Some other metrics I considered that didn’t make it into this version:
- `active_customers_snapshot`: The active customer metrics I included track activity over time, but they don’t give a snapshot of how many users are active right now, for example.
- `customer_retention`: It would be helpful to understand who the repeat customers are and how frequently they use the service.
- `Some metrics around the airplane fleet`: Are we using the most optimal airplane fleet considering our routes and occupancy rates?

### dbt tests

I added some [tests](../tests/staging) mostly to try it out. But again, in a real project, it would be great to aim for as high of a test coverage as possible. 

### Using chatbots

Since I hadn’t set up Databricks or dbt projects from scratch before, I used ChatGPT to help me set up this project and troubleshoot
issues that came up. Similarly, I haven't worked with Python in a while, so I also leaned on it to help me with Python and Spark syntax. 

Additionally, I used ChatGPT as a teaching tool. Again coming from a product developer background, I didn't initially quite
understand the structure of dbt or the flow between Databricks and dbt, and how they work together. So many of my prompts were 
in the format of: _"In layman's terms, please explain how Databricks and dbt actually interact - where does the data live, 
what does dbt change, and how does it all end up in Looker dashboards?"_
