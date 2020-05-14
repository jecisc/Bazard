Class {
	#name : #SlotDeprecation,
	#superclass : #Deprecation,
	#category : #DeprecatedSlot
}

{ #category : #accessing }
SlotDeprecation >> messageText [
	^ String
		streamContents: [ :str | 
			self shouldTransform ifTrue: [ str nextPutAll: 'Automatic deprecation code rewrite: ' ].
			str
				nextPutAll: 'The instance variable ';
				nextPutAll: context receiver name;
				nextPutAll: ' accessed in ';
				nextPutAll: context sender method name;
				nextPutAll: ' has been deprecated. ';
				nextPutAll: explanationString ]
]
