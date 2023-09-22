import Vapor
import Leaf

public func configure(_ app: Application) throws {
    app.http.server.configuration.port = 3099
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)
	app.leaf.tags["catGreeting"] = CatGreetingTag()
	app.leaf.tags["title"] = TitleTag()
	app.leaf.tags["keywords"] = KeywordsTag()

    try routes(app)
}
