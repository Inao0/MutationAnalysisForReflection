Class {
	#name : 'MyMTReplaceSelectWithRejectMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperator >> newSelector [
	^#reject:
]

{ #category : 'accessing' }
MyMTReplaceSelectWithRejectMutantOperator >> oldSelector [
	^#select:
]
