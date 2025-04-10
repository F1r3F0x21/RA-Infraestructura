sudo apt update
sudo apt upgrade -y
# Instalar Mosquitto (Broker MQTT)
sudo apt install -y mosquitto mosquitto-clients

# Instalar HAProxy (Balanceador de carga)
sudo apt install -y haproxy

# Instalar InfluxDB (Base de datos para métricas)
sudo apt install -y influxdb
# Instalar Node-RED (Middleware para transformar datos)
sudo npm install -g --unsafe-perm node-red

# Instalar Python3 y Flask (Para servicios personalizados)
sudo apt install -y python3 python3-pip
pip3 install flask paho-mqtt influxdb
