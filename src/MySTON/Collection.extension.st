Extension { #name : 'Collection' }

{ #category : '*MySTON' }
Collection class >> fromMySton: myStonReader [
	"For collections we chose to instanciate based a list of elements using #add:
	This is not the best or most correct solution for all subclasses though,
	so some will revert to standard object behavior or chose another solution."

	| collection |
	collection := self new.
	myStonReader parseListDo: [ :each |
		collection add: each ].
	^ collection
]

{ #category : '*MySTON' }
Collection >> myStonOn: myStonWriter [
	"For collections we chose to write a list of elements as delivered by #do:
	This is not the best or most correct solution for all subclasses though,
	so some will revert to standard object behavior or chose another solution"

	myStonWriter writeObject: self do: [
		myStonWriter encodeList: self ]
]
