Class {
	#name : 'MyMTReplaceMaxWithMinMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceMaxWithMinMutantOperator >> newSelector [
	^#min:
]

{ #category : 'accessing' }
MyMTReplaceMaxWithMinMutantOperator >> oldSelector [
	^#max:
]
