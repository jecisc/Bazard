Class {
	#name : #NSAllEmptyFilledSolver,
	#superclass : #NSAbstractSolver,
	#category : #NonogramSolver
}

{ #category : #accessing }
NSAllEmptyFilledSolver class >> priority [
	^ 5
]

{ #category : #resolve }
NSAllEmptyFilledSolver >> resolve [
	1 to: self numberOfLines do: [ :lineIndex | 
		(self lineIsAllKnown: lineIndex)
			ifFalse: [ (self clueForLine: lineIndex) ifEmpty: [ 1 to: self numberOfColumns do: [ :columnIndex | self at: lineIndex at: columnIndex put: NSEmptyState ] ] ] ].
	1 to: self numberOfColumns do: [ :columnIndex | 
		(self columnIsAllKnown: columnIndex)
			ifFalse: [ (self clueForColumn: columnIndex) ifEmpty: [ 1 to: self numberOfLines do: [ :lineIndex | self at: lineIndex at: columnIndex put: NSEmptyState ] ] ] ]
]
