import paho.mqtt.client as mqtt
import time
import json
import random

# Configuración de conexión MQTT
MQTT_BROKER = "192.168.1.49"  # IP del broker Mosquitto en la máquina virtual
MQTT_PORT = 1883
MQTT_TOPIC = "sensores"  # Tema único para todos los sensores
SENSORES = 5145  # Número total de sensores

# Función de conexión
def on_connect(client, userdata, flags, rc):
    if rc == 0:
        print("Conexión exitosa al broker MQTT")
    else:
        print(f"Error de conexión, código de retorno: {rc}")

# Función para generar datos simulados de los sensores
def generar_datos_sensor(sensor_id):
    return {
        "sensor_id": sensor_id,
        "temperatura": round(random.uniform(20, 30), 2),
        "humedad": round(random.uniform(40, 60), 2),
        "co2": round(random.uniform(400, 800), 2),
        "cov": round(random.uniform(0.1, 0.8), 2),
        "timestamp": time.time()
    }

# Crear un cliente MQTT
cliente = mqtt.Client()
cliente.on_connect = on_connect

# Conectar al broker MQTT
cliente.connect(MQTT_BROKER, MQTT_PORT, 60)
cliente.loop_start()  # Inicia el loop en segundo plano para mantener la conexión abierta

# Publicar datos en el tema 'sensores'
try:
    while True:
        for sensor_id in range(1, SENSORES + 1):
            datos = generar_datos_sensor(sensor_id)
            payload = json.dumps(datos)
            cliente.publish(MQTT_TOPIC, payload)  # Publica todos los sensores en el tema 'sensores'
            print(f"Publicado datos para sensor {sensor_id}")
        print(f"Publicado un lote de {SENSORES} sensores")
        time.sleep(5)  # Espera 5 segundos antes de publicar el siguiente lote de datos
except KeyboardInterrupt:
    print("Simulación detenida")
    cliente.disconnect()
except Exception as e:
    print(f"Error al publicar los datos: {str(e)}")
