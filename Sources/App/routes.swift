import Vapor

struct Pages {
    static let index = "pages/index"
    static let spudandal = "pages/spudandal"
    static let yevvi = "pages/yevvi"
}

func routes(_ app: Application) throws {
    app.get { req async throws -> View in
		struct Index: Codable {
			//	func render(_ ctx: LeafContext) throws -> LeafData {
			//		if let app = ctx.application {
			//			let fileURL = URL(fileURLWithPath: app.directory.publicDirectory).appendingPathComponent("img/various", isDirectory: true)
			//
			//			do {
			//				let fileList = try FileManager.default.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: nil)
			//
			//				print(fileList)
			//
			//
			//
			//			} catch {}
			//		}
			//
			//		return LeafData.array(["Hi Mistr Ozz", "Hi Anni-kins"])
			//	}
				
//			var pix:Array<String> {
//				return Array()// ["Hi Mistr Ozz", "Hi Anni-kins"]
//			}
			var pix = ["Hi Mistr Ozz", "Hi Anni-kins"]
		}

        return try await req.view.render(Pages.index, Index())
    }

    app.get("yevvi") { req async throws -> View in
        return try await req.view.render(Pages.yevvi)
    }

    app.get("spudandal") { req async throws -> View in
        return try await req.view.render(Pages.spudandal)
    }
}
