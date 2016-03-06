rendering
renderProfessionalOn: html
	html div
		class: 'prof';
		with: [ html
				bold: 'Professional Experience:';
				break.
			html
				render: (CVEntry dated: 'Since 2015' description: 'Assistant Engineer at Synectique' items: #('Worked as part of a team on multiple Software Analysis projects' 'Participated at the development of a widget to be included in Pharo language''s next version' 'Tranfered Synectique''s project from thick client to thin client')).
			html
				render:
					(CVEntry
						dated: '2015'
						description: 'Internship in RMoD research group at Inria Lille (5 month)'
						items:
							#('Worked on an open source project, Pillar, as developper' 'Learned to use version control systems and continuous integration' 'Developed a parser for Pillar''s grammar' 'Participated at the writing of a book about the use of Pharo language in the enterprise: Enterprise Pharo' 'Participated as volunteer at the organisation of ESUG 2015 at Brescia, Italia' 'Presented a talk about Pillar at 2015''s conference of ESUG')) ]