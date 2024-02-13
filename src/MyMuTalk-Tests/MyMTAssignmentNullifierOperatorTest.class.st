Class {
	#name : 'MyMTAssignmentNullifierOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTAssignmentNullifierOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MyMTAssignmentNullifierOperatorTest >> methodWithOneSender [

	| i |
	i := 1
]

{ #category : 'accessing' }
MyMTAssignmentNullifierOperatorTest >> methodWithOneSenderModified [

	| i |
	i := nil
]

{ #category : 'accessing' }
MyMTAssignmentNullifierOperatorTest >> methodWithTwoSenders [

	| i j |
	i := 1.
	j := 2
]

{ #category : 'accessing' }
MyMTAssignmentNullifierOperatorTest >> methodWithTwoSendersModifiedFirst [

	| i j |
	i := nil.
	j := 2
]

{ #category : 'accessing' }
MyMTAssignmentNullifierOperatorTest >> methodWithTwoSendersModifiedSecond [

	| i j |
	i := 1.
	j := nil
]

{ #category : 'accessing' }
MyMTAssignmentNullifierOperatorTest >> operator [

	^ MyMTAssignmentNullifierOperator new
]
