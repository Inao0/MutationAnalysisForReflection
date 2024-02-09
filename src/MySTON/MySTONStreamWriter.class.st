"
STONStreamWriter helps in streaming writing STON representations.
This is an abstract class.
"
Class {
	#name : 'MySTONStreamWriter',
	#superclass : 'Object',
	#instVars : [
		'writer',
		'first'
	],
	#category : 'MySTON-Core',
	#package : 'MySTON',
	#tag : 'Core'
}

{ #category : 'instance creation' }
MySTONStreamWriter class >> on: stonWriter [
	^ self new
		on: stonWriter;
		yourself
]

{ #category : 'initialization' }
MySTONStreamWriter >> initialize [
	super initialize.
	first := true
]

{ #category : 'initialization' }
MySTONStreamWriter >> on: stonWriter [
	writer := stonWriter
]
