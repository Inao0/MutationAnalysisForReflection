Class {
	#name : 'MyMTLiteralStringToEmptyOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTLiteralStringToEmptyOperator >> description [

	^ 'Convert a literal string to empty string'
]

{ #category : 'applying' }
MyMTLiteralStringToEmptyOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isString  and: [aNode value isNotEmpty ]  ] ]
]

{ #category : 'applying' }
MyMTLiteralStringToEmptyOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: '' ]
]
