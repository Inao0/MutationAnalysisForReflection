Class {
	#name : 'MyMTEmptyMethodOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTEmptyMethodOperatorTest >> methodWithOneSender [

	self operator.
	self operatorDescription 
]

{ #category : 'accessing' }
MyMTEmptyMethodOperatorTest >> methodWithOneSenderModified [

	
]

{ #category : 'accessing' }
MyMTEmptyMethodOperatorTest >> operator [

	^ MyMTEmptyMethodOperator new
]

{ #category : 'tests' }
MyMTEmptyMethodOperatorTest >> testApplyMutantToMethod [

	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod
]

{ #category : 'tests' }
MyMTEmptyMethodOperatorTest >> testNumberMutantsGenerated [

	self assert: self assertNumberMutantsGeneratedForOneSenderMethod
]

{ #category : 'tests' }
MyMTEmptyMethodOperatorTest >> testTimesToApplyMutantToMethod [

	self assert: self assertTimesToApplyOperatorToOneSenderMethod
]
