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
	
//	hiGiggi()
}

func hiGiggi() {
	if let cUrl = URL(string: "http://urtheaters.com/things/c.4.07.3.xml") {
		do {
			let cXml = try XMLDocument(contentsOf: cUrl, options: .nodePreserveAll)
			
			if let tUrl = URL(string: "http://urtheaters.com/things/title.xsl") {
				do {
					if let cData = try cXml.objectByApplyingXSLT(at: tUrl, arguments: nil) as? Data {
						let cHtml = String(decoding: cData, as: UTF8.self)
						print("Hi Giggi: ", cUrl, " :::: ", cHtml)
						

					}
				} catch {}
			}
		} catch {}
	}
}
