# Подключить репозиторий с nginx, установить nginx и потом удалить nginx, используя утилиту dpkg.
# Переходим в папку /etc/apt/
cd /etc/apt/

# Добавляем в конец файла sources.list строку нового репозитория для nginx, сохраняем и выходим обратно в терминал
deb http://nginx.org/packages/ubuntu focal nginx

# Пишем ключ, который используется для проверки
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

# Удаляем с помощью утилиты dpkg
sudo dpkg -r nginx
