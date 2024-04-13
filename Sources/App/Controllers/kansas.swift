import Vapor

extension URL {
	var isDirectory: Bool {
	   (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
	}
}

struct Kansas: Encodable {
	enum GnatError: Error {
		case Mp3PathParse(Error)
		case Mp3NotFound
		case JsonEncoding(Error)
	}
	
	struct Bootleg: Encodable {
		init() { venue = "Giggi's Haus" }
		
		init(_ mp3Url: URL) throws {
			
			func bootlegBuilder(_ showFact: inout String) throws {
				if let last = showInfo.last {
					showFact = last
					showInfo.removeLast()
				} else { throw GnatError.Mp3NotFound }
			}
						
			var showInfo = mp3Url.pathComponents
			
			try bootlegBuilder(&song)
			try bootlegBuilder(&venue)
			try bootlegBuilder(&date)
			try bootlegBuilder(&name)
			
			
			song = song.replacingOccurrences(of: ".mp3", with: "")
		}
		
		func toJson() throws -> String  {
			let encoder = JSONEncoder()

			encoder.outputFormatting = .prettyPrinted

			do {
				let data = try encoder.encode(self)

				return String(data: data, encoding: .utf8)!
			} catch { throw GnatError.JsonEncoding(error) }
		}

		var name = ""
		var song = ""
		var venue = ""
		var date = ""
	}

	
	init(_ app: Application) throws {
		func lookForMp3(_ node: URL) throws -> URL {
			do {
				let children = try FileManager.default.contentsOfDirectory(at: node, includingPropertiesForKeys: nil).filter({
					$0.isDirectory || $0.lastPathComponent.hasSuffix(".mp3")
				}).shuffled()
				
				if let selectedComponent = children.first {
					if selectedComponent.lastPathComponent.hasSuffix(".mp3") {
						return node.appendingPathComponent(selectedComponent.lastPathComponent)
					}

					return try lookForMp3(node.appendingPathComponent(selectedComponent.lastPathComponent))
				}
				
				throw GnatError.Mp3NotFound
			} catch { throw GnatError.Mp3PathParse(error) }
		}
		
		do {
			let mp3Url = try lookForMp3(URL(fileURLWithPath: app.directory.publicDirectory).appendingPathComponent("kansas/", isDirectory: true))
			
			bootleg = try Bootleg(mp3Url)
		} catch { print(error) }
	}
	
	var bootleg = Bootleg()
}
