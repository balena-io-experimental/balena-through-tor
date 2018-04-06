# Resin.io device through Tor

This **experimental** project sets up a multi-container resin.io application,
that takes advantage of [Tor](https://www.torproject.org/), routing all device
and application communication through the Tor network.

## Setup

This project includes two service:

* `torproxy` sets up the actual tor socks5 proxy
* `main` is an example service that demonstrates communicating through the proxy.
  You can replace this with any other service, or add multiple services.

### Application

At the moment the application needs to be set up with `network_mode: "host"`
to be proxied.

### Host

In the host you need to create a `/system-proxy/` folder on the `resin-boot`
partition, and a `redsocks.conf` file with the following contents:

```
base {
log_debug = off;
log_info = on;
log = stderr;
daemon = off;
redirector = iptables;
}

redsocks {
type = socks5;
ip = 127.0.0.1;
port = 9050;
local_ip = 127.0.0.1;
local_port = 12345;
}
```

This sets up the device to try proxy through the local `9050` port.

## Warnings

It is an **experimental** project, so all kinds of things can break.

Also, if the device loses the `torproxy` service, it won't be able to communicate
at all, and won't be able to update itself!

## License

Copyright 2018 Resinio Ltd.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
