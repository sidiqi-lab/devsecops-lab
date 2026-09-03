# devsecops-lab
Hands-on DevSecOps learning lab
DevSecOps Lab

A hands-on DevSecOps laboratory demonstrating how to integrate testing, application security, dependency security, secret detection, containerization, and CI/CD into a Python FastAPI project.

The project uses GitHub Actions to automate security and quality checks and Podman to build and run the application as a container.

Architecture
Developer
   |
   v
Git Push
   |
   v
GitHub
   |
   v
GitHub Actions
   |
   +-- pytest
   |     |
   |     +-- Automated Testing
   |
   +-- Bandit
   |     |
   |     +-- SAST
   |
   +-- pip-audit
   |     |
   |     +-- SCA
   |
   +-- Gitleaks
   |     |
   |     +-- Secret Detection
   |
   +-- Container Build
   |     |
   |     +-- Podman
   |
   +-- Trivy
         |
         +-- Container Image Security
   |
   v
Secure Build

Technology Stack
Technology	Purpose
Python	Application language
FastAPI	API framework
Uvicorn	ASGI server
pytest	Automated testing
Bandit	Static Application Security Testing (SAST)
pip-audit	Software Composition Analysis (SCA)
Gitleaks	Secret detection
Podman	Container build and runtime
Trivy	Container image vulnerability scanning
Git	Source control
GitHub	Source repository
GitHub Actions	CI/CD automation
Ubuntu VM	Linux/container development environment
Project Structure
devsecops-lab/
|
+-- .github/
|   |
|   +-- workflows/
|       |
|       +-- tests.yml
|
+-- app/
|   |
|   +-- __init__.py
|   +-- main.py
|
+-- tests/
|   |
|   +-- test_main.py
|
+-- requirements.txt
+-- Containerfile
+-- .gitignore
+-- README.md

Application

The project contains a small FastAPI application.

Run it locally:

uvicorn app.main:app --host 0.0.0.0 --port 8000


Test the API:

curl http://127.0.0.1:8000


Expected response:

{
  "message": "DevSecOps Lab is running"
}


Interactive API documentation:

http://127.0.0.1:8000/docs

Local Development

Clone the repository:

git clone https://github.com/sidiqi-lab/devsecops-lab.git
cd devsecops-lab


Create a virtual environment:

python3 -m venv .venv


Activate it:

source .venv/bin/activate


Install dependencies:

pip install -r requirements.txt


Verify dependencies:

pip check

Testing

Run the automated test suite:

python3 -m pytest


Verbose mode:

python3 -m pytest -v


The test suite verifies that the FastAPI application behaves as expected.

Security

This project demonstrates multiple layers of application and supply-chain security.

SAST — Bandit

Bandit analyzes Python source code for common security issues.

bandit -r app

SCA — pip-audit

pip-audit checks Python dependencies for known vulnerabilities.

pip-audit -r requirements.txt


A clean dependency relationship can be checked separately with:

pip check


Note that pip check and pip-audit perform different functions:

pip check
    |
    +-- Dependency consistency

pip-audit
    |
    +-- Known security vulnerabilities

Secret Detection — Gitleaks

Gitleaks scans the repository for accidentally committed secrets.

gitleaks detect


Verbose mode:

gitleaks detect -v


Secrets such as API keys, passwords, tokens, and private credentials should never be committed to Git.

Containerization

The application can be packaged using Podman.

Build the image:

podman build -t devsecops-lab:1.0 .


Verify:

podman images


Run the container:

podman run -d \
  --name devsecops-api \
  -p 8000:8000 \
  devsecops-lab:1.0


Check the container:

podman ps


Check logs:

podman logs devsecops-api


Test the API:

curl http://127.0.0.1:8000


Expected:

{
  "message": "DevSecOps Lab is running"
}

Container Security

Trivy is used to scan the container image for vulnerabilities.

trivy image devsecops-lab:1.0


The goal is to identify vulnerable operating-system packages and application dependencies inside the container image before deployment.

CI/CD

GitHub Actions is used to automate testing and security checks.

Workflow:

Git Push
   |
   v
