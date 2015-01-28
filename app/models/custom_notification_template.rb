class CustomNotificationTemplate
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  attr_accessor :subject, :body, :to_users

  def persisted?; false; end

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def attributes=(attributes = {})
    if attributes
      attributes.each do |name, value|
        send "#{name}=", value
      end
    end
  end

  def attributes
    Hash[instance_variable_names.map{|v| [v[1..-1], instance_variable_get(v)]}]
  end
end
