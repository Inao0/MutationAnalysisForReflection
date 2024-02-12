Class {
	#name : 'MyMTAuxiliarClassForMatrixTest',
	#superclass : 'TestCase',
	#instVars : [
		'obj'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'running' }
MyMTAuxiliarClassForMatrixTest >> setUp [

	super setUp.
	obj := MyMTAuxiliarClassForMatrix new
]

{ #category : 'running' }
MyMTAuxiliarClassForMatrixTest >> testMinus [

	self assert: (obj minus: 10) equals: -10
]

{ #category : 'running' }
MyMTAuxiliarClassForMatrixTest >> testPlus [

	self assert: (obj plus: 10) equals: 10
]
