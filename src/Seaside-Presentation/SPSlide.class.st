Class {
	#name : #SPSlide,
	#superclass : #SPComponent,
	#instVars : [
		'title',
		'content'
	],
	#category : #'Seaside-Presentation'
}

{ #category : #'instance creation' }
SPSlide class >> title: aString content: aBlock [
	^ self new
		title: aString;
		content: aBlock;
		yourself
]

{ #category : #accessing }
SPSlide >> content [
	^ content
]

{ #category : #accessing }
SPSlide >> content: anObject [
	content := anObject
]

{ #category : #rendering }
SPSlide >> renderContentOn: html [
	html heading: self title.
	self content cull: html
]

{ #category : #accessing }
SPSlide >> title [
	^ title
]

{ #category : #accessing }
SPSlide >> title: anObject [
	title := anObject
]
