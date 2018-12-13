# Requirements
1. Terraform v0.11.10 installed 
2. AWS account 
3. Key-pair "sinatra-app" created in the AWS EC2 with key downloaded 

# How to Run
1. export AWS_ACCESS_KEY_ID=""  
2. export AWS_SECRET_ACCESS_KEY=""  
3. unzip git directory and files  
4. terraform init  
5. terraform plan  
6. terraform apply 
7. Public_ip address will be displayed on screen

# Testing
1. On a browser access the public ip via http  
2. Expected output is "Hello World" displayed on the browser

# Notes
1. It may take several minutes after the EC2 instance to up to get the "Hello World" message on be browser  
2. You could ssh to the EC2 instance and check /tmp/install.out on the state of the install 
3. Port 22 is open on the Security to allow for troubleshootin besides port 80.  
4. The code will build the the environment in ap-southeast-2  


