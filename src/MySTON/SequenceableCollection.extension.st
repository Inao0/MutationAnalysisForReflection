Extension { #name : 'SequenceableCollection' }

{ #category : '*MySTON' }
SequenceableCollection class >> fromMySton: myStonReader [
	"Overwritten to use #streamContents: and #nextPut:"

	^ self streamContents: [ :stream |
		myStonReader parseListDo: [ :each |
			stream nextPut: each ] ]
]

{ #category : '*MySTON' }
SequenceableCollection >> myStonOn: myStonWriter [
	"Instances of STON listClass will be encoded directly, without a class tag.
	Other (sub)classes will be encoded with a class tag and will use a list representation. "

	self class == MySTON listClass
		ifTrue: [ myStonWriter writeList: self ]
		ifFalse: [ super myStonOn: myStonWriter ]
]
