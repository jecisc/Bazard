Class {
	#name : #BZTimeCalculatorMain,
	#superclass : #WAComponent,
	#instVars : [
		'arrivalTime',
		'durations'
	],
	#category : 'Bazard-TimeCalculator'
}

{ #category : #initialization }
BZTimeCalculatorMain >> initialize [
	super initialize.
	arrivalTime := DateAndTime now.
	durations := OrderedCollection with: (Time hour: 6 minute: 5 second: 10)
]

{ #category : #rendering }
BZTimeCalculatorMain >> renderArrivalTimeSelectionOn: html [
	html div
		mdlTypographyDisplay1;
		mdlTextColorPrimary;
		with: 'Heur d''arrivé'.
	html
		form: [ html
				div: [ html label
						for: html nextId;
						with: 'Date d''arrivée : '.
					html dateInput5
						id: html lastId;
						value: arrivalTime asDate yyyymmdd;
						onChange: (self updateJQueryOn: html);
						callback: [ :date | 
							arrivalTime := [ DateAndTime date: (Date fromString: date) time: arrivalTime asTime ]
								on: Error
								do: [ arrivalTime ] ] ].
			html
				div: [ html label
						for: html nextId;
						with: 'Heure d''arrivée : '.
					html timeInput5
						step: 1;
						id: html lastId;
						value: arrivalTime asTime print24;
						onChange: (self updateJQueryOn: html);
						callback: [ :time | 
							arrivalTime := [ DateAndTime date: arrivalTime asDate time: (Time fromString: time) ]
								on: Error
								do: [ arrivalTime ] ] ] ]
]

{ #category : #rendering }
BZTimeCalculatorMain >> renderContentOn: html [
	self renderArrivalTimeSelectionOn: html.
	html div
		id: #content;
		with: [ self renderDurationsOn: html ]
]

{ #category : #rendering }
BZTimeCalculatorMain >> renderDurationsOn: html [
	html div
		mdlTypographyDisplay1;
		mdlTextColorPrimary;
		with: 'Départs : '.
	html
		form: [ durations
				doWithIndex: [ :duration :ind | 
					html label
						for: html nextId;
						with: 'Durée numéro ' , ind asString , ' : '.
					html timeInput5
						step: 1;
						id: html lastId;
						value: duration print24;
						onChange: (self updateLineAt: ind on: html);
						callback: [ :time | 
							durations
								at: ind
								put:
									([ Time fromString: time ]
										on: Error
										do: [ duration ]) ].
					html space.
					html div
						id: 'content' , ind asString;
						with: [ self renderResultFor: ind on: html ].
					html break ].
			html break ].
	html mdlButton
		fab;
		onClick:
			(html jQuery ajax
				callback: [ durations add: Time now ];
				onComplete: 'location.reload();');
		primaryColor;
		with: '+'
]

{ #category : #rendering }
BZTimeCalculatorMain >> renderResultFor: ind on: html [
	^ html
		text:
			'Date pour lancer l''attaque : '
				,
					(DateAndTime
						fromSeconds: arrivalTime asSeconds - (durations at: ind) asSeconds)
						asStringYMDHMS
]

{ #category : #javascript }
BZTimeCalculatorMain >> updateJQueryOn: html [
	^ html jQuery ajax
		serializeThis;
		onComplete: ((html jQuery id: #content) load html: [ self renderDurationsOn: html ])
]

{ #category : #javascript }
BZTimeCalculatorMain >> updateLineAt: ind on: html [
	^ html jQuery ajax
		serializeThis;
		onComplete: ((html jQuery id: 'content' , ind asString) load html: [ self renderResultFor: ind on: html ])
]
