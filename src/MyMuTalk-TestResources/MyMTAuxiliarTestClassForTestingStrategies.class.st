Class {
	#name : 'MyMTAuxiliarTestClassForTestingStrategies',
	#superclass : 'TestCase',
	#category : 'MyMuTalk-TestResources',
	#package : 'MyMuTalk-TestResources'
}

{ #category : 'tests' }
MyMTAuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod1 [

	self
		assert: MyMTAuxiliarClassForTestingStrategies new method1
		equals: 1
]

{ #category : 'tests' }
MyMTAuxiliarTestClassForTestingStrategies >> testMethodThatCoverMethod2 [

	self
		assert: MyMTAuxiliarClassForTestingStrategies new method2
		equals: 2
]
