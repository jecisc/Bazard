accessing
screen
	^ screen ifNil: [ RPGScreenError signal: 'This scheduler should always have a screen.' ]