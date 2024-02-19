Class {
	#name : 'MyMTFakeInfiniteLoopForTest',
	#superclass : 'Object',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'not defined protocol' }
MyMTFakeInfiniteLoopForTest >> iterativeFactorial: anInt [

	| factorial i |
	^ anInt = 1
		  ifTrue: [ 1 ]
		  ifFalse: [ 
			  factorial := 1.
			  i := 2.
			  "Use a whileTrue: so a mutation can introduce an infinite loop here"
			  [ i <= anInt ] whileTrue: [ 
				  factorial := factorial * i.
				  i := i + 1 ].
			  factorial ]
]

{ #category : 'not defined protocol' }
MyMTFakeInfiniteLoopForTest >> recursiveFactorial: anInt [

	"If a mutation replaces this cut condition to false, this will loop"
	anInt = 1 ifTrue: [ ^ 1 ].

	^ anInt * (self recursiveFactorial: anInt - 1)
]
