"
STONTestUser is used to support unit tests.

Instance Variables
	enabled:		<Boolean>
	password:	<String>
	username:	<String>

"
Class {
	#name : 'MySTONTestUser',
	#superclass : 'Object',
	#instVars : [
		'username',
		'password',
		'enabled'
	],
	#category : 'MySTON-Tests',
	#package : 'MySTON',
	#tag : 'Tests'
}

{ #category : 'instance creation' }
MySTONTestUser class >> dummy [
	"self dummy"

	| username password |
	username := String streamContents: [ :stream |
		stream << 'user'; print: 999 atRandom; << '@company'; print: 99 atRandom; << '.com' ].
	password := String streamContents: [ :stream |
		stream << 'secret'; print: 999 atRandom ].
	^ self new
		username: username;
		password: password;
		yourself
]

{ #category : 'ston-core' }
MySTONTestUser class >> myStonName [
	^ #TestUser
]

{ #category : 'ston-core' }
MySTONTestUser class >> stonName [
	^ #TestUser
]

{ #category : 'comparing' }
MySTONTestUser >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ username = anObject username and: [ password = anObject password and: [ enabled = anObject enabled ] ]
]

{ #category : 'accessing' }
MySTONTestUser >> enabled [
	^ enabled
]

{ #category : 'accessing' }
MySTONTestUser >> enabled: anObject [
	enabled := anObject
]

{ #category : 'comparing' }
MySTONTestUser >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ username hash bitXor: (password hash bitXor: enabled hash)
]

{ #category : 'initialization' }
MySTONTestUser >> initialize [
	super initialize.
	enabled := true
]

{ #category : 'accessing' }
MySTONTestUser >> password [
	^ password
]

{ #category : 'accessing' }
MySTONTestUser >> password: anObject [
	password := anObject
]

{ #category : 'accessing' }
MySTONTestUser >> username [
	^ username
]

{ #category : 'accessing' }
MySTONTestUser >> username: anObject [
	username := anObject
]
