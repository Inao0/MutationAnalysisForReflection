Class {
	#name : 'MyMTNonMutatedMethodsAnalysisTest',
	#superclass : 'TestCase',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'tests' }
MyMTNonMutatedMethodsAnalysisTest >> testNonMutatedMethods [

	| results |
	results := (MyMTNonMutatedMethodsAnalysis forClasses: {
			            MyMTAuxiliarClassForMatrix.
			            MyMTAuxiliarClassForMatrixTest })
		           methodsWithoutMutation asSet.

	self
		assert: results
		equals: MyMTAuxiliarClassForMatrixTest methods asSet
]
