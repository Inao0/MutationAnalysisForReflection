Class {
	#name : 'MyMTAssignmentNullifierOperator',
	#superclass : 'MyMTBlockBasedMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTAssignmentNullifierOperator >> description [
	
	^ 'Nullify the value assigned'
]

{ #category : 'applying' }
MyMTAssignmentNullifierOperator >> expressionToReplace [

	^ [ :aNode | aNode isAssignment & aNode value isNotNil ]
]

{ #category : 'applying' }
MyMTAssignmentNullifierOperator >> newExpression [

	^ [ :anOldNode |
	  | nodeCopy |
	  nodeCopy := anOldNode copy.
	  nodeCopy value: (RBLiteralValueNode value: nil).
	  nodeCopy ]
]
