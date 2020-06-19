# shell script to create and prepare directories that we will bind as volumes to the corresponding container. So we ave some "persistent" data for our containers 

#dsmr_fluvius -> used for the 'real Smart meter'
sudo mkdir -p /openmeter/data/dsmr_fluvius

#dsmr_sim   -> used to mimic and test the E2E application without a connection to a 'real meter'
sudo mkdir -p /openmeter/data/dsmr_sim

#mqtt_broker
#Prepare shared bind volumes for container
sudo mkdir -p /openmeter/data/mqtt_broker/data
sudo mkdir -p /openmeter/data/mqtt_broker/log
sudo mkdir -p /openmeter/data/mqtt_broker/config
# Copy config for mosquitto for later pickup by dockerfile broker
#remember to launch it from /openmeter/data !
cp mosquitto.conf /openmeter/data/mqtt_broker/config
#Container user needs rights for volume
sudo chown -R 1883:1883 /openmeter/data/mqtt_broker

#openhab
sudo mkdir -p /openmeter/data/openhab/addons
sudo mkdir -p /openmeter/data/openhab/conf
sudo mkdir -p /openmeter/data/openhab/userdata

#influxdb
sudo mkdir -p /openmeter/data/influxdb/db/openhab