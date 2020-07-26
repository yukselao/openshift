#!/bin/bash

###
# author: ali.okan.yuksel@ibm.com - 20.07.2020
##

rm -fr ocpinstall
mkdir -p ocpinstall/
/bin/cp install-config.yaml /opt/ocpinstall/
/bin/cp append-bootstrap.ign /opt/ocpinstall/
#./openshift-install create manifests --dir=/opt/ocpinstall
#sed -i -r 's#mastersSchedulable: true#mastersSchedulable: false#g' sed -i -r 's#mastersSchedulable: true#mastersSchedulable: false#g' /opt/ocpinstall/manifests/cluster-scheduler-02-config.yml
./openshift-install create ignition-configs --dir=/opt/ocpinstall
cd ocpinstall
cp bootstrap.ign /var/www/html/
chmod 755 /var/www/html/bootstrap.ign
curl -I http://10.1.1.2:8080/bootstrap.ign

cd /root/installer/upi/vsphere/
rm -fr /root/.terraform.d/
rm -fr terraform.tfstate*
cat /opt/scripts/terraform/terraform.tfvars_start > /tmp/terraform.tfvars
cat /opt/ocpinstall/master.ign >> /tmp/terraform.tfvars
cat /opt/scripts/terraform/terraform.tfvars_middle >> /tmp/terraform.tfvars
cat /opt/ocpinstall/worker.ign >> /tmp/terraform.tfvars
cat /opt/scripts/terraform/terraform.tfvars_end >> /tmp/terraform.tfvars
echo INFO check /tmp/terraform.tfvars
cp /tmp/terraform.tfvars /root/installer/upi/vsphere/
cd /root/installer/upi/vsphere/
terraform init
terraform plan
terraform apply -auto-approve
cd /root/installer/upi/vsphere/
terraform init
terraform plan
terraform apply -auto-approve
