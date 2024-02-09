Extension { #name : 'Bag' }

{ #category : '*MySTON' }
Bag class >> fromMySton: myStonReader [
	"Read a map representation containing element/occurrences pairs"

	| bag |
	bag := self new.
	myStonReader parseMapDo: [ :key :value |
		bag add: key withOccurrences: value ].
	^ bag
]

{ #category : '*MySTON' }
Bag >> myStonOn: myStonWriter [
	"Use a map with element-occurrences pairs as representation"

	myStonWriter
		writeObject: self
		do: [ myStonWriter encodeMap: contents ]
]
