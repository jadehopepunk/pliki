module Pliki
  module Helpers
    module FormHelper

      def ajax_loader(name)
        spinner_image = image_tag("ajax-loader.gif", :alt => 'loading', :id => 'spinner_' + name.to_s, :class => 'ajax_loader', :style => 'display: none')
      end
      
      def form_footer(name, options = {})
        # if logged_in? || options[:requires_login] === false
        options[:submit_name] = 'Submit' unless options[:submit_name]
        options[:cancel_name] = 'Cancel' unless options[:cancel_name]

        buttons = [submit_tag(options[:submit_name])]

        if options[:cancel_function]
    		  buttons <<	link_to_function(options[:cancel_name], options[:cancel_function])
    		elsif options[:cancel_link]
    		  buttons <<	link_to(options[:cancel_name], options[:cancel_link], {:class => 'red'})
    		end

        result = content_tag('div', buttons.join(' or '), :id => "#{name}_buttons")
        result += ajax_loader(name)
        as_footer result
        # else
        #   not_logged_in_form_footer
        # end
      end
  
      def as_footer(value)
        content_tag 'div', value, :class => 'footer'
      end

      def not_logged_in_form_footer
        as_footer "<div class=\"login_required\">You are going to need to #{link_to('login or signup', new_session_path)} to playful bent in order to do this.</div>"
      end
      
    end
  end
end