Static Website on AWS S3 Using Terraform
---------------------------------------------------------------------------------

Overview

 I’ve hosted a static website using AWS S3, with all the infrastructure automated using Terraform. If you're curious to see the magic, feel free to explore the steps below to understand the process and contribute!
---------------------------------------------------------------------------------------
![image alt](https://github.com/dharaneesh5/DevopsProject/blob/b476b56590ee4c59fa60516d76cc14423ecbfc5f/static-website/s3/project2.png)



Static Website Files: HTML and other assets for the website.

Terraform Configurations: Code to provision and manage AWS resources.

Prerequisites

Before diving in, ensure you have the following:

Terraform installed on your system.

An AWS account with programmatic access configured.

Basic familiarity with Git and GitHub.

Steps to Push This Project to GitHub

1. Clone the Repository

Start by cloning this repository to your local machine. Open a terminal and run:

git clone https://github.com/<your-username>/<your-repo-name>.git

2. Add Your Files

Place your project files (HTML, Terraform scripts, etc.) into the repository folder. For example:

├── index.html
├── error.html
├── main.tf
├── variables.tf
├── outputs.tf

3. Stage Your Changes

Tell Git about the new files you've added. Run:

git add .

4. Commit Your Changes

Write a meaningful commit message to describe what you’ve added:

git commit -m "Initial commit: Added static website files and Terraform configs"

5. Push to GitHub

Finally, push your changes to your GitHub repository:

git push origin main

How to Use

Clone this repo and navigate to the project folder.

Deploy the infrastructure using Terraform:

terraform init
terraform apply

Access your static website via the S3 bucket’s endpoint provided by Terraform.
