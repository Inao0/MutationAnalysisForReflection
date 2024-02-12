Class {
	#name : 'MyMTReplaceWhileFalseReceiverWithFalseOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithOneSender [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithOneSenderModified [

	false whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithTwoSenders [

	1 < 2 whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedFirst [

	false whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithFalseOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileFalse: [  ].
	false whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithFalseOperatorTest >> operator [

	^ MyMTReplaceWhileFalseReceiverWithFalseOperator new
]
