"
STONShortArrayWriter helps in writing short array based STON representations.

"
Class {
	#name : 'MySTONShortListWriter',
	#superclass : 'MySTONListWriter',
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'accessing' }
MySTONShortListWriter >> add: anObject [
	first ifTrue: [ first := false ] ifFalse: [ writer shortListElementSeparator ].
	writer nextPut: anObject
]
