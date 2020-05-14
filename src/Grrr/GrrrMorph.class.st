Class {
	#name : #GrrrMorph,
	#superclass : #Morph,
	#instVars : [
		'content'
	],
	#category : #Grrr
}

{ #category : #'world menu' }
GrrrMorph class >> worldMenuOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Example)
		action: [ (self new content: DateAndTime now) openInWorld "actionBlock: [ Transcript open ]" ];
		order: 10000
]

{ #category : #accessing }
GrrrMorph >> content [
	^ content
]

{ #category : #accessing }
GrrrMorph >> content: anObject [
	content := anObject
]

{ #category : #accessing }
GrrrMorph >> initialize [
	super initialize. 
	self color: (Color fromHexString: '205598')
]

{ #category : #initialization }
GrrrMorph >> initializeSubMorphs [
	self content ifNotNil: [ :text | self addMorphBack: (StringMorph contents: text asString) ]
]

{ #category : #display }
GrrrMorph >> openInWorld [
	self initializeSubMorphs.
	^ super openInWorld
]
