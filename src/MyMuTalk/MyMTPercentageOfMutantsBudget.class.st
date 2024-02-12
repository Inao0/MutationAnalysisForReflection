Class {
	#name : 'MyMTPercentageOfMutantsBudget',
	#superclass : 'MyMTBudget',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'validation' }
MyMTPercentageOfMutantsBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	^ computedMutations size
	  >= (constraint / 100 * totalMutations size)
]
