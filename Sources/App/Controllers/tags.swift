import Vapor
import Leaf

struct CatGreetingTag: LeafTag {
	func render(_ ctx: LeafContext) throws -> LeafData {
		let salutation = ["Hi ", "Hail ", "Good even ", "How do you ", "How now ", "What cheer ", "Well met "].shuffled().first
		let cat = ["Birdi Jr", "Miss Moon", "Anni-mu", "Ozz", "Giggers"].shuffled().first
		
		return LeafData.string(salutation! + cat!)
	}
}

struct TitleTag: LeafTag {
	func render(_ ctx: LeafContext) throws -> LeafData {
		let salutation = ["Hi ", "Hail ", "Good even ", "How do you ", "How now ", "What cheer ", "Well met "].shuffled().first
		let cat = ["Birdi Jr", "Miss Moon", "Anni-mu", "Ozz", "Giggers"].shuffled().first
		
		return LeafData.string(salutation! + cat!)
	}
}

struct KeywordsTag: LeafTag {
	func render(_ ctx: LeafContext) throws -> LeafData {
		let salutation = ["Hi ", "Hail ", "Good even ", "How do you ", "How now ", "What cheer ", "Well met "].shuffled().first
		let cat = ["Birdi Jr", "Miss Moon", "Anni-mu", "Ozz", "Giggers"].shuffled().first
		
		return LeafData.string(salutation! + cat!)
	}
}

struct ThisYearTag: LeafTag {
	func render(_ ctx: LeafContext) throws -> LeafData {
		return LeafData.int(Calendar.current.component(.year, from: Date()))
	}
}
