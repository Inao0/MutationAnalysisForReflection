Extension { #name : 'Path' }

{ #category : '*MySTON' }
Path class >> fromMySton: myStonReader [
	| elements |
	elements := Array streamContents: [ :out |
		myStonReader parseListDo: [ :each | out nextPut: each ] ].
	^ self withAll: elements
]

{ #category : '*MySTON' }
Path >> myStonOn: myStonWriter [
	myStonWriter
		writeObject: self
		streamShortList: [ :listWriter |
			self do: [ :each | listWriter add: each ] ]
]
