Trait {
	#name : 'TClassVar1',
	#classInstVars : [
		'a'
	],
	#category : 'TraitClassVar',
	#package : 'TraitClassVar'
}

{ #category : 'accessing' }
TClassVar1 classSide >> a [

	^ a
]

{ #category : 'accessing' }
TClassVar1 classSide >> a: anObject [

	a := anObject
]
