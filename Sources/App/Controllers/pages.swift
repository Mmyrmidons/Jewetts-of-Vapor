import Vapor

struct Index: Encodable {
	init(_ app: Application) throws {
		let imgLocation = "/img/various/"
		let fileURL = URL(fileURLWithPath: app.directory.publicDirectory).appendingPathComponent(imgLocation, isDirectory: true)

		do {
			let imgPaths = try FileManager.default.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: nil).map {
				imgLocation + $0.lastPathComponent
			}.shuffled()
			
			pix = Array(imgPaths.prefix(4))
		} catch { throw CheeseError.ImagePathError(error) }
		
		feed = Frazurbluu.feed
	}

	var pix:Array<String>
	var feed:[Post]
	
	var hiGiggi = "Hi Giggi"
	var hiOzz: String {
		"Hi Ozz"
	}
}
