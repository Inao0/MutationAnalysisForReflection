Class {
	#name : 'MyClassTest',
	#superclass : 'TestCase',
	#category : 'TestPackage-Tests',
	#package : 'TestPackage-Tests'
}

{ #category : 'tests' }
MyClassTest >> testWithAnObject [

	self assert: (MyClass new selectorOf: CallSite new ) equals: nil
]

{ #category : 'tests' }
MyClassTest >> testWithCollection [

	self assert: (MyClass new selectorOf: (SequenceableCollection >>#first)) equals: #first
]
