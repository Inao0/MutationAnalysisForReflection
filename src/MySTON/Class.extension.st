Extension { #name : 'Class' }

{ #category : '*MySTON' }
Class class >> fromMySton: myStonReader [
	| theClassName theClass |
	theClassName := myStonReader parseListSingleton.
	theClass := self environment at: theClassName.
	^ theClass
]

{ #category : '*MySTON' }
Class >> myStonOn: myStonWriter [
	myStonWriter
		writeObject: self
		listSingleton: self name asSymbol
]
