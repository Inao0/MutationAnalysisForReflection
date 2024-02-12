Class {
	#name : 'MyMTReplaceRejectWithSelectMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperator >> newSelector [
	^#select:
]

{ #category : 'accessing' }
MyMTReplaceRejectWithSelectMutantOperator >> oldSelector [
	^#reject:
]
