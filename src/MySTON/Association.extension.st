Extension { #name : 'Association' }

{ #category : '*MySTON' }
Association >> myStonOn: myStonWriter [
	self class == MySTON associationClass
		ifTrue: [ myStonWriter writeAssociation: self ]
		ifFalse: [ super myStonOn: myStonWriter ]
]
