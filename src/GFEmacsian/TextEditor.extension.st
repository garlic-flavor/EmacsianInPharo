Extension { #name : #TextEditor }

{ #category : #'*GFEmacsian' }
TextEditor class >> buildGFEmacsianShortcut: aBuilder [
	<keymap>
	(aBuilder shortcut: #gfemacsian)
		category: #TextEditor
		default: $f ctrl
		do: [ :target | target editor selectAt: (target editor caret + 1) ]
		description: 'GFEmacsian.'.

]
