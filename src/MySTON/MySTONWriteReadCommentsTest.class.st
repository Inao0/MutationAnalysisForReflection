Class {
	#name : 'MySTONWriteReadCommentsTest',
	#superclass : 'MySTONWriteReadTest',
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'private' }
MySTONWriteReadCommentsTest >> materialize: string [
	^ MySTON reader
		on: (MySTONCStyleCommentsSkipStream on: string readStream);
		optimizeForLargeStructures;
		next
]

{ #category : 'private' }
MySTONWriteReadCommentsTest >> reader: string [
	^ MySTON reader
		on: (MySTONCStyleCommentsSkipStream on: string readStream);
		yourself
]

{ #category : 'private' }
MySTONWriteReadCommentsTest >> serialize: anObject [
	^ String streamContents: [ :stream |
		stream << '/* initial comment */'.
		MySTON writer
			on: stream;
			nextPut: anObject.
		stream << '/* final comment */' ]
]
