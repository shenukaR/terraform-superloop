# Infastructure provisioning using terraform

1. Create an S3 bucket to store backend configurations.
2. Update the backend.tf file bucket object with the S3 bucket name created from the above step.
3. Go to IAM and create an user with access key and adminstrator access permission
4. log into aws using access keys (aws configure)
5. Verify the login in the path ~/.aws/credentials for the Ubuntu user. (optional)
6. Change the terraform.tfvars file's allowed IP variable to your current host IP.
7. Save all changes and run the 'terraform init' command to initialize the backend. 
8. Run 'terraform plan' and then 'terraform apply --auto-approve' to apply changes.


# nginx server deployment using Ansible

1. After provisioning the infrastructure with Terraform, retrieve the instance_public_ip from the outputs and update the IP in the inventory file under the ansible folder.
2. Change to ansible directory and run 'ansible-playbook -i inventory nginx.yml -b'.
3. Make sure to push the changes after resource creation.




