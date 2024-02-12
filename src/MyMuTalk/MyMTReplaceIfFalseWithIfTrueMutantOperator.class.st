Class {
	#name : 'MyMTReplaceIfFalseWithIfTrueMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperator >> newSelector [
	^#ifTrue:
]

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperator >> oldSelector [
	^#ifFalse:
]
