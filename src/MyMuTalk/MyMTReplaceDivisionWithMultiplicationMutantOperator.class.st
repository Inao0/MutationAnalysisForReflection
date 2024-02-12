Class {
	#name : 'MyMTReplaceDivisionWithMultiplicationMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceDivisionWithMultiplicationMutantOperator >> newSelector [
	^#*
]

{ #category : 'accessing' }
MyMTReplaceDivisionWithMultiplicationMutantOperator >> oldSelector [
	^#/
]
