Class {
	#name : 'MyMTMethodInstallerTest',
	#superclass : 'TestCase',
	#instVars : [
		'anonymousClass',
		'anonymousClassWithMethod'
	],
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'accessing' }
MyMTMethodInstallerTest class >> packageNamesUnderTest [
	^ #('MutationTesting-Model')
]

{ #category : 'testProtocol' }
MyMTMethodInstallerTest >> methodInstalled [
	"this method is used to test installation,"
	^ 3 + 4

]

{ #category : 'as yet unclassified' }
MyMTMethodInstallerTest >> methodToUninstall [ ^self
]

{ #category : 'accessing' }
MyMTMethodInstallerTest >> numberOfMethodVersionsOf: aSelector in: aClass [ 
	
	| aMethod |
	
	aMethod := aClass>>aSelector.
	
	^ (SourceFiles
		changeRecordsFrom: aMethod sourcePointer
		className: aMethod origin
		isMeta: aMethod origin isClassSide) size
]

{ #category : 'running' }
MyMTMethodInstallerTest >> tearDown [
	"Unistall methods that should not be istalled and install method that should be installed."

	(self class includesSelector: #methodNotInstalled) ifTrue: [ 
		MyMTMethodInstaller new uninstall: #methodNotInstalled from: self class ].
	(self class includesSelector: #methodToUninstall) ifFalse: [ 
		MyMTMethodInstaller new
			installFromSource: 'methodToUninstall ^self'
			in: self class ].
	super tearDown
]

{ #category : 'testing' }
MyMTMethodInstallerTest >> testInstallMethodException [
	"Try to install a method that produce an Exception."

	| selector aSourceCode |
	selector := #methodWithError.
	self deny: (self class includesSelector: selector).
	aSourceCode := selector asString , '  ^3+'.
	self
		should: [ 
			MyMTMethodInstaller new
				installFromSourceSilently: aSourceCode
				in: self class ]
		raise: MyMTMethodInstallerException
]

{ #category : 'testing' }
MyMTMethodInstallerTest >> testInstallMethodOnEmptyClass [
	"Install a method on Self"

	| selector aSourceCode |
	selector := #methodNotInstalled.
	self deny: (self class includesSelector: selector).
	aSourceCode := selector asString , '  ^3+4'.
	MyMTMethodInstaller new
		installFromSourceSilently: aSourceCode
		in: self class.
	self assert: (self class includesSelector: selector)
]

{ #category : 'testing' }
MyMTMethodInstallerTest >> testInstallerShouldNotAddSourceVersions [
	"Install a method that produce an Exception. For this. me use an
	Anonimous Class."

	| selector aSourceCode previousNumberOfVersions previousCompiledMethod |
	selector := #methodInstalled.
	previousCompiledMethod := self class methodDictionary at: selector.
	previousNumberOfVersions := self
		                            numberOfMethodVersionsOf: selector
		                            in: self class.

	aSourceCode := selector asString , '  ^3+4'.
	[
	MyMTMethodInstaller new
		installFromSourceSilently: aSourceCode
		in: self class ] ensure: [
		MyMTMethodInstaller new
			install: previousCompiledMethod
			for: selector
			in: self class
			withProtocol: 'testProtocol' ].
	self
		assert: (self numberOfMethodVersionsOf: selector in: self class)
		equals: previousNumberOfVersions
]

{ #category : 'testing' }
MyMTMethodInstallerTest >> testUnInstallMethodOnClass [
	"Uninstall a method from a class that has the method implemented."
	|selector|
	selector := #methodToUninstall.
	self assert: (self class includesSelector: selector).
	MyMTMethodInstaller new uninstall: selector from: self class.
	self deny: (self class includesSelector: selector)
		
]
