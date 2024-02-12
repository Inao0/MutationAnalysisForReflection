Class {
	#name : 'MyMTReplaceLessWithGreaterMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceLessWithGreaterMutantOperator >> newSelector [
	^#>
]

{ #category : 'accessing' }
MyMTReplaceLessWithGreaterMutantOperator >> oldSelector [
	^#<
]
