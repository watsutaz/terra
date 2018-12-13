# Requirements
1. Terraform v0.11.10 installed 
2. AWS account 
3. Key-pair "sinatra-app" created in the AWS EC2 with key downloaded 

# How to Run
1. shell$ export AWS_ACCESS_KEY_ID="YOUR AWS ACCESS KEY ID"  
2. shell$ export AWS_SECRET_ACCESS_KEY="YOUR SECRET ACCESS KEY"  
3. unzip git directory and files  
4. shell$ terraform init  
5. shell$ terraform plan  
6. shell$ terraform apply  
    Type "Yes" whem prompted for confirmation
7. Public_ip address will be displayed on screen

# Testing
1. On a browser access the public ip via http  
2. Expected output is "Hello World" displayed on the browser

# Notes
* It may take several minutes after the EC2 instance to up to get the "Hello World" message on be browser  
* You could ssh to the EC2 instance and check /tmp/install.out on the state of the install 
* Port 22 is open on the Security to allow for troubleshootin besides port 80.  
* The code will build the the environment in ap-southeast-2  

# Cleanup
1. shell$ erraform destroy  
    Type "Yes" whem prompted for confirmation 

