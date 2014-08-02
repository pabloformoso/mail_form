module MailForm
  class Base
    include ActiveModel::AttributeMethods
    include ActiveModel::Model
    include MailForm::Validators
    extend ActiveModel::Callbacks

    define_model_callbacks :deliver

    attribute_method_prefix "clear_"
    attribute_method_suffix "?"

    class_attribute :attribute_names
    self.attribute_names = []

    def self.attributes(*names)
      attr_accessor(*names)
      define_attribute_methods(*names)

      self.attribute_names += names
    end

    def deliver
      if valid?
        run_callbacks(:deliver) do
          MailForm::Notifier.contact(self).deliver
        end
      else
        false
      end
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