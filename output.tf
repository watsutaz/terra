# Output the instance public ip 
output "instance_ips" {
  value = ["${aws_instance.sinatra-app-aws_instance.public_ip}"]
}
