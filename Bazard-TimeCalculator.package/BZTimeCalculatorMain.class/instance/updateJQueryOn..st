javascript
updateJQueryOn: html
	^ html jQuery ajax
		serializeThis;
		onComplete: ((html jQuery id: #content) load html: [ self renderDurationsOn: html ])