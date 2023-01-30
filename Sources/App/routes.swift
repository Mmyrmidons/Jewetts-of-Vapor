import Vapor

struct Pages {
    let index = "pages/index"
    let spudandal = "pages/spudandal"
    let yevvi = "pages/yevvi"
}

func routes(_ app: Application) throws {
    let pages = Pages()
    
    app.get { req async throws -> View in
        return try await req.view.render(pages.index)
    }

    app.get("yevvi") { req async throws -> View in
        return try await req.view.render(pages.yevvi)
    }

    app.get("spudandal") { req async throws -> View in
        return try await req.view.render(pages.spudandal)
    }
}
