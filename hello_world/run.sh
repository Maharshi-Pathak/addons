#!/usr/bin/with-contenv bashio
declare ingress_port
ingress_port=$(bashio::addon.ingress_port)

python3 -m http.server ${ingress_port}

echo Hello world!


