# Module that can be included (mixin) to take and output Yaml data
require 'yaml'
require 'csv'

module YamlBuddy
  def take_yaml(yaml)
    yaml_str = YAML.safe_load(yaml)
    puts yaml_str.class
    headers = yaml_str[0].keys.join("\t") + "\n"
    content = yaml_str.map { |row| row.values.join("\t") }.join("\n") + "\n"
    @data = headers + content

    # yaml.each do |x|
    #   x.each { |_, v| @data << "#{v}\t" }
    #   @data << "\n"
    # end
    # @data
  end

  def to_yaml
    @data.to_yaml
  end
end
