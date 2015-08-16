as yet unclassified
new
	^ self isAbstract
		ifFalse: [ super new ]
		ifTrue: [ RPGGameError signal: self name , ' is an Abstract class. You can''t create a new instance.' ]