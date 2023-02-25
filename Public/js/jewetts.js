let jewetts = (function() {
	let id = "102045542829255"

    let onReady = function() {
		initEvents()
		facebook()
		
		$.getScript("https://www.jewettscheese.com/js/giggi.js", function() {
			giggi()
		})
	}
	
	let facebook = function() {
		
		
	}
	
	let initEvents = function() {}
	
    return {
		onReady: onReady
    }
})()

$(document).ready(function() {
	jewetts.onReady()
})
