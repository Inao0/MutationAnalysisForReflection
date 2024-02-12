Class {
	#name : 'MyMTReplaceMinusWithPlusMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperator >> newSelector [
	^#+
]

{ #category : 'accessing' }
MyMTReplaceMinusWithPlusMutantOperator >> oldSelector [
	^#-
]
