Class {
	#name : 'MyMTMethodMutationTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'tests' }
MyMTMethodMutationTest >> simpleTestCaseRessource [
	self assert: 1 + 1 equals: 2
]

{ #category : 'testing accessing' }
MyMTMethodMutationTest >> testAccessing [

	| compiledMethod operator modifiedSource methodMutation |
	compiledMethod := MyMTAuxiliarClassForMTAnalysis
	                  >> #methodWithOnePlusSender.
	operator := MyMTReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MyMTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MyMTAuxiliarClassForMTAnalysis.
	self
		assert: methodMutation originalSource
		equals: compiledMethod sourceCode asString.
	self
		assert: methodMutation originalClass
		equals: MyMTAuxiliarClassForMTAnalysis.
	self assert: methodMutation modifiedSource equals: modifiedSource
]

{ #category : 'testing accessing' }
MyMTMethodMutationTest >> testAccessingToNodes [

	| compiledMethod operator modifiedSource methodMutation |
	compiledMethod := MyMTAuxiliarClassForMTAnalysis
	                  >> #methodWithOnePlusSender.
	operator := MyMTReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MyMTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MyMTAuxiliarClassForMTAnalysis.
	self
		assert: methodMutation nodeToMutate formattedCode
		equals: '1 + 2'.
	self assert: methodMutation mutatedNode formattedCode equals: '1 - 2'
]

{ #category : 'tests' }
MyMTMethodMutationTest >> testMutatedNodeBugFix [
	| method m |
	method := MyMTClassForTestingCoverage class>>#new:.

	m := (MyMTReplaceIdentityWithNegationOfIdentity new mutationsFor: method) first.
	self shouldnt: [ m mutatedNode ] raise:  SubscriptOutOfBounds 
	
]

{ #category : 'tests' }
MyMTMethodMutationTest >> testMutationInfiniteLoop [

	| compiledMethod operator modifiedSource methodMutation res |
	
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.
	
	compiledMethod := MyMTFakeInfiniteLoopForTest >> #iterativeFactorial:.
	operator := MyMTReplaceLessOrEqualWithTrueOperator new.
	
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MyMTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MyMTFakeInfiniteLoopForTest.

	methodMutation testCaseReferences: { (MyMTTestCaseReference
			 for: #testIterativeFactorial
			 in: MyMTFakeInfiniteLoopsTest) }.

	res := methodMutation runMutantStoppingOnError: true.

	self assert: res errors size equals: 1
]

{ #category : 'tests' }
MyMTMethodMutationTest >> testMutationInfiniteRecursion [

	| compiledMethod operator modifiedSource methodMutation res |
	
	"This test will execute another test that will time out.
	So this test will need a higher time limit"
	self timeLimit: self defaultTimeLimit * 2.
	
	compiledMethod := MyMTFakeInfiniteLoopForTest >> #recursiveFactorial:.
	operator := MyMTReplaceIfTrueReceiverWithFalseOperator new.
	
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MyMTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MyMTFakeInfiniteLoopForTest.

	methodMutation testCaseReferences: { (MyMTTestCaseReference
			 for: #testRecursiveFactorial
			 in: MyMTFakeInfiniteLoopsTest) }.

	res := methodMutation runMutantStoppingOnError: true.

	self assert: res errors size equals: 1
]

{ #category : 'tests' }
MyMTMethodMutationTest >> testMutationRun [

	| compiledMethod operator modifiedSource methodMutation res |
	compiledMethod := MyMTAuxiliarClassForMTAnalysis
	                  >> #methodWithOnePlusSender.
	operator := MyMTReplacePlusWithMinusMutantOperator new.
	modifiedSource := operator
		                  modifiedSourceFor: compiledMethod
		                  number: 1.
	methodMutation := MyMTMethodMutation
		                  for: compiledMethod
		                  using: operator
		                  nodeNumber: 1
		                  ofClass: MyMTAuxiliarClassForMTAnalysis.
	methodMutation testCaseReferences:
		{ (MyMTTestCaseReference for: #simpleTestCaseRessource in: self class) }.
	res := methodMutation runMutantStoppingOnError: true.

	self assert: res runCount equals: 1
]
