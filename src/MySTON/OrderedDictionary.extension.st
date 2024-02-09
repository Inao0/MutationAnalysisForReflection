Extension { #name : 'OrderedDictionary' }

{ #category : '*MySTON' }
OrderedDictionary class >> fromMySton: myStonReader [
	"My instances are stored as maps."

	| dictionary |
	dictionary := self new.
	myStonReader parseMapDo: [ :key :value |
		dictionary at: key put: value ].
	^ dictionary
]

{ #category : '*MySTON' }
OrderedDictionary >> myStonOn: myStonWriter [
	"I store my instances as maps. When in JSON mode,
	encode me directly, without a class tag, keeping the order."

	myStonWriter jsonMode
		ifTrue: [
			myStonWriter encodeMap: self ]
		ifFalse: [
			myStonWriter
				writeObject: self
				do: [ myStonWriter encodeMap: self ] ]
]
