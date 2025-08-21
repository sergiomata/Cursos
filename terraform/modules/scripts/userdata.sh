      #!/bin/bash
      echo "Hello, World!" > /home/ec2-user/index.txt
      yum update -y
      yum install httpd -y
      systemctl enable httpd
      systemctl start httpd