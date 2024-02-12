Class {
	#name : 'MyMTLiteralIntegersIncreaseOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTLiteralIntegersIncreaseOperator >> description [

	^ 'Increase a literal integer'
]

{ #category : 'applying' }
MyMTLiteralIntegersIncreaseOperator >> expressionToReplace [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]

{ #category : 'applying' }
MyMTLiteralIntegersIncreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value + 1 ]
]
