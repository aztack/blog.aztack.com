---
layout: post
title: "Reading jQuery Source Code, Episode 1"
date: 2012-12-10 11:28
comments: true
categories: javascript webdev
---

How to read?
-----------
You can read jQuery source code with:

- text editor like notepad
- your favorite code editor
- a handy [jQuery source code](http://james.padolsey.com/jquery/) viewer created by [James Padolsey](http://james.padolsey.com/)
- IDE(like Visual Studio 2010 + javascript parser extension; Komodo IDE 7) which support code folding and can make a function tree out of source code for easy navigation

You may open jQuery.js in two window. window#1 for reading code, continuously. window#2 for reference functions.

Where to started?
-----------------
Off course you can read the jQuery source code line by line. But it can be very daunting.
I start from the jQuery constructor. Write a piece of code like

```javascript
	$("#userName");
	$(".password");
	$(document.getElementById("userName"));
	$("<div>");
	$(function(){debugger;});
```

and then debug into the jQuery source code.

#The jQuery constructor
----------------------
You can

- query DOM elements
- creating DOM elements
- listen DOMReady event

with `jQuery(...)` or `$(...)`

`jQuery()` delegate the intialization to jQuery.fn.init

## Query DOM elements
---------------------------------

```javascript jQuery.fn.find
function( selector ) {
		var self = this,
			i, l;

		if ( typeof selector !== "string" ) {
			return jQuery( selector ).filter(function() {
				for ( i = 0, l = self.length; i < l; i++ ) {
					if ( jQuery.contains( self[ i ], this ) ) {
						return true;
					}
				}
			});
		}

		var ret = this.pushStack( "", "find", selector ),
			length, n, r;

		for ( i = 0, l = this.length; i < l; i++ ) {
			length = ret.length;
			jQuery.find( selector, this[i], ret );

			if ( i > 0 ) {
				// Make sure that the results are unique
				for ( n = length; n < ret.length; n++ ) {
					for ( r = 0; r < length; r++ ) {
						if ( ret[r] === ret[n] ) {
							ret.splice(n--, 1);
							break;
						}
					}
				}
			}
		}

		return ret;
	}
```
jQuery.find is function Sizzle
## Creating DOM elements
---------------------------------

References
----------
[jQuery Annoted Source](http://robflaherty.github.com/jquery-annotated-source)