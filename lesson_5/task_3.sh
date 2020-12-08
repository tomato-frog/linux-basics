# Настроить iptables: разрешить подключения только на 22-й и 80-й порты.
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 22 -j ACCEPT

iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 80 -j ACCEPT