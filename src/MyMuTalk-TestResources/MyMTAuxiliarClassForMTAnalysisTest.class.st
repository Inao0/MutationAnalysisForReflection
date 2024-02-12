Class {
	#name : 'MyMTAuxiliarClassForMTAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'testing' }
MyMTAuxiliarClassForMTAnalysisTest >> testAnotherMethodWithOneIfFalseSender [

	self
		assert:
		MyMTAuxiliarClassForMTAnalysis new anotherMethodWithOneIfFalseSender
		equals: 1
]

{ #category : 'testing' }
MyMTAuxiliarClassForMTAnalysisTest >> testClassMethodThatSendsSelect [

	self assert:
		MyMTAuxiliarClassForMTAnalysis classMethodThatSendsSelect notEmpty
]

{ #category : 'testing' }
MyMTAuxiliarClassForMTAnalysisTest >> testMethodWithOneIfFalseSender [

	self
		assert: MyMTAuxiliarClassForMTAnalysis new methodWithOneIfFalseSender
		equals: 2
]

{ #category : 'testing' }
MyMTAuxiliarClassForMTAnalysisTest >> testMethodWithOneIfTrueSender [

	self
		assert: MyMTAuxiliarClassForMTAnalysis new methodWithOneIfTrueSender
		equals: 1
]

{ #category : 'testing' }
MyMTAuxiliarClassForMTAnalysisTest >> testMethodWithOnePlusSender [

	self
		assert: MyMTAuxiliarClassForMTAnalysis new methodWithOnePlusSender
		equals: 3
]

{ #category : 'testing' }
MyMTAuxiliarClassForMTAnalysisTest >> testMethodWithTwoMinusSenders [

	self
		assert: MyMTAuxiliarClassForMTAnalysis new methodWithTwoMinusSenders
		equals: -4
]
