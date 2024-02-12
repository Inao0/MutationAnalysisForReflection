Class {
	#name : 'MyMTBudget',
	#superclass : 'Object',
	#instVars : [
		'constraint'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTBudget class >> for: aConstraint [

	^ self new
		  constraint: aConstraint;
		  yourself
]

{ #category : 'accessing' }
MyMTBudget >> constraint [

	^ constraint
]

{ #category : 'accessing' }
MyMTBudget >> constraint: aConstraint [

	constraint := aConstraint
]

{ #category : 'validation' }
MyMTBudget >> exceedsBudgetOn: partialCollection fromTotalMutations: initialCollection [
	"Returns true if partialCollection exceed the budget (the time is over, there is enough mutants, etc). Some budgets need data on initialCollection (e.g. percentage budget needs the size)"

	^ self subclassResponsibility
]

{ #category : 'accessing' }
MyMTBudget >> start [
	"Does nothing for most budgets because they don't need specific data at the start of the execution of the mutation testing analysis, but some do (time budget for example).
	In this case, this method should be overriden."

	
]
