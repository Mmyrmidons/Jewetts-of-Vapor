enum Emotion: String, Encodable {
	case like
	case love
	case care
	case haha
	case wow
	case sad
	case angry
	case nofuckingshit
	
	static func emote(_ emotions:[Emotion: Int]) -> [String: Int] {
		var ozzisEmotions:[String: Int] = [:]
		
		for (key, value) in emotions {
			ozzisEmotions[key.rawValue] = value
		}
		
		return ozzisEmotions
	}
}

struct Reaction: Encodable {
	var emotion:Emotion
	var count:Int
}


struct Post: Encodable {
	var message:String
	var hashtags:[String]
	var imageUrl:String
	var reactions:[String: Int]?
	var shares:Int
}

class Frazurbluu {
	static let feed = [
				Post(message: "<div>Today’s the purrrfect day to share this week’s special. 🙂</div>",
					hashtags: ["CNY", "cnycheesetrail", "madisoncny", "buymadison", "jewetts", "familybusiness", "localbusiness", "cheese", "sundayfunday", "cheddar", "chainsawman"],
					imageUrl: "/img/feed/purrrfect.jpg",
					reactions: Emotion.emote([.like: 37, .love: 3]),
					shares: 3
				),
				Post(message: "<div>A cat on a hat one day late!</div><div>A snowman with shamrocks who’s ready to skate.</div><div>We’re Open this Sunday so don’t be late- 😉</div>",
					 hashtags: ["CNY", "cnycheesetrail", "madisoncny", "buymadison", "jewetts", "familybusiness", "localbusiness", "cheese", "sundayfunday", "cheddar", "chainsawman"],
					 imageUrl: "/img/feed/catonahat.jpg",
					 reactions: Emotion.emote([.like: 49, .haha: 11, .love: 8, .care: 1]),
					 shares: 0
				 ),
				Post(message: "<div>🧀😢 What a loss! ❤️🧀</div><div>The Jewett family thanks YOU for your continued patronage during these unstable economic times.  ❤️</div>",
					 hashtags: ["CNY", "cnycheesetrail", "madisoncny", "buymadison", "jewetts", "dairy", "localbusiness", "familybusiness", "cheddar", "mozzarella", "littleitaly", "alleva"],
					 imageUrl: "/img/feed/alleva.jpg",
					 reactions: Emotion.emote([.like: 7, .care: 1, .wow: 2, .sad: 17]),
					 shares: 0
				 ),
				Post(message: "<div>🧀OPEN SUNDAY 2/26🧀</div><div>⭐️10:30 - 3 pm⭐️</div><div>❤️The Cardinals love our</div><div>chainsaw art Snowman!❤️</div>",
					 hashtags: ["CNY", "cnycheesetrail", "madisoncny", "buymadison", "jewetts", "familybusiness", "localbusiness", "cheese", "sundayfunday", "cheddar", "chainsawman"],
					 imageUrl: "/img/feed/snowman.jpg",
					 reactions: Emotion.emote([.like: 35, .love: 8]),
					 shares: 0
				 ),
				Post(message: "<div>🧀🧀EVERYBODY!!!🧀🧀</div><div>⭐️Fresh Cheese Curds⭐️</div><div>Re-stocked and ready for ya!</div><div>💲6.99 /lb.</div>",
					 hashtags: ["CNY", "cnycheesetrail", "madisoncny", "buymadison", "jewetts", "familybusiness", "localbusiness", "cheese", "sundayfunday", "cheddar", "chainsawman"],
					 imageUrl: "/img/feed/curds.jpg",
					 reactions: Emotion.emote([.like: 35, .love: 7, .care: 1]),
					 shares: 0
				),
				Post(message: "<div>🧀OPEN SUNDAY 2/19🧀</div><div>⭐️10:30 - 3 pm⭐️</div><div>We just opened a new wheel</div><div>of Imported Danish Blue Cheese!</div><div>~Rich, Creamy, and Bold~</div><div>Perfect by itself or atop your</div><div>favorite green salad!</div><div>At $12.85 /lb. it’s a steal!</div>",
					 hashtags: ["CNY", "cnycheesetrail", "madisoncny", "buymadison", "jewetts", "familybusiness", "localbusiness", "cheese", "sundayfunday", "cheddar", "chainsawman"],
					 imageUrl: "/img/feed/newwheel.jpg",
					 reactions: Emotion.emote([.like: 31, .love: 3, .wow: 4, .sad: 1]),
					 shares: 3
				 ),
			]
	
	private init() {}
}