GitHub Actions
   |
   +-- pytest
   |
   +-- Bandit
   |
   +-- pip-audit
   |
   +-- Gitleaks
   |
   +-- Container Build
   |
   +-- Trivy
   |
   v
PASS / FAIL


The workflow is located at:

.github/workflows/tests.yml


The pipeline runs on:

push to main
pull request to main

DevSecOps Controls
                    DevSecOps
                        |
        +---------------+---------------+
        |               |               |
        v               v               v
    Application      Dependencies     Secrets
      Security         Security        Security
        |               |               |
        v               v               v
     Bandit          pip-audit       Gitleaks
        |
        |
        +-------------------------------+
                        |
                        v
                   Container
                    Security
                        |
                        v
                      Trivy
                        |
                        v
                    Deployment

Development Workflow

The recommended development cycle is:

1. Make code changes
        |
        v
2. Run tests
        |
        v
3. Run security scans
        |
        v
4. Build container
        |
        v
5. Scan container
        |
        v
6. Commit changes
        |
        v
7. Push to GitHub
        |
        v
8. GitHub Actions
        |
        v
9. Review pipeline


Typical commands:

python3 -m pytest
bandit -r app
pip-audit -r requirements.txt
gitleaks detect
podman build -t devsecops-lab:1.0 .
trivy image devsecops-lab:1.0
git status
git add .
git commit -m "Describe the change"
git push origin main

Troubleshooting
Check the container
podman ps -a

View container logs
podman logs devsecops-api

Check port mapping
podman port devsecops-api

Test locally
curl http://127.0.0.1:8000

Find the VM IP
hostname -I


Example:

192.168.64.2


Test using the VM IP:

curl http://192.168.64.2:8000

Ubuntu VM

The project uses an Ubuntu VM for Linux and container development.

Connect from the Mac using SSH:

ssh USERNAME@VM_IP


Example:

ssh sidiqi@192.168.64.2


Files can be transferred with SCP:

scp FILE USERNAME@VM_IP:~/devsecops-lab/

Useful Commands
Git
git status
git add .
git commit -m "Describe the change"
git push origin main

Python
source .venv/bin/activate
pip install -r requirements.txt
pip check

Testing
python3 -m pytest

Security
bandit -r app
pip-audit -r requirements.txt
gitleaks detect

Podman
podman images
podman ps
podman ps -a
podman logs devsecops-api

Trivy
trivy image devsecops-lab:1.0

Security Principles

This lab follows several basic DevSecOps principles:

Shift security left — identify security issues early in development.
Automate security checks — run security tools through CI/CD.
Treat dependencies as part of the attack surface — continuously scan third-party packages.
Never commit secrets — use secret management instead.
Scan container images — identify vulnerabilities before deployment.
Keep builds reproducible — use version-controlled dependency and container configuration.
Fail the pipeline when appropriate — prevent known security problems from reaching later stages.
Definition of Done

A change is considered ready when:

[ ] Application works
[ ] pytest passes
[ ] Bandit passes
[ ] pip-audit reviewed
[ ] Gitleaks passes
[ ] Container builds successfully
[ ] Container starts successfully
[ ] API responds
[ ] Trivy scan completed
[ ] Git working tree reviewed
[ ] Changes committed
[ ] Changes pushed
[ ] GitHub Actions is green

Learning Objectives

This lab provides hands-on experience with:

Git and GitHub
GitHub Actions
CI/CD pipelines
Python application testing
SAST
SCA
Secret detection
Containerization
Container security
Linux administration
SSH
SCP
DevSecOps security gates
Repository Documentation

Additional documentation should be maintained in the GitHub Wiki:

DevSecOps Lab SOP
    |
    +-- Complete setup and implementation guide

DevSecOps Lab — Quick Reference
    |
    +-- Frequently used commands

Project Status
Application             ✅
Automated Testing       ✅
SAST                    ✅
SCA                     ✅
Secret Detection        ✅
Containerization        ✅
Container Scanning      ✅
GitHub Actions          ✅
CI Pipeline             ✅

Author

Sidiqi Lab

This repository is a hands-on learning project focused on practical DevSecOps engineering, automation, application security, and container security.
