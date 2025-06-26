# Homework Part 2 answers

## 1. Ideal CI/CD process (no tooling or resource limitations)

### Environments

Configure separate `local`, `dev`, `stg`, `prod` environments in Databricks and in dbt (and in Looker and other tools if possible). 

The reason for four environments would be:

**1. Everything you do locally uses `local`**. 

- If I want to make some changes in dbt, I can test out those changes in my Databricks local instance. 
- Noone except the engineer themselves has access to this environment.
   
**2. When you open PR in GitHub, it automatically pushes to your personal `dev` environment**. 

- Your personal dev environment is accessible by other users. 
- When your PR is getting reviewed, any schema or model changes can be tested or viewed by the reviewer in the dev environment.
- It would be great to have a Looker dev instance as well, where you could base the schema/data source off of a git feature 
  branch for example. This means, that if the end users only interacts with the data via Looker, then you could expose your 
  changes in Looker, have them be reviewed by the end user before merging in the PR. This way you can get feedback and 
  improve your solution prior to merging to staging.

**3. Staging mimics prod**.

- Only after the PR has been reviewed, the changes would be deployed to staging. 
- Keeping staging separate from dev, means that staging is never polluted with untested changes. Staging can contain dummy 
  data, but at least it is clear that everything you see there matches production. So it's a good clean environment for 
  UATs or simply playing around with the data.

**4. Production is the source of truth**.

- Productions contains the actual data and is the source of truth.

In my experience as a full-stack product engineer, we typically worked with only three environments: local/dev, 
staging, and production. One recurring issue was that once a PR was approved and merged, the changes went straight to staging even if they 
weren’t fully tested or validated by the end user (for example front-end changes couldn't be tested until staging). 
This sometimes led to incomplete or incorrect work ending up in staging, at times even breaking it and blocking others.

In an ideal world, a dedicated dev environment allows to validate not just code changes but also visual changes before they impact staging. 
It allows for quicker iteration, early feedback (especially if tied into tools like Looker), 
and ultimately reduces the risk of disrupting downstream environments.

#### CI/CD 

- Use Github Action, CircleCI or similar tools to set up CI/CD pipelines. 
- Pipelines should be triggered when:
  - opening PRs 
  - merging to staging
  - merging to main to deploy to prod

### Branches

- All changes are made within feature branches that are reviewed through PRs.
- Direct commits to any non-feature branches should not be allowed and this should be enforced via branch protection rules.
- Feature branches get merged to a staging branch.
- Code from staging can be safely deployed to main/prod, either automatically or manually by an authorized user.

### Version control 

- All dbt transformations should be version controlled.
- When using Looker, all LookML files should also be version controlled.

In my past roles, I've used a tool called Flyway when working with relational databases that have allowed us to also version database schemas.
I've also worked with GitHub and version control my entire career. 

### Tests

- All code has 100% test coverage.
- Tests run automatically on feature branches when a PR is opened.
- Tests run automatically on staging branch when PR is merged.
- Production tests run just before deployment to ensure final validation.

In my past, I've written unit tests, integration tests, as well as larger E2E tests that touch multiple services.
It has always been challenging (and not always practical) to achieve 100% test coverage. But with unlimited resources, I would try to do it.

### Monitoring & alerts

- Failed builds or tests should trigger alerts via Slack, email, or another channel.
- Alerts should be environment-specific, so issues in dev don’t create noise in prod, and vice versa.
- Alerts should be separated by severity where critical failures are prioritized over warnings.
- Any failure in any step of the data pipeline (ingestion, transformation, tests, or dashboard refreshes) should trigger an alert.
- Alerts should be routed to the relevant team or owner, so that not everyone is notified for every issue.
- All pipeline steps should produce searchable logs that are stored in a centralized tool.

In the past I've worked with Elasticsearch, Alertmanager, Grafana for monitoring, and email and Slack as the main channels for receiving alerts.

### Documentation

- All dbt models, fields, and metrics should be well-documented to support self-serve analytics. 
- dbt docs should be automatically regenerated and published when new code is merged.
- The staging environment should have its own published docs (separate from production), so data consumers can review upcoming changes before they go to production.

### Access

- No individual user should have direct write access to production data and all changes must go through version-controlled CI/CD.
- Most users, including analysts and product managers, should have read-only access to production environments.
- Write access should be limited to lower environments (e.g. dev).


## 2. Actual CI/CD process (with tooling and resource limitations)

### Short-term

- Use only three environments: `dev`, `stg`, `prod`.
- Set up a simple CI pipeline (e.g., GitHub Actions).
- Only use feature branches and `main`. 
  - Use branch protection rules to enforce reviews.
- Version control all code.
- Send basic alerts via Slack or email on pipeline job failures.
- Generate and publish documentation manually.
- Deploy to production manually.

### Long-term

- Personal dev environments per developer.
- Generate documents automatically.
- Set up more thorough monitoring.
- Automated deploys
