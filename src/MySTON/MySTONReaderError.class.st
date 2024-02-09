"
STONReaderError is the error/exception signalled by STONReader when illegal/incorrect input is seen. 

"
Class {
	#name : 'MySTONReaderError',
	#superclass : 'Error',
	#instVars : [
		'streamPosition'
	],
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'instance creation' }
MySTONReaderError class >> signal: aString streamPosition: streamPosition [
	^ self new
		streamPosition: streamPosition;
		signal: aString;
		yourself
]

{ #category : 'accessing' }
MySTONReaderError >> messageText [
	^ streamPosition
		ifNil: [
			super messageText ]
		ifNotNil: [ :pos |
			'At character <1P>: <2P>' expandMacrosWith: pos with: super messageText ]
]

{ #category : 'accessing' }
MySTONReaderError >> streamPosition [
	^ streamPosition
]

{ #category : 'accessing' }
MySTONReaderError >> streamPosition: aNumber [
	streamPosition := aNumber
]
