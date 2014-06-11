# Title: Get Directories plugin
# Author: critzo
# Description: Display list of pages and directories beneath current directory
#
#

module Jekyll
  class GetDirs < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      #thisdir = Dir.glob(".")
      thisdir = File.basename(Dir.getwd)
      dirs = Dir.glob("*/")

#      thisdir.each do |d|
#	html += '<a href="'
#        html += d
#	html += '">'
#	html += d
#	html += '</a>'
#      end
      html = '<ul>'
      dirs.each do |dir|
      #thisdir.each do |dir|
	case dir
	when /_site(.*)/
	  #puts ''
	when '_includes/'
	  #puts ''
	when '_plugins/'
	  #puts ''
	when '_layouts/'
	  #puts ''
	when 'css/'
	  #puts ''
	else
	  html += '<li><a href="/' 
	  html += dir 
	  html += '">'
	  html += dir 
	  html += '</a></li>' 
	end
      end
      html += '</ul>'
      html
    end
  end
end

Liquid::Template.register_tag('get_dirs', Jekyll::GetDirs)

