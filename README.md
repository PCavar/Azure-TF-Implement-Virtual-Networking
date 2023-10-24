# Terraform Azure Deployment
The Architecture is show in the picture, the picture is taken from: https://microsoftlearning.github.io/AZ-104-MicrosoftAzureAdministrator/Instructions/Labs/LAB_04-Implement_Virtual_Networking.html

Knowledge wise you must be familiar with simple Terraform commands

Steps to proivision:
    1. Fork the repository
    2. Make sure you are signed in to your Azure account and have set the right subscription to provision
    3. Running ```terraform init``` Initializes a working directory containing Terraform configuration files
    4. Running ```terraform fmt``` rewrites Terraforms configuration files to a canonical format and style. good for readability.
    5. Running ```terraform validate``` checks the syntax and internal consistency of Terraforms configuration files.
    6. Running ```terraform plan``` creates an execution plan and displays what will be deployed when running ```terraform apply```
    7. Running ```terraform plan -out ./run-this-deployment.tfplan``` creates an execution plan and saves it to the file specified. 
    8. Running ```terraform apply -out ./run-this-deployment.tfplan``` applies the deployment/changes proposed in ```./run-this-deployment.tfplan```

There are many more commands, for starters this will be more than enough!


Have fun!