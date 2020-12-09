# Подключить репозиторий Docker

# Установим пакеты, необходимые для работы apt по протоколу HTTPS
sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# Добавляем ключ репозитория
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Подключаем репозиторий
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Обновляем список пакетов
sudo apt update

# устанавливаем пакет
sudo apt install docker-ce -y
