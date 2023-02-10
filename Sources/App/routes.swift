import Vapor

struct Pages {
    static let index = "pages/index"
    static let spudandal = "pages/spudandal"
    static let yevvi = "pages/yevvi"
}

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
        return try await req.view.render(Pages.index)
    }

    app.get("yevvi") { req async throws -> View in
        return try await req.view.render(Pages.yevvi)
    }

    app.get("spudandal") { req async throws -> View in
        return try await req.view.render(Pages.spudandal)
    }
}
