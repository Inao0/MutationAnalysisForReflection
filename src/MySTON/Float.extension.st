Extension { #name : 'Float' }

{ #category : '*MySTON' }
Float class >> fromMySton: myStonReader [
	| argument |
	argument := myStonReader parseListSingleton.
	argument isNumber ifTrue: [ ^ argument ].
	^ (#(nan infinity negativeInfinity) includes: argument)
		ifTrue: [ self perform: argument ]
		ifFalse: [ myStonReader error: 'special Float not recognized' ]
]
