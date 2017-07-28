rendering
renderArrivalTimeSelectionOn: html
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