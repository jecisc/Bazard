conveniance
renderInfoTableWith: aDictionary on: html
	html table: [ aDictionary keysAndValuesDo: [ :key :value | self renderLineTitled: key content: value on: html ] ]