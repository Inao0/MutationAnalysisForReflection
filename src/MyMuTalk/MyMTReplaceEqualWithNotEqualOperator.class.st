Class {
	#name : 'MyMTReplaceEqualWithNotEqualOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceEqualWithNotEqualOperator >> newSelector [
	^#~=
]

{ #category : 'accessing' }
MyMTReplaceEqualWithNotEqualOperator >> oldSelector [
	^#=
]
