Class {
	#name : 'MyMTLiteralIntegersToZeroOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTLiteralIntegersToZeroOperator >> description [

	^ 'Convert a literal integer to zero'
]

{ #category : 'applying' }
MyMTLiteralIntegersToZeroOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isInteger and: [aNode value isZero not] ] ]
]

{ #category : 'applying' }
MyMTLiteralIntegersToZeroOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: 0 ]
]
