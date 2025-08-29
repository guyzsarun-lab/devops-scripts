DNS_SERVER=x.x.x.x

CURRENT=$(sudo networksetup -getdnsservers Wi-Fi 2>/dev/null | tr '\n' ' ' | sed 's/ $//')

if [[ "$CURRENT" == "$DNS_SERVER" ]]; then
    sudo networksetup -setdnsservers Wi-Fi empty
    echo "Switched DNS to default (empty)"
else
    sudo networksetup -setdnsservers Wi-Fi $DNS_SERVER
    echo "Switched DNS to $DNS_SERVER"
fi
