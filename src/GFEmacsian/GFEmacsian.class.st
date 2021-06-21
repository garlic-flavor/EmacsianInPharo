"
I am a placeholder for GFEmacsian class>>#doReset.
This package aim to implement key shortcuts like emacs.
Currently, this is only for mac because of its keyboard layout.
"
Class {
	#name : #GFEmacsian,
	#superclass : #Object,
	#category : #GFEmacsian
}

{ #category : #protected }
GFEmacsian class >> doReset [
	<script>
	KMPragmaKeymapBuilder uniqueInstance reset.
]

{ #category : #initialization }
GFEmacsian class >> initialize [
	self doReset
]
