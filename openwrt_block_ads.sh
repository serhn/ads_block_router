#/bin/sh
wget http://winhelp2002.mvps.org/hosts.txt -O - -q | grep 0.0.0.0 | sed 's/^\(.*\)#.*$/\1/' > /etc/hosts_ads
uci add_list dhcp.@dnsmasq[0].addnhosts='/etc/hosts_ads'
uci commit dhcp
/etc/init.d/dnsmasq restart
