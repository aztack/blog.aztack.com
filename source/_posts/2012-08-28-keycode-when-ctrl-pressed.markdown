---
layout: post
title: "e.keyCode when ctrl pressed"
date: 2012-08-28 15:53
comments: true
categories: javascript web
---

``` javascript e.keyCode may be 13 or 10
textarea.bind('keypress', function (e) {
    /**
    * Some browsers will send keyCode == 10 instead of keyCode == 13 when using the ctrl modifier key
    * (some browsers will send it even when you aren't using the ctrl modifier key).
    */
    if (e.ctrlKey && (e.keyCode === 13 || e.keyCode === 10)) {
        //do something
        e.preventDefault();
    }
});
```