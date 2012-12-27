---
layout: post
title: "Define method in JavaScript and Ruby"
date: 2012-08-16 14:55
comments: true
categories: javascript ruby
---

In javascript, function can be attached onto any *object*;
*object* attributes can be anything,when it is a function, it become a method of that *object*.

If *object* is prototype of a function, the attached function becomes
instance method of that function(`class').

In ruby, all methods are reside in instance of **Class**:

- intance methods are in object.class;
- singleton methods are in object.eigenclass. in code *class << object*.in another word, eigenclass;
- class methods are in eigenclass of object.class, in code *object.class.eigenclass*

``` ruby Object#eigenclass
	class Object
		def eigenclass
			class << self;self;end
		end
	end
```


## Define **singleton** method

``` javascript define singleton method in javascript
	var obj = {};
	obj.greeting = function(){
		console.log('hi');
	};
```

``` ruby define singleton method in ruby
	obj = {}
	def obj.greeting1
		puts 'hi'
	end

	class << obj
		def greeting2
			puts 'hello'
		end
	end
```

## Define **instance** method
``` javascript define instance method in javascript
	function Clazz(){}
	Clazz.prototype.instanceMethod = function(){};
```

``` ruby define instance method in ruby
	class Clazz
		def instanceMethod;end
	end
```

## Define **class** method
``` javascript define class method in javascript
	function Clazz(){}
	Clazz.classMethod = function(){};
	
```

``` ruby define class method in ruby
	class Clazz
		define self.classMethod1;end

		class << self
			def classMethod2;end
		end
	end
```

## Define attribute
``` javascript
	function Klass(){
		this.name = 'klass'
	}
	Klass.prototype.attr = 1;

	k = new Klass();
	k.attr = 123;
	k.attr #=> 123
	k.name #=> 'klass'
	(new Klass()).attr #=> 1
	(new Klass()).name #=> 'klass'
```

``` ruby
	Klass = Class.new
	k = Klass.new

	k.instance_variable_get(:@attr) #=> nil
	k.instance_variable_set(:@attr,123) #=> 123
	k.instance_variable_get(:@attr) #=> 123
	
	k.attr #=> undefined method `attr'
	def k.attr;@attr;end
	k.attr #=> 123

	Klass.new.attr #=> undefined method `attr'
```
