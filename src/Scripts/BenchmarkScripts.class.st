Class {
	#name : #BenchmarkScripts,
	#superclass : #Object,
	#category : #Scripts
}

{ #category : #benchmarking }
BenchmarkScripts class >> benchTestSuite [
	| packageSelectionBlock testSuite |
	packageSelectionBlock := [ :e | e name beginsWith: 'IngeProj' ].
	testSuite := TestSuite new.

	((RPackageOrganizer default packages select: packageSelectionBlock) flatCollect: #classes)
		select: [ :e | e inheritsFrom: TestCase ]
		thenDo: [ :e | e addToSuiteFromSelectors: testSuite ].

	[ testSuite run ] spy
]

{ #category : #'see class side' }
BenchmarkScripts >> seeClassSide [
]
