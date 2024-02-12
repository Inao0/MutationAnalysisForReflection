Class {
	#name : 'MyMTLiteralStringChangeOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTLiteralStringChangeOperator >> description [

	^ 'Convert a literal string to a predefined string'
]

{ #category : 'applying' }
MyMTLiteralStringChangeOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isLiteralNode & aNode isLiteralArray not and: [ 
		  aNode value isString and: [ aNode value ~= self stringReplaced ] ] ]
]

{ #category : 'applying' }
MyMTLiteralStringChangeOperator >> newExpression [

	^ [ :anOldNode | RBLiteralValueNode value: self stringReplaced  ]
]

{ #category : 'applying' }
MyMTLiteralStringChangeOperator >> stringReplaced [
	^ 'rAnDoM-MuTalk-StRiNg'
]
