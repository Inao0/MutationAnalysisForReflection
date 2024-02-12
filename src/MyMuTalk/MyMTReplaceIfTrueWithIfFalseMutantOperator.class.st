Class {
	#name : 'MyMTReplaceIfTrueWithIfFalseMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperator >> newSelector [
	^#ifFalse:
]

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperator >> oldSelector [
	^#ifTrue:
]
