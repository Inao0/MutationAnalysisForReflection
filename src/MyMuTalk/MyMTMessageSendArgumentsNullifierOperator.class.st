Class {
	#name : 'MyMTMessageSendArgumentsNullifierOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'testing' }
MyMTMessageSendArgumentsNullifierOperator class >> isAbstract [

	^ self == MyMTMessageSendArgumentsNullifierOperator
]

{ #category : 'printing' }
MyMTMessageSendArgumentsNullifierOperator >> description [

	^ 'Nullify the arguments of message sends'
]

{ #category : 'applying' }
MyMTMessageSendArgumentsNullifierOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isMessage and: [ aNode arguments size >= self whichArgument ] ]
]

{ #category : 'applying' }
MyMTMessageSendArgumentsNullifierOperator >> newExpression [

	| whichToReplace nodeCopy |
	^ [ :anOldNode | 
	  nodeCopy := anOldNode copy.
	  whichToReplace := nodeCopy arguments at: self whichArgument.
	  whichToReplace replaceWith: (RBLiteralValueNode value: nil).
	 nodeCopy]
]

{ #category : 'applying' }
MyMTMessageSendArgumentsNullifierOperator >> whichArgument [
	^ self subclassResponsibility 
]
