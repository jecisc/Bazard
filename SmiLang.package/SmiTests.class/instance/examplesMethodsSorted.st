helper
examplesMethodsSorted
	^ (self class exampleMethods select: [ :each | each selector beginsWith: #example ])
		sort: [ :m1 :m2 | 
			m1 methodClass exampleId = m2 methodClass exampleId
				ifTrue: [ m1 selector <= m2 selector ]
				ifFalse: [ m1 methodClass exampleId < m2 methodClass exampleId ] ]