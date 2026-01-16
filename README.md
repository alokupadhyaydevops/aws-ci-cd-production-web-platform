# AWS CI/CD Production Web Platform

This project demonstrates how to design, build, and operate a production-style web platform on AWS using real-world cloud and DevOps practices such as load balancing, auto scaling, CI/CD automation, secure IAM integration, and deployment debugging.

## Project Overview

This project is a hands-on implementation of a real-world cloud deployment architecture.

It simulates how modern engineering teams deploy applications using:

- Automated CI/CD pipelines  
- Scalable cloud infrastructure  
- Secure access between systems  
- Zero manual deployment on servers  
- Real debugging of production-like issues  

The focus of this project is not just to "make it work", but to understand:
- Why each component is used  
- How components interact  
- What breaks in real systems  
- How engineers debug and fix those issues  

## Architecture

This project follows a production-style architecture commonly used in real systems.

Core components:

- **GitHub Repository**  
  Stores application code and triggers the pipeline on every change.

- **GitHub Actions (CI/CD Pipeline)**  
  Automatically validates and deploys the application when code is pushed.

- **Amazon S3 (Artifact Storage)**  
  Stores the application file that EC2 instances pull from.

- **EC2 Auto Scaling Group (ASG)**  
  Runs multiple EC2 instances and replaces unhealthy ones automatically.

- **Launch Template**  
  Ensures every EC2 instance is configured identically at launch.

- **Application Load Balancer (ALB)**  
  Distributes traffic across multiple EC2 instances for high availability.

High-level flow:

Developer → GitHub → GitHub Actions → S3 → EC2 (ASG) → ALB → Users
