# dataeng-zoomcamp-final-project

## Goals

The goal of this project is to analyze how insurance premium amounts changed over the years from 2022 to 2025. As a starter, I attempted to look at how max insurance premium amounts changed from 2022 to 2025.  
Link to the dashboard:  
[Insurance Premium Dashboard](https://lookerstudio.google.com/reporting/5ef34b9e-ea05-4925-b5e8-c13f94593982)

## How to Run the Project

### 1. Set up Terraform  
Ensure you have Terraform installed on your system. Navigate to the `terraform/` directory in the project.

### 2. Initialize Terraform  
Run the following command to initialize Terraform and download the required providers:
```sh
terraform init
```

### 3. Plan the Infrastructure  
Generate an execution plan to preview the changes Terraform will make to your infrastructure.

### 4. Apply the Infrastructure  
Apply the changes to create the required infrastructure. Confirm the prompt to proceed with the changes.

### 5. Run Kestra Workflows  
To run the Kestra workflows:

- Start Kestra using Docker Compose:
    ```sh
    docker compose up
    ```

- Once Kestra is running, navigate to the `flows` directory in the project and upload the workflow files to Kestra:
    ```sh
    kestra-cli flows create ./flows/
    ```

### 6. Run the DBT Project  
After the infrastructure is set up, navigate to the `insurance-marketplace-dbt` directory and run the DBT commands to build the models by updating the `profiles` file.

### 7. Access the Dashboard  
Once the data pipeline is complete, you can view the analysis on the dashboard linked above.

### Notes  
Make sure to update the `variables.tf` file with your specific project details, such as `project`, `region`, and `gcs_bucket_name`, before running Terraform.


