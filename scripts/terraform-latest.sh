mkdir ~/bin
cd /tmp/
export TERRAFORM_VERSION=0.12.29
curl -O -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d ~/bin/
terraform -v
