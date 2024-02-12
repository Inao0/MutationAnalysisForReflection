Class {
	#name : 'MyMTMutantOperatorAnalysis',
	#superclass : 'MyMTUtilityAnalysis',
	#category : 'MyMuTalk',
	#package : 'MyMuTalk'
}

{ #category : 'adding' }
MyMTMutantOperatorAnalysis >> addAllAssociationsFrom: sourceDictionary to: destinationDictionary [

	sourceDictionary associationsDo: [ :assoc |
		| key value |
		key := assoc key.
		value := assoc value.
		destinationDictionary
			at: key
			ifPresent: [ :v |
			destinationDictionary at: key update: [ :val | val + value ] ]
			ifAbsentPut: [ destinationDictionary at: key put: value ] ].

	^ destinationDictionary
]

{ #category : 'computing' }
MyMTMutantOperatorAnalysis >> operatorDictionary [
	"Returns the dictionary with mutant operators as keys, and for each operator the number of mutants it produce"

	| operatorDictionary operatorsWithoutMutants |
	operatorDictionary := self operatorDictionaryFromAnalysis.
	operatorsWithoutMutants := self operatorsWithoutMutantsFor:
		                           operatorDictionary.

	operatorDictionary := self
		                       addAllAssociationsFrom:
		                       operatorsWithoutMutants
		                       to: operatorDictionary asDictionary.

	^ operatorDictionary
]

{ #category : 'computing' }
MyMTMutantOperatorAnalysis >> operatorDictionaryFromAnalysis [

	| analysis dic |
	analysis := MyMTAnalysis new
		            classesToMutate: classes;
		            testClasses: {  };
		            operators: MyMTMutantOperator contentsAll.

	analysis generateMutations.

	^ dic := (analysis mutations groupedBy: [ :e | e operator species ])
		         collect: [ :coll | coll size ]
]

{ #category : 'computing' }
MyMTMutantOperatorAnalysis >> operatorsProducingAtLeast: aNumber [

	^ self operatorsSelectedWith: [ :value | value >= aNumber ]
]

{ #category : 'computing' }
MyMTMutantOperatorAnalysis >> operatorsProducingAtMost: aNumber [

	^ self operatorsSelectedWith: [ :value | value <= aNumber ]
]

{ #category : 'computing' }
MyMTMutantOperatorAnalysis >> operatorsSelectedWith: aBlock [

	^ (self operatorDictionary select: aBlock) keys asSet
]

{ #category : 'computing' }
MyMTMutantOperatorAnalysis >> operatorsWithoutMutantsFor: aDictionary [

	| operatorsWithoutMutants |
	operatorsWithoutMutants := (MyMTMutantOperator contentsAll collect:
		                            #species) reject: [ :ope |
		                           aDictionary keys includes: ope ].

	^ Dictionary new
		  addAll:
			  (operatorsWithoutMutants collect: [ :each | each -> 0 ])
				  asDictionary;
		  yourself
]
