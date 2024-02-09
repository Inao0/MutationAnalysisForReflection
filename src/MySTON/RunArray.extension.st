Extension { #name : 'RunArray' }

{ #category : '*MySTON' }
RunArray class >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	^ self new
		fromMySton: myStonReader;
		yourself
]

{ #category : '*MySTON' }
RunArray >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	myStonReader parseNamedInstVarsFor: self
]

{ #category : '*MySTON' }
RunArray >> myStonOn: myStonWriter [
	"Overwritten to get back the standard object behavior"

	myStonWriter writeObject: self
]
