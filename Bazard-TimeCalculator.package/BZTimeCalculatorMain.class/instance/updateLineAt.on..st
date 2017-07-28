javascript
updateLineAt: ind on: html
	^ html jQuery ajax
		serializeThis;
		onComplete: ((html jQuery id: 'content' , ind asString) load html: [ self renderResultFor: ind on: html ])