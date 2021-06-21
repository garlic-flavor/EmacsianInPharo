Class {
	#name : #BaselineOfGFEmacsian,
	#superclass : #BaselineOf,
	#category : #BaselineOfGFEmacsian
}

{ #category : #baselines }
BaselineOfGFEmacsian >> baseline: spec [
	<baseline>
	spec 
		for: #common
		do: [ spec 
			package: 'GFEmacsian' ]
]

{ #category : #accessing }
BaselineOfGFEmacsian >> projectClass [
	^ MetacelloCypressBaselineProject
]
