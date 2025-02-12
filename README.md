# Gatekeeper 👮
[![Swift Version](https://img.shields.io/badge/Swift-4.2-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-3-30B6FC.svg)](http://vapor.codes)
[![Circle CI](https://circleci.com/gh/nodes-vapor/gatekeeper/tree/master.svg?style=shield)](https://circleci.com/gh/nodes-vapor/gatekeeper)
[![codebeat badge](https://codebeat.co/badges/35c7b0bb-1662-44ae-b953-ab1d4aaf231f)](https://codebeat.co/projects/github-com-nodes-vapor-gatekeeper-master)
[![codecov](https://codecov.io/gh/nodes-vapor/gatekeeper/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/gatekeeper)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/gatekeeper)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/gatekeeper)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/gatekeeper/master/LICENSE)

Gatekeeper is a middleware that restricts the number of requests from clients, based on their IP address.
It works by adding the clients IP address to the cache and count how many requests the clients can make during the Gatekeeper's defined lifespan and give back an HTTP 429(Too Many Requests) if the limit has been reached. The number of requests left will be reset when the defined timespan has been reached.

**Please take into consideration that multiple clients can be using the same IP address. eg. public wifi**


## 📦 Installation

Update your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/nodes-vapor/gatekeeper.git", from: "3.0.0"),
```

as well as to your target (e.g. "App"):

```swift
targets: [
    .target(name: "App", dependencies: [..., "Gatekeeper", ...]),
// ...
]
```

## Getting started 🚀

### Configuration

in configure.swift:
```swift
import Gatekeeper

// [...]

// Register providers first
try services.register(
    GatekeeperProvider(
        config: GatekeeperConfig(maxRequests: 10, per: .second),
        cacheFactory: { container -> KeyedCache in
            return try container.make()
        }
    )
)
```

### Add to routes

You can add the `GatekeeperMiddleware` to specific routes or to all.

**Specific routes**
in routes.swift:
```swift
let protectedRoutes = router.grouped(GatekeeperMiddleware.self)
protectedRoutes.get("protected/hello") { req in
    return "Protected Hello, World!"
}
```

**For all requests**
in configure.swift:
```swift
// Register middleware
var middlewares = MiddlewareConfig() // Create _empty_ middleware config
middlewares.use(GatekeeperMiddleware.self)
services.register(middlewares)
```

## Credits 🏆

This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com).
The package owner for this project is [Christian](https://github.com/cweinberger).

## License 📄

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
