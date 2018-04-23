#!bin/bash

# Add rule
if iptables -t nat -C OUTPUT -p tcp -m owner --uid-owner 101 -j RETURN ; then
    echo "iptables exit rule for tor already set"
else
    iptables -t nat -I OUTPUT -p tcp -m owner --uid-owner 101 -j RETURN
fi

tail -f /var/log/tor/notices.log
