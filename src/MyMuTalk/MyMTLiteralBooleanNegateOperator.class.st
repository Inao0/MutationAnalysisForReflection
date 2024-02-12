Class {
	#name : 'MyMTLiteralBooleanNegateOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTLiteralBooleanNegateOperator >> description [

	^ 'Negate a literal boolean'
]

{ #category : 'applying' }
MyMTLiteralBooleanNegateOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  { true. false } includes: aNode value  ] ]
]

{ #category : 'applying' }
MyMTLiteralBooleanNegateOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: anOldNode value not ]
]
