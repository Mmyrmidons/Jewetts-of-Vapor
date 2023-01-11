import Vapor
import Leaf

public func configure(_ app: Application) throws {
    app.http.server.configuration.port = 3099

    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)

    try routes(app)
}
