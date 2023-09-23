let jewetts = (function() {
//	let id = "102045542829255"

    let onReady = function() {
		initEvents()
	}
	
	let initFacebook = function(FB) {
//		$.getScript("https://www.jewettscheese.com/js/giggi.js", function() {
//			giggi(FB)
//		})
	}
	
	let initEvents = function() {
		$(".cheeseHouse p:first").css("backgroundColor", "firebrick")
	}
	
    return {
		onReady: onReady,
		initFacebook: initFacebook
    }
})()

$(document).ready(function() {
	jewetts.onReady()
})
