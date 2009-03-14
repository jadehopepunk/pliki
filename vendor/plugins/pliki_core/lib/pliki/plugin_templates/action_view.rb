ActionView::Base.class_eval do
  def initialize_with_pliki_plugins(*args)
    initialize_without_pliki_plugins *args

    Pliki::Manager.plugins.reverse.each do |plugin|
      view_paths << plugin.templates_path
    end
  end
  alias_method_chain :initialize, :pliki_plugins
end