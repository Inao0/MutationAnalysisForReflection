Extension { #name : 'ByteArray' }

{ #category : '*MySTON' }
ByteArray class >> fromMySton: myStonReader [
	"Use a hex representation"

	^ self readHexFrom: myStonReader parseListSingleton
]

{ #category : '*MySTON' }
ByteArray >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
ByteArray >> myStonOn: myStonWriter [
	"Use a hex representation"

	myStonWriter writeObject: self listSingleton: self hex
]
