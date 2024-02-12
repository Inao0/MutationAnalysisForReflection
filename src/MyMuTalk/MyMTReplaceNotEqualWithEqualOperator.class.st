Class {
	#name : 'MyMTReplaceNotEqualWithEqualOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceNotEqualWithEqualOperator >> newSelector [
	^#=
]

{ #category : 'accessing' }
MyMTReplaceNotEqualWithEqualOperator >> oldSelector [
	^#~=
]
