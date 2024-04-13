import Vapor

enum CheeseError: Error {
	case ImagePathError(Error)
}

struct Pages {
    static let index = "pages/index"
    static let spudandal = "pages/spudandal"
	static let yevvi = "pages/yevvi"
}

func routes(_ app: Application) throws {
	let index = try Index(app)
	
	app.get("ozzi") { req async throws -> View in
		return try await req.view.render(Pages.index, index)
	}

	app.get("yevvi") { req async throws -> View in
		return try await req.view.render(Pages.yevvi)
	}
	
	app.get("spudandal") { req async throws -> View in
		return try await req.view.render(Pages.spudandal)
	}
	
	try whitePages(app)
	try gnatAttack(app)
}

func whitePages(_ app: Application) throws {
	struct WhitePages {
		static let index = "white/index"
		static let about = "white/about"
		static let cheeses = "white/cheeses"
		static let goodies = "white/goodies"
		static let gifts = "white/gifts"
		static let location = "white/location"
		static let events = "white/events"
		static let customers = "white/customers"
		static let brochure = "white/brochure"
		static let orderinfo = "white/orderinfo"
	}
	
	app.get { req async throws -> View in
		return try await req.view.render(WhitePages.index)
	}

	app.get("white", "about") { req async throws -> View in
		return try await req.view.render(WhitePages.about)
	}
	
	app.get("white", "cheeses") { req async throws -> View in
		return try await req.view.render(WhitePages.cheeses)
	}
	
	app.get("white", "goodies") { req async throws -> View in
		return try await req.view.render(WhitePages.goodies)
	}
	
	app.get("white", "gifts") { req async throws -> View in
		return try await req.view.render(WhitePages.gifts)
	}
	
	app.get("white", "location") { req async throws -> View in
		return try await req.view.render(WhitePages.location)
	}
	
	app.get("white", "events") { req async throws -> View in
		return try await req.view.render(WhitePages.events)
	}
	
	app.get("white", "customers") { req async throws -> View in
		return try await req.view.render(WhitePages.customers)
	}
	
	app.get("white", "brochure") { req async throws -> View in
		return try await req.view.render(WhitePages.brochure)
	}
	
	app.get("white", "orderinfo") { req async throws -> View in
		return try await req.view.render(WhitePages.orderinfo)
	}
}

func gnatAttack(_ app: Application) throws {
	struct GnatPages {
		static let kansas = "pages/kansas"
	}

	app.get("kansas") { req async throws -> View in
		return try await req.view.render(GnatPages.kansas, Kansas(app))
	}
	
	app.get("kansas", "nextSong") { req async throws -> String in
		return try Kansas(app).bootleg.toJson()
	}
}
