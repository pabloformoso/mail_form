module MailForm
  class Base
    include ActiveModel::AttributeMethods
    include ActiveModel::Conversion
    include ActiveModel::Validations

    extend ActiveModel::Naming
    extend ActiveModel::Translation

    attribute_method_prefix "clear_"
    attribute_method_suffix "?"

    def self.attributes(*names)
      attr_accessor(*names)
      define_attribute_methods(*names)
    end

    def persisted?
      false
    end
    
    protected

    # Adds clear prefix to all the attributes
    # 
    # @return [*] sets attr value to nil
    # 
    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribute?(attribute)
      send(attribute).present?
    end
  end
end