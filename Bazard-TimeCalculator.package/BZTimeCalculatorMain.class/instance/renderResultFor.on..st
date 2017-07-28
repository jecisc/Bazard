rendering
renderResultFor: ind on: html
	^ html
		text:
			'Date pour lancer l''attaque : '
				,
					(DateAndTime
						fromSeconds: arrivalTime asSeconds - (durations at: ind) asSeconds)
						asStringYMDHMS