# Instance creation using Amazon Linux 2 AMI (HVM), SSD Volume Type 
resource "aws_instance" "sinatra-app-aws_instance" {
  ami  = "ami-08589eca6dcc9b39c"
  instance_type = "t2.micro"

  # Disk size
  root_block_device {
    volume_type = "standard"
    volume_size = 20
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  # Monitoring not required
  monitoring = false

  # Subnet of the EC2 instance
  subnet_id="${aws_subnet.sinatra-app-public-subnet-01.id}"

  # Security groups to be assigned
  vpc_security_group_ids = [
    "${aws_security_group.sinatra-app-public-security-group.id}",
  ]
  # Assigned a public ip
  associate_public_ip_address = "true"
  # Set the key pair for ssh login
  key_name = "${var.key_pair_name}"
  # Commands to update, install required pre-req and execute the commands to run the app
  user_data = <<EOF
                #!/bin/bash
                LOGFILE=/tmp/install.out
                {
                echo "START OF SCRIPT"
                echo "==================================="
                yum update -y 
                yum install git -y
                yum install ruby -y 
                echo "net.ipv6.conf.all.disable_ipv6 = 1
                net.ipv6.conf.default.disable_ipv6 = 1
                net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
                systemctl restart network.service
                useradd ruby
                su - ruby -c "gem install bundler"
                su - ruby -c "git clone https://github.com/rea-cruitment/simple-sinatra-app.git"
                su - ruby -c "cd /home/ruby/simple-sinatra-app; bundle install;bundle exec rackup &"
                yum install httpd -y
                echo "
                <VirtualHost *:80>
                   ProxyPass / http://localhost:9292/
                   ProxyPassReverse / http://localhost:9292/
                </VirtualHost>" > /etc/httpd/conf.d/welcome.conf 
                systemctl on httpd
                systemctl start httpd 
                /usr/sbin/setsebool -P httpd_can_network_connect 1
                echo "==================================="
                echo "END OF SCRIPT"
                } 2>&1 | tee -a $LOGFILE
                EOF

  tags {
    Name = "${var.sinatra-app}"
  }
}
