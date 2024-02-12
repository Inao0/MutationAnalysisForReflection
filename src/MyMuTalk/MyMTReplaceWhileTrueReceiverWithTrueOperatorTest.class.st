Class {
	#name : 'MyMTReplaceWhileTrueReceiverWithTrueOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithOneSender [

	1 < 1 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithOneSenderModified [

	true whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithTwoSenders [

	1 < 1 whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedFirst [

	true whileTrue: [  ].
	1 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithTrueOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 1 whileTrue: [  ].
	true whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueReceiverWithTrueOperatorTest >> operator [

	^ MyMTReplaceWhileTrueReceiverWithTrueOperator new 
]
