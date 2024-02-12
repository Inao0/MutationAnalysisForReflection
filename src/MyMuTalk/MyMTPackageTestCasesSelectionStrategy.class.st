Class {
	#name : 'MyMTPackageTestCasesSelectionStrategy',
	#superclass : 'MyMTTestCasesSelectionStrategy',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'printing' }
MyMTPackageTestCasesSelectionStrategy >> description [
	^'All tests in same packages'
]

{ #category : 'selecting' }
MyMTPackageTestCasesSelectionStrategy >> isClassTest: aClass [ 
	^ self testBaseClasses
		anySatisfy: [:class | aClass includesBehavior: class]
]

{ #category : 'selecting' }
MyMTPackageTestCasesSelectionStrategy >> testBaseClasses [
	^Array with: TestCase
]

{ #category : 'selecting' }
MyMTPackageTestCasesSelectionStrategy >> testCasesFor: aTestCollection [ 
	| testsPackage |
	testsPackage := self testPackageFrom: aTestCollection.
	^ testsPackage 
		inject: OrderedCollection new
		into: 
			[ :resultTests :testPackage | 
			(self testClassesFromPackage: testPackage) do: [ :testClass | resultTests addAll: testClass suite tests ].
			resultTests ]
]

{ #category : 'selecting' }
MyMTPackageTestCasesSelectionStrategy >> testClassesFromPackage: aPackageName [ 
	^ (aPackageName asPackage) classes select: [ :class | self isClassTest: class ]
]

{ #category : 'selecting' }
MyMTPackageTestCasesSelectionStrategy >> testPackageFrom: aTestCollection [

	^(aTestCollection collect: [:testCase | testCase class package name]) asSet
]
