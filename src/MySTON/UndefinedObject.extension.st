Extension { #name : 'UndefinedObject' }

{ #category : '*MySTON' }
UndefinedObject >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
UndefinedObject >> myStonOn: myStonWriter [
	myStonWriter writeNull
]
