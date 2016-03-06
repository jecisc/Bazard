conveniance
renderLineTitled: title content: content on: html
	html
		tableRow: [ html tableData: [ html bold with: title ].
			html tableData: content ]