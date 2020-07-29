export GOVC_URL=https://github.com/vmware/govmomi/releases/download/v0.22.1/govc_linux_amd64.gz
curl -L ${GOVC_URL} | gunzip > /opt/openshift/bin/govc
chmod +x /opt/openshift/bin/govc
ln -s /opt/openshift/bin/govc /usr/local/bin/govc
govc version
