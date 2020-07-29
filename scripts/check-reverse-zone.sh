checkhost="master01.security.tr.ibm.com"
checkip="10.1.1.61"
cmd="dig -x 10.1.1.61 +short"
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="master02.security.tr.ibm.com"
checkip="10.1.1.62"
cmd="dig -x 10.1.1.62 +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="master03.security.tr.ibm.com"
checkip="10.1.1.63"
cmd="dig -x 10.1.1.63 +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="worker01.security.tr.ibm.com"
checkip="10.1.1.64"
cmd="dig -x 10.1.1.64 +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="worker02.security.tr.ibm.com"
checkip="10.1.1.65"
cmd="dig -x 10.1.1.65 +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="worker03.security.tr.ibm.com"
checkip="10.1.1.66"
cmd="dig -x 10.1.1.66 +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="bootstrap.security.tr.ibm.com"
checkip="10.1.1.59"
cmd="dig -x 10.1.1.59 +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="controllb.security.tr.ibm.com"
checkip="10.1.1.72"
cmd="dig -x $checkip +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="computelb.security.tr.ibm.com"
checkip="10.1.1.73"
cmd="dig -x $checkip +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="lbint.security.tr.ibm.com"
checkip="10.1.1.2"
cmd="dig -x 10.1.1.2 +short" 
echo INFO reverse zone check for $checkip: $checkhost==$(eval $cmd) $(test $checkhost==$(eval $cmd); echo $?)
echo INFO A lookup check: $checkhost $(dig +short A $checkhost)==$checkip $(test $(dig +short A $checkhost)==$checkip; echo $?)
ping -c1 $checkhost
echo 

checkhost="api.security.tr.ibm.com"
echo INFO A lookup check: $checkhost Result: $(dig +short A $checkhost)
ping -c1 $checkhost
echo 

checkhost="api-int.security.tr.ibm.com"
echo INFO A lookup check: $checkhost Result: $(dig +short A $checkhost)
ping -c1 $checkhost
echo 

checkhost="*.apps.security.tr.ibm.com"
echo INFO A lookup check: $checkhost Result:
dig +short A $checkhost
ping -c1 $checkhost
echo 

checkhost="_etcd-server-ssl._tcp.security.tr.ibm.com"
echo INFO SRV lookup check: $checkhost Result: 
dig +short SRV $checkhost
ping -c1 $checkhost
echo 

