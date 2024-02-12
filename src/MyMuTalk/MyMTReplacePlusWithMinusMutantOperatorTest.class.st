Class {
	#name : 'MyMTReplacePlusWithMinusMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperatorTest >> methodWithNoSenders [  
	^ 1 - 2
]

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperatorTest >> methodWithOneSender [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperatorTest >> methodWithOneSenderModified [
	^ 1 - 2
]

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSenders [
	^ 1 + 2 + 3
]

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	^ 1 + 2 - 3
]

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	^ 1 - 2 + 3
]

{ #category : 'accessing' }
MyMTReplacePlusWithMinusMutantOperatorTest >> operator [
	^ MyMTReplacePlusWithMinusMutantOperator new
]
