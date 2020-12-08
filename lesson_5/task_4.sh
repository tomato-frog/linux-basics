# Настроить проброс портов локально с порта 80 на порт 8080
# Включить переадресацию трафика на уровне ядра, изменив значение параметра net.ipv4.ip_forward на 1
sudo sysctl -w net.ipv4.ip_forward=1

# Ввести данную запись в конец файла в котором содержатся правила iptables
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
