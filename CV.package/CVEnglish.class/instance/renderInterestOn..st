rendering
renderInterestOn: html
	html div
		class: 'interest';
		with: [ html
				bold: 'Activities and Interests:';
				break.
			html
				render: (CVEntry dated: 'Since 2015' description: 'Pharo Association active member' items: #('Contribute to the Pharo language with bug correction, bug report, feature development, etc' 'Help newcommers in the community')).
			html
				render:
					(CVEntry
						dated: '2014-2015'
						description: 'Raid Leader of an End Game team in Final Fantasy XIV game'
						items:
							#('Created a team to finish the end game content of the game with strict schedule and important teamwork' 'Managed an international team of 8 people, during events, 5 times a week' 'Organized the strategy the team needed to follow to finish the content')) ]