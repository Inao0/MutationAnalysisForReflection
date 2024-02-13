"
I am STONTestKnownObject. I support unit tests.

I have an id and a description.

When I am serialized, only my id is written out.

  STONTestKnownObject['bb71b026-180c-0d00-b40c-38700aee7555']

When I am materialized, the id is used to reconstruct the object, either by retrieving it from a collection of known objects, or it is created (it could also be a retrieval from somewhere else).

I keep a collection of all my known instances, new instances are added to it automatically.

Use my class side's #fromId: to access existing instances
"
Class {
	#name : 'MySTONTestKnownObject',
	#superclass : 'Object',
	#instVars : [
		'id',
		'description'
	],
	#classVars : [
		'KnownObjects'
	],
	#category : 'MySTON-Tests',
	#package : 'MySTON-Tests'
}

{ #category : 'accessing' }
MySTONTestKnownObject class >> addKnownObject: object [
	^ self knownObjects addIfNotPresent: object
]

{ #category : 'instance creation' }
MySTONTestKnownObject class >> fromId: idString [
	"Given id, return a matching instance of me, either by returning an existing known instance or by creating a new one (that is automatically added to the known instances)"

	| uuid |
	uuid := UUID fromString: idString.
	^ self knownObjects
		detect: [ :each | each id = uuid ]
		ifNone: [ self new id: uuid ]
]

{ #category : 'ston-core' }
MySTONTestKnownObject class >> fromMySton: myStonReader [
	^ self fromId: myStonReader parseListSingleton
]

{ #category : 'ston-core' }
MySTONTestKnownObject class >> fromSton: stonReader [
	^ self fromId: stonReader parseListSingleton
]

{ #category : 'accessing' }
MySTONTestKnownObject class >> knownObjects [
	^ KnownObjects ifNil: [ KnownObjects := OrderedCollection new ]
]

{ #category : 'accessing' }
MySTONTestKnownObject class >> resetKnownObjects [
	KnownObjects ifNotNil: [ :collection | collection removeAll ]
]

{ #category : 'comparing' }
MySTONTestKnownObject >> = object [
	self class == object class ifFalse: [ ^ false ].
	^ self id = object id
]

{ #category : 'accessing' }
MySTONTestKnownObject >> description [
	^ description
]

{ #category : 'initialization' }
MySTONTestKnownObject >> description: string [
	description := string
]

{ #category : 'comparing' }
MySTONTestKnownObject >> hash [
	^ self id hash
]

{ #category : 'accessing' }
MySTONTestKnownObject >> id [
	^ id
]

{ #category : 'initialization' }
MySTONTestKnownObject >> id: uuid [
	id := uuid.
	self description: 'I am a complex object known under the ID ', id asString, ' - I was created @ ', DateAndTime now asString
]

{ #category : 'initialization' }
MySTONTestKnownObject >> initialize [
	super initialize.
	self id: UUID new.
	self class addKnownObject: self
]

{ #category : 'ston-core' }
MySTONTestKnownObject >> myStonOn: myStonWriter [
	"We only write out our id"

	myStonWriter writeObject: self listSingleton: self id asString
]

{ #category : 'printing' }
MySTONTestKnownObject >> printOn: stream [
	super printOn: stream.
	stream nextPut: $(; print: id; nextPut: $)
]

{ #category : 'ston-core' }
MySTONTestKnownObject >> stonOn: stonWriter [
	"We only write out our id"

	stonWriter writeObject: self listSingleton: self id asString
]
