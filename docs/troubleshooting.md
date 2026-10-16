# Troubleshooting

Commands to run on the instance (via SSH or EC2 Instance Connect).

| Purpose | Command |
|---|---|
| Check the file exists | `sudo ls -l /var/www/html/` |
| Check the first lines | `sudo head -10 /var/www/html/index.html` |
| Check Apache service | `sudo systemctl status httpd --no-pager` |
| Test locally | `curl -s http://localhost \| head -20` |
| Look for default text | `sudo grep -Ril 'It works!' /var/www/html /etc/httpd/conf.d` |
| Check document root | `sudo grep -R 'DocumentRoot' /etc/httpd/conf /etc/httpd/conf.d` |
| User Data log | `sudo tail -100 /var/log/cloud-init-output.log` |
| Apache logs | `sudo journalctl -u httpd --no-pager -n 50` |

## Common problems

| Problem | What to check |
|---|---|
| Browser timeout | Security group allows HTTP TCP/80; instance has a public IPv4; routing is configured. |
| Connection refused | `sudo systemctl status httpd`, then restart Apache. |
| Still shows "It works!" | Check `/var/www/html/index.html` and Apache `DocumentRoot`. |
| User Data did not run | Check `/var/log/cloud-init-output.log`. User Data runs on first boot only. |
| SSH does not connect | Needs a key pair and port 22 open to your IP, or use Systems Manager. |
