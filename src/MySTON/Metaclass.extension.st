Extension { #name : 'Metaclass' }

{ #category : '*MySTON' }
Metaclass class >> fromMySton: myStonReader [
	| theClassName theClass theMetaclass |
	theClassName := myStonReader parseListSingleton.
	theClass := self environment at: theClassName.
	theMetaclass := theClass class.
	^ theMetaclass
]

{ #category : '*MySTON' }
Metaclass >> myStonName [
	^ #Class
]

{ #category : '*MySTON' }
Metaclass >> myStonOn: myStonWriter [
	myStonWriter
		writeObject: self
		listSingleton: self instanceSide name asSymbol
]
