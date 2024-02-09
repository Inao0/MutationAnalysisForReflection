"
STONLargeWriteReadTests test the optimalizations for large structures.
"
Class {
	#name : 'MySTONLargeWriteReadTest',
	#superclass : 'MySTONWriteReadTest',
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'private' }
MySTONLargeWriteReadTest >> materialize: string [
	^ MySTON reader
		on: string readStream;
		optimizeForLargeStructures;
		next
]

{ #category : 'private' }
MySTONLargeWriteReadTest >> reader: string [
	^ (super reader: string)
		optimizeForLargeStructures;
		yourself
]

{ #category : 'private' }
MySTONLargeWriteReadTest >> serialize: anObject [
	^ String streamContents: [ :stream |
		MySTON writer
			on: stream;
			optimizeForLargeStructures;
			nextPut: anObject ]
]

{ #category : 'private' }
MySTONLargeWriteReadTest >> serializeJson: anObject [
	^ String streamContents: [ :stream |
		MySTON jsonWriter
			on: stream;
			prettyPrint: true;
			optimizeForLargeStructures;
			nextPut: anObject ]
]
