FROM python:3

RUN apt-get update && apt-get -y install cron bluez bluez-firmware
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN mv ./xiaomi-ble-mqtt-cron /etc/cron.d/xiaomi-ble-mqtt-cron && chmod 0644 /etc/cron.d/xiaomi-ble-mqtt-cron && crontab /etc/cron.d/xiaomi-ble-mqtt-cron
RUN mkdir log
RUN chmod +x /usr/src/app/docker-entrypoint.sh

RUN touch /var/log/cron.log

ENTRYPOINT [ "/usr/src/app/docker-entrypoint.sh" ]
#CMD cron && tail -f /var/log/cron.log
