Class {
	#name : 'MyMTTestFilter',
	#superclass : 'Object',
	#instVars : [
		'condition'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'instance creation' }
MyMTTestFilter class >> for: aCondition [

	^ self new
		  condition: aCondition;
		  yourself
]

{ #category : 'accessing' }
MyMTTestFilter >> condition [

	^ condition
]

{ #category : 'accessing' }
MyMTTestFilter >> condition: aCondition [

	condition := aCondition
]

{ #category : 'enumerating' }
MyMTTestFilter >> filterTests: aTestCaseCollection [

	^ self subclassResponsibility
]
