Extension { #name : 'ScaledDecimal' }

{ #category : '*MySTON' }
ScaledDecimal >> myStonOn: myStonWriter [
	myStonWriter writeScaledDecimal: self
]
