Class {
	#name : 'MyMTPercentageOfMutantsBudgetTest',
	#superclass : 'MyMTBudgetTest',
	#instVars : [
		'numberOfMutations'
	],
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'tests' }
MyMTPercentageOfMutantsBudgetTest >> percentageOfEvaluatedMutants [

	^ analysis generalResult numberOfEvaluatedMutants
	  / analysis mutations size * 100
]

{ #category : 'tests' }
MyMTPercentageOfMutantsBudgetTest >> runAnalysisForPercentageOfMutants: aPercentage [

	self runAnalysisFor: (MyMTPercentageOfMutantsBudget for: aPercentage)
]

{ #category : 'tests' }
MyMTPercentageOfMutantsBudgetTest >> testEvaluateAllMutantsWithMoreThanOneHundredPercentConstraint [

	self runAnalysisForPercentageOfMutants: 120.
	self assert: self percentageOfEvaluatedMutants equals: 100
]

{ #category : 'tests' }
MyMTPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithNegativePercentConstraint [

	self runAnalysisForPercentageOfMutants: -10.
	self assert: self percentageOfEvaluatedMutants equals: 0
]

{ #category : 'tests' }
MyMTPercentageOfMutantsBudgetTest >> testEvaluateZeroPercentOfMutantsWithZeroPercentConstraint [

	self runAnalysisForPercentageOfMutants: 0.
	self assert: self percentageOfEvaluatedMutants equals: 0
]

{ #category : 'tests' }
MyMTPercentageOfMutantsBudgetTest >> testExactPercentageOfMutants [

	self runAnalysisForPercentageOfMutants: 20.
	self assert: self percentageOfEvaluatedMutants equals: 20
]

{ #category : 'tests' }
MyMTPercentageOfMutantsBudgetTest >> testNonExactPercentageOfMutants [

	self runAnalysisForPercentageOfMutants: 21.
	self assert: self percentageOfEvaluatedMutants >= 21.
	self
		assert: analysis generalResult numberOfEvaluatedMutants
		equals: 6
]
