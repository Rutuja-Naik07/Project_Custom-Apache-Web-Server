#!/bin/bash
# EC2 User Data: installs Apache and publishes a custom index.html
# Tested on: Amazon Linux 2023 | Region: US East (N. Virginia), us-east-1
set -euxo pipefail

dnf update -y
dnf install -y httpd
mkdir -p /var/www/html

cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Custom Apache Page</title>
</head>
<body>
  <h1>Hello from Apache on AWS EC2!</h1>
  <!-- Replace with your own HTML (e.g. generated with GPT) -->
</body>
</html>
HTML

chown -R apache:apache /var/www/html
chmod 755 /var/www/html
chmod 644 /var/www/html/index.html
systemctl enable --now httpd
