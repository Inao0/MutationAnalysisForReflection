Class {
	#name : 'MyMTReplaceMinWithMaxMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceMinWithMaxMutantOperator >> newSelector [
	^#max:
]

{ #category : 'accessing' }
MyMTReplaceMinWithMaxMutantOperator >> oldSelector [
	^#min:
]
