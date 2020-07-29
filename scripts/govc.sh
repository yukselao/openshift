mkdir ~/bin
export GOVC_URL=https://github.com/vmware/govmomi/releases/download/v0.22.1/govc_linux_amd64.gz
curl -L ${GOVC_URL} | gunzip > ~/bin/govc
chmod +x ~/bin/govc
ln -s /root/bin/govc /usr/local/bin/govc
govc version
