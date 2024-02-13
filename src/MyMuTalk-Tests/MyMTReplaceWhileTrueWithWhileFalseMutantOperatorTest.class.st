Class {
	#name : 'MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk-Tests',
	#package : 'MyMuTalk-Tests'
}

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithOneSender [

	1 < 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithOneSenderModified [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithTwoSenders [

	1 < 2 whileTrue: [  ].
	3 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	1 < 2 whileFalse: [  ].
	3 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileTrue: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileTrueWithWhileFalseMutantOperatorTest >> operator [

	^ MyMTReplaceWhileTrueWithWhileFalseMutantOperator new
]
