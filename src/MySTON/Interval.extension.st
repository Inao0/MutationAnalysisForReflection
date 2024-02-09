Extension { #name : 'Interval' }

{ #category : '*MySTON' }
Interval >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	myStonReader parseNamedInstVarsFor: self
]

{ #category : '*MySTON' }
Interval class >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	^ self new
		fromMySton: myStonReader;
		yourself
]

{ #category : '*MySTON' }
Interval >> myStonOn: myStonWriter [
	"Overwritten to get back the standard object behavior"

	myStonWriter writeObject: self
]
