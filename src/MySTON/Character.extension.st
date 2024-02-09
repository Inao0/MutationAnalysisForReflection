Extension { #name : 'Character' }

{ #category : '*MySTON' }
Character class >> fromMySton: myStonReader [
	^ myStonReader parseListSingleton first
]

{ #category : '*MySTON' }
Character >> myStonOn: myStonWriter [
	myStonWriter writeObject: self listSingleton: self asString
]
