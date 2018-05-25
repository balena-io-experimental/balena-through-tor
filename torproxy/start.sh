#!bin/bash

# We are adding an iptables exception for the tor user, so while everything
# else is proxied, processes run by the tor user are not
TOR_UID=$(id --user tor)

# Add rule
if iptables -t nat -C OUTPUT -p tcp -m owner --uid-owner ${TOR_UID} -j RETURN ; then
    echo "iptables exit rule for tor already set"
else
    iptables -t nat -I OUTPUT -p tcp -m owner --uid-owner ${TOR_UID} -j RETURN
fi

tail -f /var/log/tor/notices.log
