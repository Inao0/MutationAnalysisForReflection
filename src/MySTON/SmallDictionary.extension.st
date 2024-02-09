Extension { #name : 'SmallDictionary' }

{ #category : '*MySTON' }
SmallDictionary class >> fromMySton: myStonReader [
	"My instances are stored as maps."

	| dictionary |
	dictionary := self new.
	myStonReader parseMapDo: [ :key :value |
		dictionary at: key put: value ].
	^ dictionary
]

{ #category : '*MySTON' }
SmallDictionary >> myStonOn: myStonWriter [
	"I store my instances as maps"

	myStonWriter
		writeObject: self
		do: [ myStonWriter encodeMap: self ]
]
