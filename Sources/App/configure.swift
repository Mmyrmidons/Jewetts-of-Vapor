import Vapor
import Leaf

struct Doctl {
    let login = "doctl registry login"
    let build = "docker build --platform=linux/amd64 -t jewetts:anni ."
    let tag = "docker tag jewetts:anni registry.digitalocean.com/jewetts/jewetts:anni"
    let push = "docker push registry.digitalocean.com/jewetts/jewetts:anni"
}

public func configure(_ app: Application) throws {
    app.http.server.configuration.port = 3099
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)

    try routes(app)
}
