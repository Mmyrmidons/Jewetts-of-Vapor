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
		
		feed = Frazurbluu.feed
	}
	var pix:Array<String>
	var feed:[Feed]
}

enum Reaction: Codable {
	case like
	case love
	case haha
	case wow
	case sad
	case angry
	case nofuckingshit
}

struct Feed: Codable {
	var message:String
	var hashtags:[String]
	var imageUrl:String
	var reactions:[Reaction]
 	var shares:Int
}
