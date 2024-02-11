# Google Cloud Platform (GCP) Infrastructure Deployment

This Terraform configuration sets up a basic infrastructure on Google Cloud Platform (GCP) consisting of a virtual machine instance, a subnetwork, a network, and a firewall rule.

## Prerequisites

1. **Google Cloud Platform Account**: You need to have a Google Cloud Platform account with appropriate permissions to create resources.

2. **Google Cloud SDK**: Ensure that you have Google Cloud SDK installed and configured on your local machine.

3. **Terraform**: Make sure Terraform is installed on your local machine. You can download it from [here](https://www.terraform.io/downloads.html).

## Configuration

1. Clone the repository:

   ```bash
   https://github.com/lakshman8cs/Terraform.git
   ```
2. Navigate to the project directory
3. Update the variables in the variables.tf file to match your project requirements
4. Initialize Terraform
   ```
   terraform plan
   ```
5. Review the execution plan
   ```
   terraform plan
   ```
6. Deploy the infrastructure
   ```
   terraform apply
   ```

