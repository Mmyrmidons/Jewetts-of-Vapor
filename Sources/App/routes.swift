import Vapor

enum CheeseError: Error {
	case ImagePathError(Error)
}

struct Pages {
    static let index = "pages/index"
    static let spudandal = "pages/spudandal"
    static let yevvi = "pages/yevvi"
}

struct Index: Codable {
	init(_ app: Application) throws {
		let imgLocation = "/img/various/"
		let fileURL = URL(fileURLWithPath: app.directory.publicDirectory).appendingPathComponent(imgLocation, isDirectory: true)
				
		do {
			let imgPaths = try FileManager.default.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: nil).map {
				imgLocation + $0.lastPathComponent
			}.shuffled()
			
			pix = Array(imgPaths.prefix(4))
		} catch { throw CheeseError.ImagePathError(error) }
	}
	var pix:Array<String>
}

func routes(_ app: Application) throws {
	let index = try Index(app)
	
    app.get { req async throws -> View in
        return try await req.view.render(Pages.index, index)
    }

    app.get("yevvi") { req async throws -> View in
        return try await req.view.render(Pages.yevvi)
    }

    app.get("spudandal") { req async throws -> View in
        return try await req.view.render(Pages.spudandal)
    }
}
