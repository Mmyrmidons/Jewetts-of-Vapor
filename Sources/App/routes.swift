import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
        return try await req.view.render("ozzi", ["hiToOzzi": "Hi Ozz!"])
    }
    
    app.get("ozzi") { req async throws -> View in
        return try await req.view.render("ozzi", ["hiToOzzi": "Hi Ozz!"])
    }

    app.get("giggi") { req async -> String in
        "Hello, Giggi!"
    }
}
