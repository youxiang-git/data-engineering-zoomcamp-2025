# Module 1 Homework: Docker & SQL

## Submission by: youxiang-git

**\* Note:** </br>
I've checked the correct answers and provided links to the code files / scripts / SQL queries required to answer the questions

## Question 1. Understanding docker first run

Run docker with the `python:3.12.8` image in an interactive mode, use the entrypoint `bash`.

What's the version of `pip` in the image?

-   24.3.1 &check;
-   24.2.1
-   23.3.1
-   23.2.1

![image](/screenshots/q1.png)

## Question 2. Understanding Docker networking and docker-compose

Given the following `docker-compose.yaml`, what is the `hostname` and `port` that **pgadmin** should use to connect to the postgres database?

```yaml
services:
    db:
        container_name: postgres
        image: postgres:17-alpine
        environment:
            POSTGRES_USER: "postgres"
            POSTGRES_PASSWORD: "postgres"
            POSTGRES_DB: "ny_taxi"
        ports:
            - "5433:5432"
        volumes:
            - vol-pgdata:/var/lib/postgresql/data

    pgadmin:
        container_name: pgadmin
        image: dpage/pgadmin4:latest
        environment:
            PGADMIN_DEFAULT_EMAIL: "pgadmin@pgadmin.com"
            PGADMIN_DEFAULT_PASSWORD: "pgadmin"
        ports:
            - "8080:80"
        volumes:
            - vol-pgadmin_data:/var/lib/pgadmin

volumes:
    vol-pgdata:
        name: vol-pgdata
    vol-pgadmin_data:
        name: vol-pgadmin_data
```

If there are more than one answers, select only one of them

-   postgres:5433
-   localhost:5432
-   db:5433
-   postgres:5432
-   db:5432 &check;

### Justification

Reason being, when logging in with pgadmin, the hostname should be the container running the postgres service, in this case, it is the service name in the docker-compose.yaml file: `db`

Also, since the docker-compose has a "shared" network space, the port required by pgadmin should be the container's exposed port: `5432`

## Prepare Postgres

Run Postgres and load data as shown in the videos
We'll use the green taxi trips from October 2019:

```bash
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-10.csv.gz
```

You will also need the dataset with zones:

```bash
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/misc/taxi_zone_lookup.csv
```

Download this data and put it into Postgres.

You can use the code from the course. It's up to you whether
you want to use Jupyter or a python script.

## Question 3. Trip Segmentation Count

During the period of October 1st 2019 (inclusive) and November 1st 2019 (exclusive), how many trips, **respectively**, happened:

1. Up to 1 mile
2. In between 1 (exclusive) and 3 miles (inclusive),
3. In between 3 (exclusive) and 7 miles (inclusive),
4. In between 7 (exclusive) and 10 miles (inclusive),
5. Over 10 miles

Answers:

-   104,802; 197,670; 110,612; 27,831; 35,281
-   104,802; 198,924; 109,603; 27,678; 35,189
-   104,793; 201,407; 110,612; 27,831; 35,281
-   104,793; 202,661; 109,603; 27,678; 35,189
-   104,838; 199,013; 109,645; 27,688; 35,202 &check;

### Justification

Please see [q3.sql](q3.sql) for the queries executed to get the answers for Q3

## Question 4. Longest trip for each day

Which was the pick up day with the longest trip distance?
Use the pick up time for your calculations.

Tip: For every day, we only care about one single trip with the longest distance.

-   2019-10-11
-   2019-10-24
-   2019-10-26
-   2019-10-31 &check;

### Justification

Please see [q4.sql](q4.sql) for the queries executed to get the answers for Q4

## Question 5. Three biggest pickup zones

Which were the top pickup locations with over 13,000 in
`total_amount` (across all trips) for 2019-10-18?

Consider only `lpep_pickup_datetime` when filtering by date.

-   East Harlem North, East Harlem South, Morningside Heights &check;
-   East Harlem North, Morningside Heights
-   Morningside Heights, Astoria Park, East Harlem South
-   Bedford, East Harlem North, Astoria Park

### Justification

