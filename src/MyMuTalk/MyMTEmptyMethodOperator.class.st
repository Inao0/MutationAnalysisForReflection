Class {
	#name : 'MyMTEmptyMethodOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTEmptyMethodOperator >> description [

	^ 'Removing all lines in a method'
]

{ #category : 'applying' }
MyMTEmptyMethodOperator >> expressionToReplace [

	^ [ :aNode | 
	  aNode isSequence and: [ aNode parent isMethod] ]
]

{ #category : 'applying' }
MyMTEmptyMethodOperator >> newExpression [

	^ [ :anOldNode | RBSequenceNode statements: #() ]
]
