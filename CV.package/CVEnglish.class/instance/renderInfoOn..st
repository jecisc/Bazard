rendering
renderInfoOn: html
	html div
		class: 'info';
		with: [ self
				renderInfoTableWith:
					(OrderedDictionary
						with: 'Home address:' -> 'Abbey Road'
						with: '' -> 'London'
						with: 'Telephone:' -> 'xx xx xx xx xx'
						with: 'Email:' -> 'cyril.ferlicot@synectique.eu')
				on: html.
			self renderInfoTableWith: (OrderedDictionary with: 'Date of Birth:' -> '20 August 1993' with: 'Nationality' -> 'French') on: html ]