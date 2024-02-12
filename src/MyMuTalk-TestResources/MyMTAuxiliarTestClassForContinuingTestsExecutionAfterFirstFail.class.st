Class {
	#name : 'MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail',
	#superclass : 'TestCase',
	#classInstVars : [
		'counter'
	],
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'accessing' }
MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> counter [

	^ counter
]

{ #category : 'accessing' }
MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> counter: anObject [

	counter := anObject
]

{ #category : 'accessing' }
MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> increment [

	counter := counter + 1
]

{ #category : 'accessing' }
MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail class >> reset [

	counter := 0
]

{ #category : 'tests' }
MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testA [

	self class increment.
	self assert: self class counter < 4
]

{ #category : 'tests' }
MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testB [

	self class increment.
	self assert: self class counter < 4
]

{ #category : 'tests' }
MyMTAuxiliarTestClassForContinuingTestsExecutionAfterFirstFail >> testC [

	self class increment.
	self assert: self class counter < 4
]
