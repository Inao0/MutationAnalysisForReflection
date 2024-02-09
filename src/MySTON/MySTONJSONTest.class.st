"
STONJSONTests contains unit tests for the JSON functionality available in STON.
"
Class {
	#name : 'MySTONJSONTest',
	#superclass : 'TestCase',
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'accessing' }
MySTONJSONTest >> environment [
	^ Smalltalk globals
]

{ #category : 'tests' }
MySTONJSONTest >> testBooleans [
	self assert: (MySTONJSON toString: true) equals: 'true'.
	self assert: (MySTONJSON toString: false) equals: 'false'.
	self assert: (MySTONJSON fromString: 'true') equals: true.
	self assert: (MySTONJSON fromString: 'false') equals: false
]

{ #category : 'tests' }
MySTONJSONTest >> testCircular [
	"Circular datastructures cannot be encoded using JSON"
	self
		should: [ | foo |
			foo := { 'foo'->'dummy' } asDictionary.
			foo at: 'bar' put: foo.
			MySTONJSON toString: foo ]
		raise: MySTONWriterError
]

{ #category : 'tests' }
MySTONJSONTest >> testFloats [
	self assert: (MySTONJSON toString: 1.0) equals: '1.0'.
	self assert: (MySTONJSON toString: 0.0) equals: '0.0'.
	self assert: (MySTONJSON toString: -1.0) equals: '-1.0'.
	self assert: (MySTONJSON toString: -1.23456e-6) equals: '-1.23456e-6'.
	self assert: ((MySTONJSON fromString: '1.0') closeTo: 1.0).
	self assert: ((MySTONJSON fromString: '0.0') closeTo: 0.0).
	self assert: ((MySTONJSON fromString: '-1.0') closeTo: -1.0).
	self assert: ((MySTONJSON fromString: '-1.23456e-6') closeTo: -1.23456e-6)
]

{ #category : 'tests' }
MySTONJSONTest >> testIntegers [
	self assert: (MySTONJSON toString: 1) equals: '1'.
	self assert: (MySTONJSON toString: 0) equals: '0'.
	self assert: (MySTONJSON toString: -1) equals: '-1'.
	self assert: (MySTONJSON toString: 1234567890) equals: '1234567890'.
	self assert: (MySTONJSON fromString: '1') equals: 1.
	self assert: (MySTONJSON fromString: '0') equals: 0.
	self assert: (MySTONJSON fromString: '-1') equals: -1.
	self assert: (MySTONJSON fromString: '1234567890') equals: 1234567890
]

{ #category : 'tests' }
MySTONJSONTest >> testLists [
	self assert: (MySTONJSON toString: #(1 2 3)) equals: '[1,2,3]'.
	self assert: (MySTONJSON toString: #(1 -2 true 3 nil)) equals: '[1,-2,true,3,null]'.
	self assert: (MySTONJSON toString: #(1 (2) 3)) equals: '[1,[2],3]'.
	self assert: (MySTONJSON toString: #()) equals: '[]'.
	self assert: (MySTONJSON fromString: '[]') equals: #().
	self assert: (MySTONJSON fromString: '[1,2,3]') equals: #(1 2 3).
	self assert: (MySTONJSON fromString: '[1,-2,true,3,null]') equals: #(1 -2 true 3 nil).
	self assert: (MySTONJSON fromString: '[1,[2],3]') equals: #(1 (2) 3)
]

{ #category : 'tests' }
MySTONJSONTest >> testMaps [
	self assert: (MySTONJSON toString: { 'temperature'->37 } asDictionary) equals: '{"temperature":37}'.
	self assert: (MySTONJSON toString: Dictionary new) equals: '{}'.
	self assert: (MySTONJSON fromString: '{"temperature":37}') equals: { 'temperature'->37 } asDictionary.
	self assert: (MySTONJSON fromString: '{}') equals: Dictionary new
]

{ #category : 'tests' }
MySTONJSONTest >> testNull [
	self assert: (MySTONJSON toString: nil) equals: 'null'.
	self assert: (MySTONJSON fromString: 'null') equals: nil
]

{ #category : 'tests' }
MySTONJSONTest >> testOrderedDictionary [
	| odictClass odict json dict |
	odictClass := self environment at: #OrderedDictionary ifAbsent: [ ^ self skip ].

	odict := odictClass newFrom: {('a' -> 42) . ('b' -> 1) . ('aa' -> 4) . ('c' -> 23)}.

	"assert that the order is not equal in the dictionary hash table"
	self
		assertCollection: odict asArray hasSameElements: odict dictionary asArray;
		deny: odict asArray equals: odict dictionary asArray.

	"ordered presevered when encoding:"
	json := MySTONJSON toString: odict.
	self assert: json equals: '{"a":42,"b":1,"aa":4,"c":23}'.

	"lost when decoding"
	dict := MySTONJSON fromString: json.

	self
		assertCollection: dict asArray hasSameElements: odict asArray;
		assert: dict equals: odict dictionary;
		deny: dict asArray equals: odict asArray
]

{ #category : 'tests' }
MySTONJSONTest >> testShared [
	"Structure sharing cannot be encoded using JSON"
	self
		should: [ | foo |
			foo := { 'foo'->'dummy' } asDictionary.
			MySTONJSON toString: { foo. foo } ]
		raise: MySTONWriterError
]

{ #category : 'tests' }
MySTONJSONTest >> testStrings [
	self assert: (MySTONJSON toString: 'string') equals: '"string"'.
	self assert: (MySTONJSON toString: '') equals: '""'.
	self assert: (MySTONJSON toString: 'élèves français') equals: '"élèves français"'.
	self assert: (MySTONJSON toString: String crlf) equals: '"\r\n"'.
	self assert: (MySTONJSON fromString: '"string"') equals: 'string'.
	self assert: (MySTONJSON fromString: '""') equals: ''.
	self assert: (MySTONJSON fromString: '"élèves français"') equals: 'élèves français'.
	self
		assert: (MySTONJSON fromString: '"\u212B \"Angstrom Symbol\""')
		equals: 8491 asCharacter asString, ' "Angstrom Symbol"'
]

{ #category : 'tests' }
MySTONJSONTest >> testUnknown [
	"Only Array for lists and Dictionary for maps are allowed for JSON encoding,
	any other Smalltalk object cannot be encoded (following the specs).
	Even considering all collections to be lists won't work because the type
	is then lost when decoding"

	self should: [ MySTONJSON toString: 1@2 ] raise: MySTONWriterError.
	self should: [ MySTONJSON toString: #(1 2 3) asOrderedCollection ] raise: MySTONWriterError
]
