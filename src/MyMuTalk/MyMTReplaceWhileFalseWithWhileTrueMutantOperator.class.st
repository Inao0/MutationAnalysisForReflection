Class {
	#name : 'MyMTReplaceWhileFalseWithWhileTrueMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperator >> newSelector [

	^ #whileTrue:
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperator >> oldSelector [

	^ #whileFalse:
]
