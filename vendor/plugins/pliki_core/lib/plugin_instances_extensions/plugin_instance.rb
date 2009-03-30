
PluginInstance.class_eval do
  has_one :node, :class_name => "Pliki::Node"

  def to_param
    node.to_param
  end
end

