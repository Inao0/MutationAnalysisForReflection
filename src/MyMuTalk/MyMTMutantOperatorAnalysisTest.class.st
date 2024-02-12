Class {
	#name : 'MyMTMutantOperatorAnalysisTest',
	#superclass : 'TestCase',
	#instVars : [
		'operatorAnalysis'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'running' }
MyMTMutantOperatorAnalysisTest >> setUp [

	super setUp.

	operatorAnalysis := MyMTMutantOperatorAnalysis forClasses:
		                    { MyMTAuxiliarClassForMutantOperatorAnalysis }
]

{ #category : 'tests' }
MyMTMutantOperatorAnalysisTest >> testGetAllOperators [

	| actual expected |
	actual := operatorAnalysis operatorsProducingAtLeast: 0.
	expected := (MyMTMutantOperator contentsAll collect: #species) asSet.

	self assert: actual equals: expected
]

{ #category : 'tests' }
MyMTMutantOperatorAnalysisTest >> testOperatorsProducingOver [

	| actual expected |
	actual := operatorAnalysis operatorsProducingAtLeast: 3.
	expected := Set
		            with: MyMTLiteralIntegersIncreaseOperator
		            with: MyMTLiteralIntegersToZeroOperator
		            with: MyMTLiteralIntegersDecreaseOperator.

	self assert: actual equals: expected
]

{ #category : 'tests' }
MyMTMutantOperatorAnalysisTest >> testOperatorsProducingUnder [

	| actual expected |
	actual := operatorAnalysis operatorsProducingAtMost: 2.
	expected := (MyMTMutantOperator contentsAll collect: #species) asSet
		            reject: [ :operator |
			            {
				            MyMTLiteralIntegersIncreaseOperator.
				            MyMTLiteralIntegersToZeroOperator.
				            MyMTLiteralIntegersDecreaseOperator } includes: operator ].

	self assert: actual equals: expected
]
