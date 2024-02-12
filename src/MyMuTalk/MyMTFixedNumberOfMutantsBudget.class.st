Class {
	#name : 'MyMTFixedNumberOfMutantsBudget',
	#superclass : 'MyMTBudget',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'validation' }
MyMTFixedNumberOfMutantsBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	^ computedMutations size >= constraint
]
