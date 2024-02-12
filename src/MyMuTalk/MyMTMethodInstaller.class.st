Class {
	#name : 'MyMTMethodInstaller',
	#superclass : 'Object',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'installing' }
MyMTMethodInstaller >> install: aMethod for: selector in: aClass withProtocol: methodProtocol [

	aClass
		addAndClassifySelector: selector
		withMethod: aMethod
		inProtocol: methodProtocol
]

{ #category : 'installing' }
MyMTMethodInstaller >> installFromSource: aSourceCode in: aClass [
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."

	[ aClass compile: aSourceCode ]
		on: Error , SyntaxErrorNotification
		do: [ :error | MyMTMethodInstallerException signal ]
]

{ #category : 'installing' }
MyMTMethodInstaller >> installFromSourceSilently: aSourceCode in: aClass [
	"Install a SourceCode in aClass. Raise exception in case de installation is
	not posible."

	[ aClass compileSilently: aSourceCode ]
		on: Error , SyntaxErrorNotification
		do: [ :error | MyMTMethodInstallerException signal ]
]

{ #category : 'installing' }
MyMTMethodInstaller >> uninstall: aSelector from: aClass [ 
	"Uninstall a method referenced by aSelector in aClass. Raise exception in
	case de uninstall is	not posible."
	[aClass removeSelector: aSelector]
		on: Error
		do: [:error | MyMTMethodInstallerException signal]
]
