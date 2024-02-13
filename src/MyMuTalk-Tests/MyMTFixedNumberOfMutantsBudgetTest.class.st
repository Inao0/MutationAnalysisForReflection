Class {
	#name : 'MyMTFixedNumberOfMutantsBudgetTest',
	#superclass : 'MyMTBudgetTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'tests' }
MyMTFixedNumberOfMutantsBudgetTest >> runAnalysisForFixedNumberOfMutants: aNumber [

	self runAnalysisFor: (MyMTFixedNumberOfMutantsBudget for: aNumber)
]

{ #category : 'tests' }
MyMTFixedNumberOfMutantsBudgetTest >> testEvaluateAllMutantsWithConstraintGreaterThanActualNumberOfMutations [

	self runAnalysisForFixedNumberOfMutants: 50.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 25
]

{ #category : 'tests' }
MyMTFixedNumberOfMutantsBudgetTest >> testEvaluateTheCorrectNumberOfMutants [

	self runAnalysisForFixedNumberOfMutants: 10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 10
]

{ #category : 'tests' }
MyMTFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithConstraintOfZero [

	self runAnalysisForFixedNumberOfMutants: 0.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]

{ #category : 'tests' }
MyMTFixedNumberOfMutantsBudgetTest >> testEvaluateZeroMutantsWithNegativeConstraint [

	self runAnalysisForFixedNumberOfMutants: -10.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 0
]
