Class {
	#name : 'MyMTMutantOperatorTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'testing' }
MyMTMutantOperatorTest class >> isAbstract [

	^ self == MyMTMutantOperatorTest
]

{ #category : 'accessing' }
MyMTMutantOperatorTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertApplyingMutantToFirstSenderInOneSenderMethod [
	^ self compareSource: 
				(self operator 
						modifiedSourceFor: self class >> #methodWithOneSender
						number: 1) 
			withSourceInMethod: self class >> #methodWithOneSenderModified
			replacingSelector: #methodWithOneSender
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertApplyingMutantToFirstSenderInTwoSendersMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedFirst
		replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertApplyingMutantToNonSenderMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithNoSenders
					number: 1) 
		withSourceInMethod: self class >> #methodWithNoSenders
		replacingSelector: #methodWithNoSenders
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertApplyingMutantToSecondSenderInTwoSendersMethod [
	^self 
		compareSource: 
			(self operator 
					modifiedSourceFor: self class >> #methodWithTwoSenders
					number: 2) 
		withSourceInMethod: self class >> #methodWithTwoSendersModifiedSecond
		replacingSelector: #methodWithTwoSenders
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertNumberMutantsGeneratedForNonSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithNoSenders.
	^mutationsGenerated size = 0.
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertNumberMutantsGeneratedForOneSenderMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithOneSender.
	^mutationsGenerated size = 1.
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertNumberMutantsGeneratedForTwoSendersMethod [
	|mutationsGenerated|
	mutationsGenerated := self operator mutationsFor: self class >> #methodWithTwoSenders.
	^mutationsGenerated size = 2.
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertTimesToApplyOperatorInTwoSendersMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithTwoSenders) = 2
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertTimesToApplyOperatorToNonSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithNoSenders) = 0
]

{ #category : 'asserts' }
MyMTMutantOperatorTest >> assertTimesToApplyOperatorToOneSenderMethod [
	^ (self operator timesToApplyIn: self class >> #methodWithOneSender) = 1
]

{ #category : 'formatting' }
MyMTMutantOperatorTest >> compareSource: aSource withSourceInMethod: aCompiledMethod replacingSelector: aSelector [
	"Compare both source replacing the selector of CompiledMethod for aSelector (to make then equal) 
	and formatting both sources equally."

	| sourceSelector secondString methodSelectorString secondStringModified |
	sourceSelector := aSelector asString.
	secondString := aCompiledMethod sourceCode asString.
	methodSelectorString := aCompiledMethod selector asString.
	secondStringModified := secondString
		copyReplaceAll: methodSelectorString
		with: sourceSelector.
	^ (self formattedStringFor: aSource)
		= (self formattedStringFor: secondStringModified)
]

{ #category : 'formatting' }
MyMTMutantOperatorTest >> formattedStringFor: aMethodString [ 
	^ (RBParser parseMethod: aMethodString) formattedCode
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> methodWithNoSenders [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> methodWithOneSender [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> methodWithOneSenderModified [

	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> methodWithTwoSenders [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> operator [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTMutantOperatorTest >> operatorDescription [

	^ self operator description
]

{ #category : 'tests' }
MyMTMutantOperatorTest >> testApplyMutantToMethod [
	self assert: self assertApplyingMutantToNonSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInOneSenderMethod.
	self assert: self assertApplyingMutantToFirstSenderInTwoSendersMethod.
	self assert: self assertApplyingMutantToSecondSenderInTwoSendersMethod
]

{ #category : 'tests' }
MyMTMutantOperatorTest >> testNumberMutantsGenerated [
	self assert: self assertNumberMutantsGeneratedForNonSenderMethod.
	self assert: self assertNumberMutantsGeneratedForOneSenderMethod.
	self assert: self assertNumberMutantsGeneratedForTwoSendersMethod
]

{ #category : 'tests' }
MyMTMutantOperatorTest >> testPrintingAccessors [

	self
		assert: self operator description
		equals: self operatorDescription
]

{ #category : 'tests' }
MyMTMutantOperatorTest >> testTimesToApplyMutantToMethod [
	self assert: self assertTimesToApplyOperatorToNonSenderMethod.
	self assert: self assertTimesToApplyOperatorToOneSenderMethod.
	self assert: self assertTimesToApplyOperatorInTwoSendersMethod
]
