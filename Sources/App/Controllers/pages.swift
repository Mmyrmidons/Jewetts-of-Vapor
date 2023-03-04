import Vapor

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
