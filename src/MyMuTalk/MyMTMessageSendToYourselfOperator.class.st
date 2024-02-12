Class {
	#name : 'MyMTMessageSendToYourselfOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTMessageSendToYourselfOperator >> description [

	^ 'Chnage a message send with #yourself'
]

{ #category : 'applying' }
MyMTMessageSendToYourselfOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isMessage and: [ aNode selector ~= #yourself ] ]
]

{ #category : 'applying' }
MyMTMessageSendToYourselfOperator >> newExpression [

	| nodeCopy |
	^ [ :anOldNode | 
	  nodeCopy := anOldNode copy.
		RBMessageNode receiver: nodeCopy receiver selector: #yourself
	   ]
]
