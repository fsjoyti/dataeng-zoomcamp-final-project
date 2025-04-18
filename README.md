# Data Engineering Zoomcamp Final Project

## Project Goals

This project aims to analyze trends in insurance premium amounts from 2022 to 2025 across various demographic and categorical groups. The primary focus is on identifying significant patterns or anomalies in the maximum insurance premium amounts during this period.  

**Link to the dashboard:**  
[Insurance Premium Dashboard](https://lookerstudio.google.com/reporting/5ef34b9e-ea05-4925-b5e8-c13f94593982)

---

## How to Run the Project

### Prerequisites
- Ensure you have **Terraform**, **Docker Compose**, and **Python** installed on your system.
- Set up a **Google Cloud Platform (GCP)** project with the necessary permissions and resources.

---

### 1. Set Up Terraform

1. Navigate to the `terraform/` directory in the project.
2. Initialize Terraform by running:
    ```sh
    terraform init
    ```
3. Generate an execution plan to preview the changes Terraform will make:
    ```sh
    terraform plan
    ```
4. Apply the changes to create the required infrastructure:
    ```sh
    terraform apply
    ```
    Confirm the prompt to proceed.

---

### 2. Configure and Run Kestra Workflows

1. Update the `04_gcp_kv.yaml` file with your GCP details:
    - **GCP_CREDS**: Path to your service account JSON file.
    - **GCP_PROJECT_ID**: Your GCP project ID.
    - **GCP_LOCATION**: The region for your resources.
    - **GCP_BUCKET_NAME**: Name of your GCS bucket.
    - **GCP_DATASET**: Name of your BigQuery dataset.

    > **Note:** Keep the `GCP_CREDS` file secure and do not commit it to version control.

2. Start Kestra using Docker Compose:
    ```sh
    docker compose up
    ```
3. Import the workflow files into Kestra:
    ```sh
    curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/04_gcp_kv.yaml
    curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/05_gcp_flow.yaml
    curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/06_gcp_puf.yaml
    curl -X POST http://localhost:8080/api/v1/flows/import -F fileUpload=@flows/07_gcp_puf.yaml
    ```

---

### 3. Set Up and Run the DBT Project

1. Navigate to the `insurance-marketplace-dbt` directory.
2. Create and activate a virtual environment:
    ```sh
    python -m venv venv
    source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
    ```
3. Install the required Python packages:
    ```sh
    pip install -r requirements.txt
    ```
4. Verify the setup:
    ```sh
    python main.py --help
    ```
5. Update the `profiles.yml` file with your GCP project details and run the DBT commands to build the models.

---

### 4. Access the Dashboard

Once the data pipeline is complete, view the analysis on the [Insurance Premium Dashboard](https://lookerstudio.google.com/reporting/5ef34b9e-ea05-4925-b5e8-c13f94593982).

---

### Notes

- Update the `variables.tf` file with your specific project details (e.g., `project`, `region`, `gcs_bucket_name`) before running Terraform.
- Ensure all sensitive information, such as service account credentials, is securely stored and not committed to version control.

