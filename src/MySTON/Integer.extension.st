Extension { #name : 'Integer' }

{ #category : '*MySTON' }
Integer >> myStonOn: myStonWriter [
	myStonWriter writeInteger: self
]
