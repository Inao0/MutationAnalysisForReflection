Extension { #name : 'SortedCollection' }

{ #category : '*MySTON' }
SortedCollection >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	myStonReader parseNamedInstVarsFor: self
]

{ #category : '*MySTON' }
SortedCollection class >> fromMySton: myStonReader [
	"Overwritten to get back the standard object behavior"

	^ self new
		fromMySton: myStonReader;
		yourself
]

{ #category : '*MySTON' }
SortedCollection >> myStonOn: myStonWriter [
	"Overwritten to get back the standard object behavior"

	myStonWriter writeObject: self
]
