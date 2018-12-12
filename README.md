# Requirements
1. Terraform v0.11.10 installed 
2. Git installed
3. AWS account 
4. Key-pair "sinatra-app" created in the AWS EC2 with key downloaded 

# How to Run
export AWS_ACCESS_KEY_ID=""  
export AWS_SECRET_ACCESS_KEY=""  
terraform init  
terraform plan  
terraform apply 

# Testing
On a browser: http://<EC2 externalip address>

# Notes
You could ssh to the EC2 instance and check /tmp/install.out  
The code will build the the environment in ap-southeast-2  
