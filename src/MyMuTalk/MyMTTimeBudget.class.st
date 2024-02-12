Class {
	#name : 'MyMTTimeBudget',
	#superclass : 'MyMTBudget',
	#instVars : [
		'initialTime'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'validation' }
MyMTTimeBudget >> exceedsBudgetOn: computedMutations fromTotalMutations: totalMutations [

	| currentTime |
	currentTime := Time current asMilliSeconds.
	^ currentTime - initialTime >= constraint asMilliSeconds
]

{ #category : 'accessing' }
MyMTTimeBudget >> start [

	initialTime := Time current asMilliSeconds
]
