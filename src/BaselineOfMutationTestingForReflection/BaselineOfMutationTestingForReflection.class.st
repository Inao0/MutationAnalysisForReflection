Class {
	#name : #BaselineOfMutationTestingForReflection,
	#superclass : #BaselineOf,
	#category : #BaselineOfMutationTestingForReflection
}

{ #category : #baselines }
BaselineOfMutationTestingForReflection >> baseline: spec [
	<baseline>
	spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
	spec baseline: 'MuTalk' with: [ spec repository: 'github://pharo-contributions/mutalk/src' ].
	spec
		for: #common
		do: [
			spec
				package: 'MutationTestingForReflection'
		]
]
