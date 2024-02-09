Extension { #name : 'Date' }

{ #category : '*MySTON' }
Date class >> fromMySton: myStonReader [
	"Read a ISO YYYY-MM-DD format.
	Since my current implementation is time zone offset sensitive, the offset has to be taken into account.
	A missing offset results in the local timezone offset to be used"

	| readStream date |
	readStream := myStonReader parseListSingleton readStream.
	date := self readFrom: readStream.
	readStream atEnd
		ifFalse: [ | offset |
			offset := DateAndTime readTimezoneOffsetFrom: readStream.
			offset = date offset
				ifFalse: [ date start: (date start translateTo: offset) ] ].
	^ date
]

{ #category : '*MySTON' }
Date >> myStonContainSubObjects [
	^ false
]

{ #category : '*MySTON' }
Date >> myStonOn: myStonWriter [
	"Use an ISO style YYYY-MM-DD representation.
	Since my current implementation is time zone offset sensitive, the offset has to be included."

	| representation |
	representation := self offset isZero
		ifTrue: [
			String new: 11 streamContents: [ :out |
				self printOn: out format: #(3 2 1 $- 1 1 2).
				out nextPut: $Z ] ]
		ifFalse: [
			String new: 32 streamContents: [ :out |
				self printOn: out format: #(3 2 1 $- 1 1 2).
				out nextPut: (self offset positive ifTrue: [ $+ ] ifFalse: [ $- ]).
				self offset hours abs printOn: out base: 10 length: 2 padded: true.
				out nextPut: $:.
				self offset minutes abs printOn: out base: 10 length: 2 padded: true.
				self offset seconds = 0
					ifFalse:[
						out nextPut: $:; print: self offset seconds abs truncated ] ] ].
	myStonWriter writeObject: self listSingleton: representation
]
