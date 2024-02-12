Class {
	#name : 'MyMTReplaceIfTrueWithIfFalseMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithNoSenders [  
	 1 + 2.
	^ true ifTrue:[1] ifFalse:[2].
]

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithOneSender [  
	true ifTrue: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithOneSenderModified [
	true ifFalse: [^true]. 
	 ^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSenders [
	true ifTrue: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	true ifFalse: [^true].
	false ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	true ifTrue: [^true].
	false ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfTrueWithIfFalseMutantOperatorTest >> operator [
	^ MyMTReplaceIfTrueWithIfFalseMutantOperator new
]
