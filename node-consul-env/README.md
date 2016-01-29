# node-consul-env

Run a Node.js application with Consul + envconsul to retrieve KV as environment variables in your app.

The Consul KV store is watched at dc/home/environment/service/%SERVICE_NAME%/tag/any/
and any change will restart your Node.js app with the new keys and values as envirionment variables.

## Customization

* SERVICE_NAME - dc/home/environment/service/%SERVICE_NAME%/tag/any/
* CONSUL_HOST - hostname of the Consul server to connect to
