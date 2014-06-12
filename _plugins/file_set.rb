# FileSet Liquid Plugin
# by critzo based on ImageSet by Erik Dungan
# erik.dungan@gmail.com / @callmeed
# 
# Takes a dir, gets all the files from it, and creates HTML image and container tags
# Useful for creating an image gallery and the like 
# 
# USAGE
# default: {% file_set directory/path %}
# 
# with options: {% image_set images/gallery2 --class=img-responsive --container-tag=div --wrap-tag=div %}
# (this will set the class for the <img> tags and use <div>s for the container and wrap)
# 
# OPTIONS
# --class=some_class (sets the class for the <img> tags, default is 'image')
# --wrap_tag=some_tag (sets the tag to wrap around each <img>, default is 'li')
# --wrap_class=some_class (sets the class for wrap_tag, default is 'image-item')
# --container_tag=some_tag (sets the tag to contain all <img>s, default is 'ul')
# --container_class=some_class (sets the class for container_tag, default is 'image-set')


module Jekyll
  class FileSet < Liquid::Tag
    @path = nil

    @class = nil
    @wrap_class = nil
    @wrap_tag = nil
    @container_tag = nil
    @container_class = nil

    def initialize(tag_name, text, tokens)
      super

      # The path we're getting images from (a dir inside your jekyll dir)
      @path = text.split(/\s+/)[0].strip

      # Defaults
      @class = 'file'
      @wrap_class = 'file-item'
      @wrap_tag = 'li'
      @container_tag = 'ul'
      @container_class = 'file-set'

      # Parse Options
      # if text =~ /--class=(\S+)/i
      #   @class = text.match(/--class=(\S+)/i)[1]
      # end
      # if text =~ /--wrap-class=(\S+)/i
      #   @wrap_class = text.match(/--wrap-class=(\S+)/i)[1]
      # end
      # if text =~ /--wrap-tag=(\S+)/i
      #   @wrap_tag = text.match(/--wrap-tag=(\S+)/i)[1]
      # end
      # if text =~ /--container-tag=(\S+)/i
      #   @container_tag = text.match(/--container-tag=(\S+)/i)[1]
      # end
      # if text =~ /--container-class=(\S+)/i
      #   @container_class = text.match(/--container-class=(\S+)/i)[1]
      # end

    end

    def render(context)
      # Get the full path to the dir
      # Include a filter for all supported file types
      full_path = File.join(context.registers[:site].config['source'], @path, "*.{txt,rtf,pdf,ai,pdf,doc,docx,ppt,pptx}")
      # Start building tags
      source = "<div class='container'><h3 id='addtl-files'>Additional Files in this Folder:</h3>\n"
      source += "<#{@container_tag} class='file-set'>\n"
      # Glob the path and create tags for all files
      Dir.glob(full_path).sort.each do |fileset|
        file = Pathname.new(fileset).basename
        src = File.join('/', @path, file)
        source += "<#{@wrap_tag} class='#{@wrap_class}' title='#{file}' alt='#{file}'>\n"
        source += "<a href='#{src}'>#{file}</a> \n"
        source += "</#{@wrap_tag}>\n"
      end
      # Close it up 
      source += "</#{@container_tag}></div>\n"
      source
    end
  end
end

Liquid::Template.register_tag('file_set', Jekyll::FileSet)
