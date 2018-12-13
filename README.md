# Requirements
1. Terraform v0.11.10 installed 
2. AWS account 
3. Key-pair "sinatra-app" created in the AWS EC2 with key downloaded 

# How to Run
export AWS_ACCESS_KEY_ID=""  
export AWS_SECRET_ACCESS_KEY=""  
unzip git directory and files  
terraform init  
terraform plan  
terraform apply 
Public_ip address will be displayed on screen

# Testing
On a browser access the public ip via http  

# Notes
It may take several minutes after the EC2 instance to up to get the "Hello World" message on be browser
You could ssh to the EC2 instance and check /tmp/install.out on the state of the install 
Port 22 is open on the Security to allow for troubleshootin besides port 80.
The code will build the the environment in ap-southeast-2  


