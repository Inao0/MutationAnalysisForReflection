Extension { #name : 'CompiledMethod' }

{ #category : '*MutationTestingForReflection' }
CompiledMethod >> prefixedFailingMethod [

	| astCopy astParsedMethod|
	astCopy := self ast copy.
	astParsedMethod := (OpalCompiler new parse: ('method <prefixedReflectiveMethodProxy>
	^ self fail' )).
	astCopy 
		selector: ('___', astCopy selector );
		removePragmaNamed: #reflection: ; 
		removePragmaNamed: #primitive: ; 
		addPragma: (astParsedMethod pragmaNamed: #prefixedReflectiveMethodProxy)  ;
		body: astParsedMethod body;
		source: astCopy reformatSource.
	^ astCopy generateMethod 
]

{ #category : '*MutationTestingForReflection' }
CompiledMethod >> prefixedProxyMethod [

	| astCopy astParsedMethod|
	astCopy := self ast copy.
	astParsedMethod := (OpalCompiler new parse: ('___', astCopy selectorAndArgumentNames ,' <prefixedReflectiveMethodProxy>
	^ self ' ,  astCopy selectorAndArgumentNames )).
	astCopy 
		selector: ('___', astCopy selector );
		removePragmaNamed: #reflection: ; 
		addPragma: (astParsedMethod pragmaNamed: #prefixedReflectiveMethodProxy)  ;
		body: astParsedMethod body;
		source: astParsedMethod reformatSource.
	^ astCopy generateMethod 
]
