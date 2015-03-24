#/bin/bash

pull_from_tutum() {
  declare app_name=$1
  declare public_ip=$2

  ssh jclouds@${public_ip} sudo docker pull tutum.co/stigkj/${app_name}
}

push_flight_images() {
  declare public_ip=$1

  echo '{"tutum.co":{"auth":"c3RpZ2tqOnVIZHVlUjdSZHhNaDhX","email":"from.tutum@nisgits.net"}}' | \
    ssh jclouds@${public_ip} "sudo tee /root/.dockercfg > ~/.dockercfg"

  pull_from_tutum flight_web ${public_ip}
  pull_from_tutum flight_storagesolrsearchresult ${public_ip}
  pull_from_tutum flight_integration ${public_ip}
  pull_from_tutum flight_storagesolrautocomplete ${public_ip}
  pull_from_tutum flight_storagesolrimport ${public_ip}
  pull_from_tutum flight_supplierintegrations ${public_ip}
  pull_from_tutum flight_api ${public_ip}
}

push_flight_images 130.211.189.205
push_flight_images 130.211.142.2
push_flight_images 146.148.42.159
