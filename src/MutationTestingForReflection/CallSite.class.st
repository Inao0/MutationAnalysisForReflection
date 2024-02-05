Class {
	#name : 'CallSite',
	#superclass : 'Object',
	#instVars : [
		'method',
		'selector',
		'nodeNumber',
		'resultFromv1'
	],
	#category : 'MutationTestingForReflection',
	#package : 'MutationTestingForReflection'
}

{ #category : 'comparing' }
CallSite >> = aCallSite [

	^ self species == aCallSite species and: [
		  method = aCallSite method and: [
			  selector = aCallSite selector and: [
				  nodeNumber = aCallSite nodeNumber ] ] ]
]

{ #category : 'comparing' }
CallSite >> hash [
 
	^ (method hash bitXor: selector hash) bitXor: nodeNumber hash
]

{ #category : 'accessing' }
CallSite >> method [

	^ method
]

{ #category : 'accessing' }
CallSite >> method: anObject [

	method := anObject
]

{ #category : 'accessing' }
CallSite >> nodeNumber [

	^ nodeNumber
]

{ #category : 'accessing' }
CallSite >> nodeNumber: anObject [

	nodeNumber := anObject
]

{ #category : 'accessing' }
CallSite >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ('( ', method name, ' ',  selector , ' ' , nodeNumber asString, ' ' , (resultFromv1 ifNil: ['O'] ifNotNil: [ 'x' ]), ' )').
]

{ #category : 'accessing' }
CallSite >> resultFromv1 [

	^ resultFromv1
]

{ #category : 'accessing' }
CallSite >> resultFromv1: aMutantEvaluationResult [

	resultFromv1 := aMutantEvaluationResult
]

{ #category : 'accessing' }
CallSite >> selector [

	^ selector
]

{ #category : 'accessing' }
CallSite >> selector: anObject [

	selector := anObject
]
