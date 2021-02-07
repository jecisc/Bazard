Class {
	#name : #NSSolver,
	#superclass : #Object,
	#instVars : [
		'horizontalClues',
		'verticalClues',
		'grid'
	],
	#category : #NonogramSolver
}

{ #category : #'instance creation' }
NSSolver class >> on: aDOM [ 
	^ self new
		on: aDOM;
		resolve
]

{ #category : #'as yet unclassified' }
NSSolver class >> scripts [
	'const socket = new WebSocket("ws://localhost:1801");

// Connection opened
socket.addEventListener("open", function (event) {
    socket.send(document.getElementsByClassName("nonogram_table")[0].innerHTML);
});

// Listen for messages
socket.addEventListener("message", function (event) {
    console.log("Message from server ", event.data);
});'.
	'ZnServer stopDefault.
ZnServer startDefaultOn: 1801.
ZnServer default delegate: (ZnWebSocketDelegate handler:
   [ :webSocket |
      [ webSocket runWith: [ :message |
		NSSolver on: message.
         webSocket sendMessage: ''Todo'' ]
      ]
      on: ConnectionClosed
      do: [ self crLog: ''Ignoring connection close, done'' ] ]).

'
]

{ #category : #initalize }
NSSolver >> on: aDOM [ 
	| document horizontalHTMLClues |
	document := XMLHTMLParser parse: aDOM.
	horizontalClues := NSHorizontalClues buildFrom: (document xPath: '//td[@class=''nmtt'']') anyOne.
	verticalClues := NSVerticalClues buildFrom: (document xPath: '//td[@class=''nmtl'']') anyOne.
	grid := NSGrid width: horizontalClues size height: verticalClues size
]

{ #category : #'as yet unclassified' }
NSSolver >> resolve [
	1halt.
]
