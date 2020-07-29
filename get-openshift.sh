#!/bin/bash

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.29/openshift-install-linux-4.3.29.tar.gz
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.29/openshift-client-linux-4.3.29.tar.gz
wget https://rpmfind.net/linux/epel/8/Everything/x86_64/Packages/s/screen-4.6.2-10.el8.x86_64.rpm
rpm -ivh screen-4.6.2-10.el8.x86_64.rpm
rm screen-4.6.2-10.el8.x86_64.rpm
tar -zxf openshift-client-linux-4.3.29.tar.gz
tar -zxf openshift-install-linux-4.3.29.tar.gz
mkdir download
mv openshift-*tar.gz download/
mkdir bin
mv kubectl oc openshift-install bin/
ln -s /opt/openshift/bin/kubectl /usr/local/bin/kubectl
ln -s /opt/openshift/bin/oc /usr/local/bin/oc
ln -s /opt/openshift/bin/openshift-install /usr/local/bin/openshift-install

git clone https://github.com/openshift/installer.git
cd installer/
git checkout release-4.3
cd installer/upi/vsphere

echo 'Check these files, these files should be modified: 
        upi/vsphere/machine/ignition.tf
        upi/vsphere/machine/main.tf
        upi/vsphere/main.tf
        upi/vsphere/terraform.tfvars
'

