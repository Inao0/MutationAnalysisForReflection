Class {
	#name : 'MyMTCIHelper',
	#superclass : 'Object',
	#instVars : [
		'myRandom',
		'myObject',
		'myLiteral'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'initialization' }
MyMTCIHelper >> initialize [

	myRandom := UUID new asString.
	myObject := (10 @ 20)
]

{ #category : 'as yet unclassified' }
MyMTCIHelper >> moveX [

	myObject setX: myObject x + 1 setY: myObject y
]

{ #category : 'accessing' }
MyMTCIHelper >> myLiteral [

	^ myLiteral
]

{ #category : 'accessing' }
MyMTCIHelper >> myLiteral: anObject [

	myLiteral := anObject
]

{ #category : 'accessing' }
MyMTCIHelper >> myObject [

	^ myObject
]

{ #category : 'accessing' }
MyMTCIHelper >> myObject: anObject [

	myObject := anObject
]

{ #category : 'accessing' }
MyMTCIHelper >> myRandom [

	^ myRandom
]

{ #category : 'accessing' }
MyMTCIHelper >> myRandom: anObject [

	myRandom := anObject
]