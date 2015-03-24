#/bin/bash

upload_to_tutum() {
  declare app_name=$1

  docker tag ${app_name} tutum.co/stigkj/${app_name}
  docker push tutum.co/stigkj/${app_name}
}

upload_to_tutum flight_web
upload_to_tutum flight_storagesolrsearchresult
upload_to_tutum flight_integration
upload_to_tutum flight_storagesolrautocomplete
upload_to_tutum flight_storagesolrimport
upload_to_tutum flight_supplierintegrations
upload_to_tutum flight_api
