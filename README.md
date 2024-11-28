![](https://img.shields.io/github/commit-activity/t/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/github/last-commit/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/github/release-date/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/github/repo-size/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/github/directory-file-count/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/github/issues/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/github/languages/top/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/github/commit-activity/m/subhamay-bhattacharyya/terraform-aws-template)&nbsp;![](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/bsubhamay/bb00719b11deafbf4f5ea85d80e0357d/raw/terraform-aws-template.json?)

# Terraform AWS Template

This repository contains a Terraform template for deploying resources on AWS. It provides a starting point for creating and managing AWS infrastructure using Terraform.

## Features

- Modular design for easy customization
- Pre-configured AWS resources
- Best practices for Terraform and AWS

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account and credentials configured

## Repository Structure

```plaintext
.
├── .github/
│   ├── workflows/
│   │   ├── [delete-stack.yaml]
│   │   ├── [deploy-stack.yaml]
│   │   ├── [drift-detection.yaml]
│   │   └── [run-infracost.yaml]
├── tf/
│   ├── [data.tf]
│   ├── [locals.tf]
│   ├── [main.tf]
│   ├── modules/
│   │   └── s3/
│   │       ├── [main.tf]
│   │       ├── [outputs.tf]
│   │       └── [variables.tf]
│   ├── [outputs.tf](11)
│   ├── params/
│   │   ├── [devl.terraform.tfvars]
│   │   ├── [prod.terraform.tfvars]
│   │   └── [test.terraform.tfvars]
│   ├── [providers.tf]
│   ├── [terraform.tfvars]
│   └── [variables.tf]
├── .gitignore
└── [README.md]

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/bsubhamay/terraform-aws-template.git
    cd terraform-aws-template
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Review and modify the variables in `variables.tf` as needed.

4. Apply the Terraform configuration:
    ```sh
    terraform apply
    ```

5. To use the CI/CD pipeline, push the code to the feature branch.

## Project Structure

- `main.tf`: Main Terraform configuration file
- `variables.tf`: Variable definitions
- `outputs.tf`: Output definitions
- `modules/`: Directory for reusable Terraform modules

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Authors

- Subhamay Bhattacharyya

## Acknowledgements

- [Terraform](https://www.terraform.io/)
- [AWS](https://aws.amazon.com/)
