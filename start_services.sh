# Iniciar Mosquitto (Broker MQTT)
sudo systemctl start mosquitto
sudo systemctl enable mosquitto

# Iniciar HAProxy (Balanceador de carga)
sudo systemctl start haproxy
sudo systemctl enable haproxy

# Iniciar InfluxDB (Base de datos)
sudo systemctl start influxdb
# Iniciar Node-RED (Middleware)
node-red &  # Ejecutar en segundo plano
