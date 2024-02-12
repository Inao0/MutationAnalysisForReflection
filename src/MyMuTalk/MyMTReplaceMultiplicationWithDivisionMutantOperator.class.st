Class {
	#name : 'MyMTReplaceMultiplicationWithDivisionMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceMultiplicationWithDivisionMutantOperator >> newSelector [
	^#/
]

{ #category : 'accessing' }
MyMTReplaceMultiplicationWithDivisionMutantOperator >> oldSelector [
	^#*
]
