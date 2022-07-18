#! /usr/bin/bash
echo
echo "============ Destroy infrastructure ============"
echo
cd stage || return
terraform destroy --auto-approve
echo
echo "============ Destroy S3 backend ============"
echo
cd ../s3_init || return
terraform destroy --auto-approve
