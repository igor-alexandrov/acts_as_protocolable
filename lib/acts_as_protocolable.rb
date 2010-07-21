module ActsAsProtocolable
  mattr_accessor :internal_user_id

  module ClassMethods
    def acts_as_protocoled(options = {})
      self.acts_as_protocoled_model(options)
    end
    
    def acts_as_protocoled_model(options = {})
      puts "!!!!!!"
      puts options
      puts "!!!!!!"
      include ActsAsProtocoled::InstanceMethods
      
      unless options.has_key?(:only)
        after_create :protocol_on_create
        after_update :protocol_on_update        
        after_destroy :protocol_on_destroy
      else
        options[:only].each do |action|
          class_eval("after_#{action.to_s} :protocol_on_#{action.to_s}")
        end
      end
    end
  end
  
  module InstanceMethods
    protected
    def protocol_on_create
      ActsAsProtocoled::Base.create(
        :affected_object_type => self.class.to_s,
        :affected_object_id => self.id,
        :action_type => "CREATE",
        :internal_user_id => ActsAsProtocoled.internal_user_id
      )
    end
    
    def protocol_on_update
      ActsAsProtocoled::Base.create(
        :affected_object_type => self.class.to_s,
        :affected_object_id => self.id,
        :action_type => "UPDATE",
        :internal_user_id => ActsAsProtocoled.internal_user_id
      )
    end
    
    def protocol_on_destroy
      ActsAsProtocoled::Base.create(
        :affected_object_type => self.class.to_s,
        :affected_object_id => self.id,
        :action_type => "DESTROY",
        :internal_user_id => ActsAsProtocoled.internal_user_id
      )
    end
  end
end

