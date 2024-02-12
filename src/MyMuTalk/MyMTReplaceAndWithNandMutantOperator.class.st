Class {
	#name : 'MyMTReplaceAndWithNandMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperator >> newSelector [
	^#nand:
]

{ #category : 'accessing' }
MyMTReplaceAndWithNandMutantOperator >> oldSelector [
	^#and:
]
