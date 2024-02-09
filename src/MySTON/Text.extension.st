Extension { #name : 'Text' }

{ #category : '*MySTON' }
Text class >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	^ self new
		fromMySton: myStonReader;
		yourself
]

{ #category : '*MySTON' }
Text >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	myStonReader parseNamedInstVarsFor: self
]

{ #category : '*MySTON' }
Text >> myStonOn: myStonWriter [
	"Overwritten to get back the standard object behavior"

	myStonWriter writeObject: self
]
