#!/bin/bash

configfile=/tmp/dhcpd.conf.tmp

function fix() {
        if [[ "$1" == "bootstrap-0" ]]; then
                thost=bootstrap
        else
                thost=$1
        fi
        macaddr="$(govc device.info -vm=/Datacenter/vm/data/$1 ethernet-0 | grep MAC | sed -r 's#.+ (.+)$#\1#')"
        echo 'host '"$1"' {
  option host-name "'"$thost"'.data.tr.ibm.com";
  hardware ethernet '"$macaddr"';
  fixed-address '"$2"';
}' >> /tmp/dhcpd.conf.tmp
}


>$configfile

fix bootstrap-0 10.1.1.59
fix control-plane-0 10.1.1.61
fix control-plane-1 10.1.1.62
fix control-plane-2 10.1.1.63
fix compute-0 10.1.1.64
fix compute-1 10.1.1.65
fix compute-2 10.1.1.66
