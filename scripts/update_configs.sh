#!/bin/bash

# Definir la ruta del repositorio
REPO_DIR="/home/redes/trabajo/RA-Infraestructura"

# Copiar archivos de configuración de Mosquitto
echo "Actualizando la configuración de Mosquitto..."
sudo cp $REPO_DIR/mosquitto/mosquitto.conf /etc/mosquitto/mosquitto.conf

# Copiar archivos de configuración de HAProxy
echo "Actualizando la configuración de HAProxy..."
sudo cp $REPO_DIR/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg

# Copiar archivos de configuración de InfluxDB
echo "Actualizando la configuración de InfluxDB..."
sudo cp $REPO_DIR/influxdb/influxdb.conf /etc/influxdb/influxdb.conf

# Copiar archivos de configuración de Grafana
echo "Actualizando la configuración de Grafana..."
sudo cp $REPO_DIR/grafana/grafana.ini /etc/grafana/grafana.ini
sudo cp $REPO_DIR/grafana/dashboards/* /var/lib/grafana/dashboards/

# Copiar los flujos de Node-RED
echo "Actualizando los flujos de Node-RED..."
sudo cp $REPO_DIR/node-red/node-red-flows.json ~/.node-red/flows_$(hostname).json

# Mostrar un mensaje de éxito
echo "Archivos de configuración actualizados correctamente."

# (Opcional) Reiniciar los servicios después de actualizar la configuración
echo "Reiniciando los servicios..."
sudo systemctl restart mosquitto
sudo systemctl restart haproxy
sudo systemctl restart influxdb
sudo systemctl restart grafana-server
node-red &