Please see [q5.sql](q5.sql) for the queries executed to get the answers for Q5

## Question 6. Largest tip

For the passengers picked up in October 2019 in the zone
named "East Harlem North" which was the drop off zone that had
the largest tip?

Note: it's `tip` , not `trip`

We need the name of the zone, not the ID.

-   Yorkville West
-   JFK Airport &check;
-   East Harlem North
-   East Harlem South

### Justification

Please see [q6.sql](q6.sql) for the queries executed to get the answers for Q6

## Terraform

In this section homework we'll prepare the environment by creating resources in GCP with Terraform.

In your VM on GCP/Laptop/GitHub Codespace install Terraform.
Copy the files from the course repo
[here](../../../01-docker-terraform/1_terraform_gcp/terraform) to your VM/Laptop/GitHub Codespace.

Modify the files as necessary to create a GCP Bucket and Big Query Dataset.

## Question 7. Terraform Workflow

Which of the following sequences, **respectively**, describes the workflow for:

1. Downloading the provider plugins and setting up backend,
2. Generating proposed changes and auto-executing the plan
3. Remove all resources managed by terraform`

Answers:

-   terraform import, terraform apply -y, terraform destroy
-   teraform init, terraform plan -auto-apply, terraform rm
-   terraform init, terraform run -auto-approve, terraform destroy
-   terraform init, terraform apply -auto-approve, terraform destroy &check;
-   terraform import, terraform apply -y, terraform rm

```bash
(.venv)  .venv youxiang@yx-home  ~/workspace/data_engineering_zoomcamp_2025/terrademo   homework_1 ±  terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_bigquery_dataset.demo_dataset will be created
  + resource "google_bigquery_dataset" "demo_dataset" {
      + creation_time              = (known after apply)
      + dataset_id                 = "demo_dataset"
      + default_collation          = (known after apply)
      + delete_contents_on_destroy = false
      + effective_labels           = {
          + "goog-terraform-provisioned" = "true"
        }
      + etag                       = (known after apply)
      + id                         = (known after apply)
      + is_case_insensitive        = (known after apply)
      + last_modified_time         = (known after apply)
      + location                   = "asia-southeast1"
      + max_time_travel_hours      = (known after apply)
      + project                    = "terraform-demo-449108"
      + self_link                  = (known after apply)
      + storage_billing_model      = (known after apply)
      + terraform_labels           = {
          + "goog-terraform-provisioned" = "true"
        }

      + access (known after apply)
    }

  # google_storage_bucket.demo-bucket will be created
  + resource "google_storage_bucket" "demo-bucket" {
      + effective_labels            = {
          + "goog-terraform-provisioned" = "true"
        }
      + force_destroy               = true
      + id                          = (known after apply)
      + location                    = "ASIA-SOUTHEAST1"
      + name                        = "terraform-demo-449108-terra-bucket"
      + project                     = (known after apply)
      + project_number              = (known after apply)
      + public_access_prevention    = (known after apply)
      + rpo                         = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "STANDARD"
      + terraform_labels            = {
          + "goog-terraform-provisioned" = "true"
        }
      + uniform_bucket_level_access = (known after apply)
      + url                         = (known after apply)

      + lifecycle_rule {
          + action {
              + type          = "AbortIncompleteMultipartUpload"
                # (1 unchanged attribute hidden)
            }
          + condition {
              + age                    = 1
              + matches_prefix         = []
              + matches_storage_class  = []
              + matches_suffix         = []
              + with_state             = (known after apply)
                # (3 unchanged attributes hidden)
            }
        }

      + soft_delete_policy (known after apply)

      + versioning (known after apply)

      + website (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
google_bigquery_dataset.demo_dataset: Creating...
google_storage_bucket.demo-bucket: Creating...
google_storage_bucket.demo-bucket: Creation complete after 2s [id=terraform-demo-449108-terra-bucket]
google_bigquery_dataset.demo_dataset: Creation complete after 2s [id=projects/terraform-demo-449108/datasets/demo_dataset]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

## Submitting the solutions

-   Form for submitting: https://courses.datatalks.club/de-zoomcamp-2025/homework/hw1
