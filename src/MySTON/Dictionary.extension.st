Extension { #name : 'Dictionary' }

{ #category : '*MySTON' }
Dictionary class >> fromMySton: myStonReader [
	"Instances of STON mapClass will be read directly and won't arrive here.
	Other (sub)classes will use this method."

	| dictionary |
	dictionary := self new.
	myStonReader parseMapDo: [ :key :value |
		dictionary at: key put: value ].
	^ dictionary
]

{ #category : '*MySTON' }
Dictionary >> myStonOn: myStonWriter [
	"Instances of STON mapClass will be encoded directly, without a class tag.
	Other (sub)classes will be encoded with a class tag and will use a map representation. "

	self class == MySTON mapClass
		ifTrue: [
			myStonWriter writeMap: self ]
		ifFalse: [
			myStonWriter
				writeObject: self
				do: [ myStonWriter encodeMap: self ] ]
]

{ #category : '*MySTON' }
Dictionary >> myStonPostReferenceResolution [
	"When references were resolved in me, the hash of my keys might have changed.
	Check if I am still healthy and rehash me if not."

	self isHealthy ifFalse: [ self rehash ]
]
