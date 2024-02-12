Class {
	#name : 'MyMTLiteralIntegersDecreaseOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTLiteralIntegersDecreaseOperator >> description [

	^ 'Decrease a literal integer'
]

{ #category : 'applying' }
MyMTLiteralIntegersDecreaseOperator >> expressionToReplace [

	^ [ :aNode | aNode isLiteralNode & aNode isLiteralArray not and: [ aNode value isInteger ]  ]
]

{ #category : 'applying' }
MyMTLiteralIntegersDecreaseOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value - 1 ]
]
