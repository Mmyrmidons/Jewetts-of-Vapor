protocol Apple {
	var pageId:String { get }
	var appId:String { get }
}

struct YourAgonizerPlease: Apple {
	let pageId = "102045542829255"
	let appId = "589829313184679"
}

struct BigCheese: Apple {
	let pageId:String
	let appId:String
}
