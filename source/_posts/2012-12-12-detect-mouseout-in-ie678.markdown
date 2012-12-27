---
layout: post
title: "Detect Mouseout in IE678"
date: 2012-12-12 16:49
comments: true
categories: 
---

```javascript
var mouseoutEventName = 'mouseout.namespace';
$(document)
	.unbind(mouseoutEventName)
	.bind(mouseoutEventName, function () {
    var e = window.event,
	from = e.relatedTarget || e.toElement;
    if (!from || from.nodeName.toUpperCase() === "HTML") {
	//mouse move out window(document)
    }
});
```
