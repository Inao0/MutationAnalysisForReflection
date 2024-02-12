Class {
	#name : 'MyMTReplaceIdentityWithNegationOfIdentity',
	#superclass : 'MyMTMutantOperator',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTReplaceIdentityWithNegationOfIdentity >> description [
	^'Replace a == b with (a == b) not'
]

{ #category : 'applying' }
MyMTReplaceIdentityWithNegationOfIdentity >> expressionToReplace [ 
	^'``@a == ``@b'

]

{ #category : 'applying' }
MyMTReplaceIdentityWithNegationOfIdentity >> newExpression [ 
	^'(``@a == ``@b) not'

]
