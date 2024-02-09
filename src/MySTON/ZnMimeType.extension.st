Extension { #name : 'ZnMimeType' }

{ #category : '*MySTON' }
ZnMimeType class >> fromMySton: myStonReader [
	^ self fromString: myStonReader parseListSingleton
]

{ #category : '*MySTON' }
ZnMimeType >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
ZnMimeType class >> myStonName [
	^ #MimeType
]

{ #category : '*MySTON' }
ZnMimeType >> myStonOn: myStonWriter [
	myStonWriter writeObject: self listSingleton: self asString
]
