# Deployment Flow

This document explains how code changes move from GitHub to production.

## Flow Overview

1. Developer pushes code to GitHub  
2. GitHub Actions pipeline is triggered automatically  
3. Pipeline uploads the application file to Amazon S3  
4. EC2 instances inside the Auto Scaling Group pull the latest file from S3  
5. Application Load Balancer serves the updated content to users  

## Why this design was chosen

- No manual SSH deployment on servers  
- New instances launched by Auto Scaling automatically configure themselves  
- System remains consistent under scaling  
- Failures can be debugged at each stage of the flow  

## Key Lessons Learned

- CI/CD is not only about tools but about reliable automation  
- Manual fixes do not work in distributed systems  
- Infrastructure consistency must come from automation (Launch Templates)  
- Debugging real systems requires observing behavior, not guessing  
