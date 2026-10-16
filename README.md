# Deploy a Custom Apache Web Server on AWS EC2

Host a custom web page on an Amazon EC2 instance using Apache HTTP Server, fully automated with EC2 User Data.

- **Region:** US East (N. Virginia), `us-east-1`
- **OS:** Amazon Linux 2023
- **Web server:** Apache HTTP Server (`httpd`)
- **Author:** Rutuja Naik ([LinkedIn](https://www.linkedin.com/in/rutuja-naik07/))

## Project structure

```
aws-ec2-apache-web-server/
├── README.md                  Project overview and quick start
├── scripts/
│   └── user-data.sh           EC2 User Data script (installs Apache, writes index.html)
├── website/
│   └── index.html             Sample web page (replace with your own HTML)
├── docs/
│   ├── Deploy_Apache_on_AWS_EC2_Rutuja_Naik.pdf   Full step-by-step documentation
│   └── troubleshooting.md     Debug commands and common problems
├── .gitignore
└── LICENSE
```

## Quick start

1. In the AWS Console, switch to **US East (N. Virginia)** and open **EC2 > Launch instances**.
2. Name: `Custom-Apache-Web-Server`. AMI: **Amazon Linux 2023**. Type: `t2.micro` / `t3.micro`.
3. Enable **Auto-assign public IP**.
4. Security group: allow **HTTP (TCP 80)** from `0.0.0.0/0`; optionally **SSH (TCP 22)** from **My IP**.
5. **Advanced details > User data:** paste the contents of [`scripts/user-data.sh`](scripts/user-data.sh).
6. Launch, wait a few minutes, then open `http://<PUBLIC-IPV4>` (use `http`, not `https`).

## Troubleshooting

If you see the default "It works!" page, the custom `index.html` did not replace it. See [`docs/troubleshooting.md`](docs/troubleshooting.md).

## Security and cost

- Port 80 is open to the internet; do not put secrets on the page.
- Limit SSH (port 22) to your own IP.
- Terminate the instance when finished and check EBS volumes, snapshots and Elastic IPs.

## Documentation

Full guide: [`docs/Deploy_Apache_on_AWS_EC2_Rutuja_Naik.pdf`](docs/Deploy_Apache_on_AWS_EC2_Rutuja_Naik.pdf)

## License

MIT, see [LICENSE](LICENSE).
