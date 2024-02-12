Class {
	#name : 'MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest',
	#superclass : 'MyMTMutantOperatorTest',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithNoSenders [

	^ 1 + 2
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithOneSender [

	1 < 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithOneSenderModified [

	1 < 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithTwoSenders [

	1 < 2 whileFalse: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithTwoSendersModifiedFirst [

	1 < 2 whileTrue: [  ].
	3 > 2 whileFalse: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> methodWithTwoSendersModifiedSecond [

	1 < 2 whileFalse: [  ].
	3 > 2 whileTrue: [  ]
]

{ #category : 'accessing' }
MyMTReplaceWhileFalseWithWhileTrueMutantOperatorTest >> operator [

	^ MyMTReplaceWhileFalseWithWhileTrueMutantOperator new
]
