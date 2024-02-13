Class {
	#name : 'MyMTAuxiliarClassForMatrix',
	#superclass : 'Object',
	#instVars : [
		'counter'
	],
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'initialization' }
MyMTAuxiliarClassForMatrix >> initialize [

	super initialize.
	counter := 0
]

{ #category : 'accessing' }
MyMTAuxiliarClassForMatrix >> minus: aNumber [

	counter := counter - aNumber.
	^ self reset
]

{ #category : 'accessing' }
MyMTAuxiliarClassForMatrix >> plus: aNumber [

	counter := counter + aNumber.
	^ self reset
]

{ #category : 'not defined protocol' }
MyMTAuxiliarClassForMatrix >> reset [

	| count |
	count := counter.
	counter := 0.
	^ count
]
