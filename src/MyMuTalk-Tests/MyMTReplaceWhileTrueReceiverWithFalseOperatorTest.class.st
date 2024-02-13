Class {
	#name : 'MyMTReplaceWhileTrueReceiverWithFalseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithOneSender [

	1 < 1 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithOneSenderModified [

	false whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithTwoSenders [

	1 < 1 whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [

	false whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 1 whileTrue: [  ].
	false whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithFalseOperatorTest >> operator [

	^ MyMTReplaceWhileTrueReceiverWithFalseOperator new
]
