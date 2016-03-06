rendering
renderContentOn: html
	html span: self date.
	html emphasis: self description.
	html unorderedList: [ self items do: [ :e | html listItem: e ] ]