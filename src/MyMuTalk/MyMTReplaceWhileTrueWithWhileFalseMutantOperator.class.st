Class {
	#name : 'MyMTReplaceWhileTrueWithWhileFalseMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperator >> newSelector [

	^ #whileFalse:
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperator >> oldSelector [

	^ #whileTrue:
]
