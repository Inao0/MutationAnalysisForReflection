Class {
	#name : 'MyMTReplaceSortBlockWithAlwaysTrueBlockOperator',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceSortBlockWithAlwaysTrueBlockOperator >> description [
	^'Replace sortBlock:aBlock with sortBlock:[:a :b| true]'.
]

{ #category : 'applying' }
MyMTReplaceSortBlockWithAlwaysTrueBlockOperator >> expressionToReplace [ 
	^'``@sortedCollection sortBlock: ``@aBlock'
]

{ #category : 'applying' }
MyMTReplaceSortBlockWithAlwaysTrueBlockOperator >> newExpression [
	^'``@sortedCollection sortBlock: [:a :b| true]'.
]
