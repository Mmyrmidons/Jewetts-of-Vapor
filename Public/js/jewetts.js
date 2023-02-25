let jewetts = (function() {
	let id = "102045542829255"

    let onReady = function() {
		initEvents()
	}
	
	let facebook = function(FB) {
		$.getScript("https://www.jewettscheese.com/js/giggi.js", function() {
			giggi(FB)
		})
	}
	
	let initEvents = function() {}
	
    return {
		onReady: onReady
    }
})()

$(document).ready(function() {
	jewetts.onReady()
})
