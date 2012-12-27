# Title: Baidu Map tag for Jekyll
# Authors: wangwei http://aztack.github.com
#
# Description: Easily output Baidu Map
#
# Syntax {% bmap longitude latitude zoom WIDTHxHEIGHT %}
#
# Examples:
# {% bmap 116.404 39.915 11 300x400 %}
#
# Output:
# <img src="/images/ninja.png">
#

module Jekyll

  class BaiduMapTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @args = [tag_name,markup,tokens]
	  @lng, @lat, @zoom, @size = markup.split ' '
      super
    end

    def render(context)
		width, height = @size.split 'x'
		id = (rand * 1000).round
		result = <<-EOS
			<div id="bmap_#{id}" class="bmap" style="width:#{width}px;height:#{height}px;">
			</div>
			<script type="javascript">
				$(function(){
					debugger;
					var map = new BMap.Map("bmap_#{id}");
					var point = new BMap.Point(#{@lng}, #{@lat});
					map.centerAndZoom(point,15);
				});
			</script>
		EOS
		result.gsub!(/^\s*/,'')
    end
  end
end

Liquid::Template.register_tag('bmap', Jekyll::BaiduMapTag)
