Extension { #name : 'Number' }

{ #category : '*MySTON' }
Number >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
Number >> myStonOn: myStonWriter [
	myStonWriter writeFloat: self asFloat
]
