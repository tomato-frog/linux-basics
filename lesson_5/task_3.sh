# Настроить iptables: разрешить подключения только на 22-й и 80-й порты.
# Действия по умолчанию
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Разрешаем обмен по локальной петле
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Разрешаем пакеты icmp (для обмена служебной информацией)
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT

# Разрешаем соединения с динамических портов
iptables -A OUTPUT -p TCP -m tcp --sport 32768:61000 -j ACCEPT
iptables -A OUTPUT -p UDP -m udp --sport 32768:61000 -j ACCEPT

# Разрешить только те пакеты, которые мы запросили
iptables -A INPUT -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 22 -j ACCEPT

iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 80 -j ACCEPT
