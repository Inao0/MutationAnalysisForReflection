Class {
	#name : 'MyMTReplaceWhileFalseReceiverWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithOneSender [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithOneSenderModified [

	true whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithTwoSenders [

	1 < 2 whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [

	true whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileFalse: [  ].
	true whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseReceiverWithTrueOperatorTest >> operator [

	^ MyMTReplaceWhileFalseReceiverWithTrueOperator new
]
