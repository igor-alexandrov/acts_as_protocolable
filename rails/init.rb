if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend(ActsAsProtocolable::ClassMethods)
end