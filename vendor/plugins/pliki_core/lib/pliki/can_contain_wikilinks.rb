module Pliki
  module CanContainWikilinks
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def can_contain_wikilinks(*attributes)
        attributes.each do |attribute|
          define_method("#{attribute}_with_wikilinks".to_sym) do |*params|
            self.class.replace_wikilinks(send("#{attribute}_without_wikilinks".to_sym, *params))
          end

          alias_method_chain attribute, :wikilinks        
        end
        
        extend WikilinksClassMethods
      end
    end

    module WikilinksClassMethods
        def replace_wikilinks(input)
          input.gsub(Regexp.new("\\[\\[[^\\]]*\\]\\]")) {|placeholder| replace_wikilink(placeholder)} if input
        end
      
        def replace_wikilink(placeholder)
          name = name_from_placeholder(placeholder)
          "<a href=\"#{url_for_wiki_name(name)}\">#{name}</a>"
        end
      
        def url_for_wiki_name(name)
          "/pages/#{name_to_permalink(name)}"
        end
      
        def name_to_permalink(name)
          name.underscore.gsub(' ', '_').squeeze('_')
        end
      
        def name_from_placeholder(placeholder)
          placeholder.match(Regexp.new("\\[\\[([^\\]]*)\\]\\]"))[1]
        end
    end
  end
end
