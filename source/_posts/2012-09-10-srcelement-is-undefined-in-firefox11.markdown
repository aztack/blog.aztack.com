---
layout: post
title: "srcElement-is-undefined-in-firefox11"
date: 2012-09-10 14:08
comments: true
categories: webdev javascript
---

```javascript
element.bind('mousedown',function(e){
	//srcElement is undefined in firefox11 use target in original event instead
	var	target = e.srcElement || e.originalEvent.target;
});
```