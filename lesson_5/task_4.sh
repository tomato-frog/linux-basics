# Настроить проброс портов локально с порта 80 на порт 8080
# Включить переадресацию трафика на уровне ядра, изменив значение параметра net.ipv4.ip_forward на 1
sudo sysctl -w net.ipv4.ip_forward=1

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

# Разрешаем работу с портом 8080
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 8080 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 8080 -j ACCEPT

# Ввести данную запись в конец файла в котором содержатся правила iptables
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
