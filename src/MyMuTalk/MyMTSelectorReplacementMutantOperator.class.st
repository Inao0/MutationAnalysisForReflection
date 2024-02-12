Class {
	#name : 'MyMTSelectorReplacementMutantOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTSelectorReplacementMutantOperator class >> isAbstract [

	^ self == MyMTSelectorReplacementMutantOperator
]

{ #category : 'printing' }
MyMTSelectorReplacementMutantOperator >> description [
	^ 'Replace ' , self oldSelector printString , ' with ' , self newSelector printString
]

{ #category : 'applying' }
MyMTSelectorReplacementMutantOperator >> expressionToReplace [ 
	| oldString |
	oldString := RBParseTreeSearcher buildSelectorString: self oldSelector.
	^'``@object ' , oldString
	
]

{ #category : 'applying' }
MyMTSelectorReplacementMutantOperator >> newExpression [ 
	| newString |
	newString := RBParseTreeSearcher buildSelectorString: self newSelector.
	^'``@object ' , newString

]

{ #category : 'accessing' }
MyMTSelectorReplacementMutantOperator >> newSelector [
	self subclassResponsibility
]

{ #category : 'accessing' }
MyMTSelectorReplacementMutantOperator >> oldSelector [
	self subclassResponsibility
]
