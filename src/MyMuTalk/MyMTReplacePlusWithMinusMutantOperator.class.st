Class {
	#name : 'MyMTReplacePlusWithMinusMutantOperator',
	#superclass : 'MyMTSelectorReplacementMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperator >> newSelector [
	^#-
]

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperator >> oldSelector [
	^#+
]
