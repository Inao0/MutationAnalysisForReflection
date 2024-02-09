"
STONArrayWriter helps in writing array based STON representations.

"
Class {
	#name : 'MySTONListWriter',
	#superclass : 'MySTONStreamWriter',
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'accessing' }
MySTONListWriter >> add: anObject [
	first ifTrue: [ first := false ] ifFalse: [ writer listElementSeparator ].
	writer nextPut: anObject
]
