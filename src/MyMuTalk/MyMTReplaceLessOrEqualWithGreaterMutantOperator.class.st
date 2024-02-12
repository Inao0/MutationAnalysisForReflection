Class {
	#name : 'MyMTReplaceLessOrEqualWithGreaterMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MyMTReplaceLessOrEqualWithGreaterMutantOperator >> oldSelector [
	^#<=
]
