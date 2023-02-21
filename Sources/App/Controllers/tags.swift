import Vapor
import Leaf

struct ImageListTag: LeafTag {
	func render(_ ctx: LeafContext) throws -> LeafData {
		if let app = ctx.application {
			let fileURL = URL(fileURLWithPath: app.directory.publicDirectory).appendingPathComponent("img/various", isDirectory: true)

			do {
				let fileList = try FileManager.default.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: nil)
				
				print(fileList)
				
		

			} catch {}
		}

		return LeafData.array(["Hi Mistr Ozz", "Hi Anni-kins"])
	}
}
