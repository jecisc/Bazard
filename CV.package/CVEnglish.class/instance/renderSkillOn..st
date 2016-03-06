rendering
renderSkillOn: html
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