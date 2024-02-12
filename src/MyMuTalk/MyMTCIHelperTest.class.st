Class {
	#name : 'MyMTCIHelperTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'tests' }
MyMTCIHelperTest >> testMoveX [

	| obj |
	obj := MyMTCIHelper new.
	obj moveX.
	self assert: obj myObject y equals: 20.
	"Missing assertion is:     
	
	
	self assert: obj myObject x equals: 10" 
]
