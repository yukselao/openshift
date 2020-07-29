#!/bin/bash

###
# author: ali.okan.yuksel@ibm.com - 20.07.2020
##



rm -fr /opt/ocpinstall
mkdir -p /opt/ocpinstall/
/bin/cp config/install-config.yaml /opt/ocpinstall/
/bin/cp config/append-bootstrap.ign /opt/ocpinstall/
#./openshift-install create manifests --dir=/opt/ocpinstall
#sed -i -r 's#mastersSchedulable: true#mastersSchedulable: false#g' sed -i -r 's#mastersSchedulable: true#mastersSchedulable: false#g' /opt/ocpinstall/manifests/cluster-scheduler-02-config.yml
openshift-install create ignition-configs --dir=/opt/ocpinstall
cd /opt/ocpinstall
cp bootstrap.ign /var/www/html/
chmod 755 /var/www/html/bootstrap.ign
curl -I http://10.1.1.2:8080/bootstrap.ign

cd /opt/openshift/installer/upi/vsphere/
rm -fr /root/.terraform.d/
rm -fr terraform.tfstate*
cat /opt/openshift/scripts/terraform/terraform.tfvars_start > /tmp/terraform.tfvars
cat /opt/ocpinstall/master.ign >> /tmp/terraform.tfvars
cat /opt/openshift/scripts/terraform/terraform.tfvars_middle >> /tmp/terraform.tfvars
cat /opt/ocpinstall/worker.ign >> /tmp/terraform.tfvars
cat /opt/openshift/scripts/terraform/terraform.tfvars_end >> /tmp/terraform.tfvars
echo INFO check /tmp/terraform.tfvars
cp /tmp/terraform.tfvars /opt/openshift/installer/upi/vsphere/
cd /opt/openshift/installer/upi/vsphere/
terraform init
terraform plan
terraform apply -auto-approve

echo Follow these steps:
echo '--
If bootstrap fails:
ssh coreos
openshift-install gather bootstrap --bootstrap <bootstrap-host-ip> --master <control-plane-host-ip> [--master <control-plane-host-ip> ...]



cd /opt/ocpinstall
openshift-install --dir=. wait-for bootstrap-complete --log-level debug

cd /opt/openshift/installer/upi/vpshere
terraform apply -auto-approve -var 'bootstrap_complete=true'

cd /opt/ocpinstall
openshift-install --dir=. wait-for install-complete --log-level debug'
