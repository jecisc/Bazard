rendering
renderEducationOn: html
	html div
		class: 'educ';
		with: [ html
				bold: 'Education:';
				break.
			html
				render:
					(CVEntry dated: 'Since 2012' description: 'University of lille 1' items: #('2015   Bachelor''s degree in IT' 'Development studies')).
			html
				render:
					(CVEntry
						dated: '2011 - 2012'
						description: 'University of lille 2'
						items: #('Followed classes of the First Commune Year In Wealth Studies')).
			html
				render:
					(CVEntry
						dated: '2010 - 2011'
						description: 'Lycee Jules Mousseron'
						items: #('Received a scientific baccalauréat, mathematical option, with mention')) ]