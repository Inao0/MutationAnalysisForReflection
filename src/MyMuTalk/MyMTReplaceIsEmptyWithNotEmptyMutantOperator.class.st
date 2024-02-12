Class {
	#name : 'MyMTReplaceIsEmptyWithNotEmptyMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperator >> newSelector [
	^#notEmpty
]

{ #category : 'accessing' }
MyMTReplaceIsEmptyWithNotEmptyMutantOperator >> oldSelector [
	^#isEmpty
]
