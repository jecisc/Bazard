Class {
	#name : #CVEnglish,
	#superclass : #WAComponent,
	#category : 'CV'
}

{ #category : #'class initialization' }
CVEnglish class >> initialize [
	WAAdmin register: self asApplicationAt: 'englishCV'
]

{ #category : #rendering }
CVEnglish >> renderContentOn: html [
	self
		renderNameOn: html;
		renderInfoOn: html;
		renderEducationOn: html;
		renderProfessionalOn: html;
		renderInterestOn: html;
		renderSkillOn: html
]

{ #category : #rendering }
CVEnglish >> renderEducationOn: html [
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
]

{ #category : #rendering }
CVEnglish >> renderInfoOn: html [
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
]

{ #category : #conveniance }
CVEnglish >> renderInfoTableWith: aDictionary on: html [
	html table: [ aDictionary keysAndValuesDo: [ :key :value | self renderLineTitled: key content: value on: html ] ]
]

{ #category : #rendering }
CVEnglish >> renderInterestOn: html [
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
]

{ #category : #conveniance }
CVEnglish >> renderLineTitled: title content: content on: html [
	html
		tableRow: [ html tableData: [ html bold with: title ].
			html tableData: content ]
]

{ #category : #rendering }
CVEnglish >> renderNameOn: html [
	html heading
		level1;
		with: 'Cyril Ferlicot Delbecque'
]

{ #category : #rendering }
CVEnglish >> renderProfessionalOn: html [
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
]

{ #category : #rendering }
CVEnglish >> renderSkillOn: html [
	self
		renderInfoTableWith:
			(OrderedDictionary
				with: 'Languages' -> 'French (Mother tongue), English (fluent)'
				with: 'Programation' -> 'Smalltalk, Pharo, Haskell, Java, C, bash'
				with: 'Web' -> 'Seaside, html/css, javascript, php'
				with: 'Data base' -> 'PosgreSQL, Oracle, MongoDB, Fuel'
				with: 'System' -> 'Linux (Gentoo, Nix, Debian, Rasbian), Windows, OSX'
				with: 'References' -> 'References available upon request')
		on: html
]

{ #category : #hooks }
CVEnglish >> style [
	^ '
body{
	height: 100%;
	width: 100%;
}	
	
h1{
font-size: 1.5em;
margin-block-start: .30em;
margin-block-end: .0em;
}

.info table{
	display: inline-flex;
	margin-right: 70px;
}

div{
	margin-top: 15px;
}

span{
	margin-right: 40px;
}

ul{
	margin-top: 5px;
	margin-bottom: 5px;
}
'
]
