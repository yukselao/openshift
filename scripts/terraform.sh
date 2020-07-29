mkdir ~/bin
cd /tmp/
export TERRAFORM_VERSION=0.11.14
curl -O -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /opt/openshift/bin/
ln -s /opt/openshift/bin/terraform /usr/local/bin/terraform
terraform -v
