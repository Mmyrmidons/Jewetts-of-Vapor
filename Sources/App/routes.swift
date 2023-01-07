import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works Mistr Ozz!"
    }
    
    app.get("giggi") { req async -> String in
        "Hello, Giggi!"
    }
    
    app.get("ozzi") { req async throws -> View in
        return try await req.view.render("ozzi", ["hiToOzzi": "Hi Ozz!"])
    }
}
