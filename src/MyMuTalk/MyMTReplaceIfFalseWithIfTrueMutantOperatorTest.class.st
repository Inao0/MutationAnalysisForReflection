Class {
	#name : 'MyMTReplaceIfFalseWithIfTrueMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithNoSenders [  
	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithOneSender [  
	false ifFalse: [^true]. 
 	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithOneSenderModified [  
	false ifTrue: [^true]. 
 	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSenders [
	false ifFalse: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSendersModifiedFirst [
	false ifTrue: [^true].
	true ifFalse: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperatorTest >> methodWithTwoSendersModifiedSecond [
	false ifFalse: [^true].
	true ifTrue: [^true].
	^false
]

{ #category : 'accessing' }
MyMTReplaceIfFalseWithIfTrueMutantOperatorTest >> operator [
	^ MyMTReplaceIfFalseWithIfTrueMutantOperator new
]
