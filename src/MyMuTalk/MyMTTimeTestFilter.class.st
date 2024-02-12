Class {
	#name : 'MyMTTimeTestFilter',
	#superclass : 'MyMTTestFilter',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'enumerating' }
MyMTTimeTestFilter >> filterTests: aTestCaseCollection [

	^ aTestCaseCollection select: [ :testCaseReference |
		  testCaseReference lastTimeToRun <= condition ]
]
