Class {
	#name : #SPComponent,
	#superclass : #WAComponent,
	#category : #'Seaside-Presentation'
}

{ #category : #accessing }
SPComponent >> rootComponent [
	^ self session rootComponent
]
