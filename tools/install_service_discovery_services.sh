#/bin/bash

install_service_discovery() {
  declare HOSTNAME=$1
  declare PUBLIC_IP=$2
  declare PRIVATE_IP=$3
  declare BRIDGE_IP=172.17.42.1

  ssh jclouds@${PUBLIC_IP} sudo docker run -d --name consul -h $HOSTNAME \
    -p $PRIVATE_IP:8300:8300 -p $PRIVATE_IP:8301:8301 -p $PRIVATE_IP:8301:8301/udp \
    -p $PRIVATE_IP:8302:8302 -p $PRIVATE_IP:8302:8302/udp -p $PRIVATE_IP:8400:8400 \
    -p $PRIVATE_IP:8500:8500 -p $BRIDGE_IP:53:53/udp \
    progrium/consul -server -advertise $PRIVATE_IP -bootstrap-expect 3

  ssh jclouds@${PUBLIC_IP} sudo docker run -d --name registrator \
    -v /var/run/docker.sock:/tmp/docker.sock \
    -h $HOSTNAME progrium/registrator consul://$PRIVATE_IP:8500

  echo '{"tutum.co":{"auth":"c3RpZ2tqOnVIZHVlUjdSZHhNaDhX","email":"from.tutum@nisgits.net"}}' | \
    ssh jclouds@${PUBLIC_IP} "sudo tee /root/.dockercfg > ~/.dockercfg"
}

install_service_discovery development-4445-2   130.211.189.205 10.134.107.253
install_service_discovery development-4445-bc4 130.211.142.2   10.186.40.180
install_service_discovery development-4445-3fd 146.148.42.159  10.189.64.34
