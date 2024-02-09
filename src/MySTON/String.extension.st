Extension { #name : 'String' }

{ #category : '*MySTON' }
String >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
String >> myStonDecoded [
	"Decode me as an STON textual representation"
	
	^ MySTON fromString: self
]

{ #category : '*MySTON' }
String >> myStonOn: myStonWriter [
	myStonWriter writeString: self
]
