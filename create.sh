#! /usr/bin/bash
echo
echo "============ Init S3 backend ============"
echo
cd s3_init/ || return
terraform init && terraform plan && terraform apply --auto-approve
echo
echo "============  Create workspace stage ============"
echo
cd ../stage/ || return
terraform init -reconfigure -backend-config=./backend.conf
terraform workspace new stage
echo
echo "============ Create infrastructure ============"
echo
terraform init && terraform plan && terraform apply --auto-approve
echo
echo "============ Pause to start hosts ============"
echo
sleep 60
echo
echo "============ Run Playbook ============"
echo
cd ../ansible || return
ansible-playbook playbook.yml
