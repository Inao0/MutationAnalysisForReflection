"
STONTestAssociation is used to support unit tests.

"
Class {
	#name : 'MySTONTestAssociation',
	#superclass : 'Association',
	#instVars : [
		'timestamp'
	],
	#category : 'MySTON-Tests',
	#package : 'MySTON-Tests'
}

{ #category : 'accessing' }
MySTONTestAssociation >> key: aKey value: anObject [
	super key: aKey value: anObject.
	timestamp := self now
]

{ #category : 'accessing' }
MySTONTestAssociation >> now [
	^ DateAndTime now
]

{ #category : 'accessing' }
MySTONTestAssociation >> timestamp [
	^ timestamp
]

{ #category : 'accessing' }
MySTONTestAssociation >> value: anObject [
	super value: anObject.
	timestamp := self now
]
