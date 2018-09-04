Class {
	#name : #CVEntry,
	#superclass : #WAComponent,
	#instVars : [
		'date',
		'description',
		'items'
	],
	#category : 'CV'
}

{ #category : #'instance creation' }
CVEntry class >> dated: aString description: aString2 items: aCollection [
	^ self new
		date: aString;
		description: aString2;
		items: aCollection;
		yourself
]

{ #category : #accessing }
CVEntry >> date [
	^ date
]

{ #category : #accessing }
CVEntry >> date: anObject [
	date := anObject
]

{ #category : #accessing }
CVEntry >> description [
	^ description
]

{ #category : #accessing }
CVEntry >> description: anObject [
	description := anObject
]

{ #category : #accessing }
CVEntry >> items [
	^ items
]

{ #category : #accessing }
CVEntry >> items: anObject [
	items := anObject
]

{ #category : #rendering }
CVEntry >> renderContentOn: html [
	html span: self date.
	html emphasis: self description.
	html unorderedList: [ self items do: [ :e | html listItem: e ] ]
]
