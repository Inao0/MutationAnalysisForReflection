Class {
	#name : 'MyMTAuxiliarClassForTestingStrategies',
	#superclass : 'Object',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'not defined category' }
MyMTAuxiliarClassForTestingStrategies >> aNotCoveredMethod [
	true ifTrue: [^2]
]

{ #category : 'not defined protocol' }
MyMTAuxiliarClassForTestingStrategies >> method1 [

	true ifTrue: [ ^ 1 ]
]

{ #category : 'not defined category' }
MyMTAuxiliarClassForTestingStrategies >> method2 [
	^2
]
