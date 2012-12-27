---
layout: post
title: "Octopress failed to read_yaml"
date: 2012-08-28 16:06
comments: true
categories: ruby octopress
---

Octopress failed to read_yaml if your markdown file is GBK encoding.
edit **Ruby1.9.3\lib\ruby\gems\1.9.1\gems\jekyll-0.11.2\lib\jekyll\convertible.rb**
as follow

``` ruby convertible.rb line#29
def read_yaml(base, name)
  self.content = File.read(File.join(base, name)).force_encoding('utf-8')

  if self.content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
    self.content = $POSTMATCH

    begin
      self.data = YAML.load($1)
    rescue => e
      puts "YAML Exception reading #{name}: #{e.message}"
    end
  end

  self.data ||= {}
end
```

force_encoding will do the trick.