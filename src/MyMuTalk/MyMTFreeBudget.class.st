Class {
	#name : 'MyMTFreeBudget',
	#superclass : 'MyMTBudget',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'validation' }
MyMTFreeBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [
	"Since this budget have no constraint, the budget is never exceeded"

	^ false
]
