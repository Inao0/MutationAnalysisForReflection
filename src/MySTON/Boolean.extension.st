Extension { #name : 'Boolean' }

{ #category : '*MySTON' }
Boolean >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
Boolean >> myStonOn: myStonWriter [
	myStonWriter writeBoolean: self
]
