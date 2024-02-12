Class {
	#name : 'MyMTAuxiliarClassForMatrix',
	#superclass : 'Object',
	#instVars : [
		'counter'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
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

{ #category : 'resetting' }
MyMTAuxiliarClassForMatrix >> reset [

	| count |
	count := counter.
	counter := 0.
	^ count
]
