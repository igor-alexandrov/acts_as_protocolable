require 'rubygems'
require 'active_record'
require 'sys/admin'

class ActsAsProtocolable::Base < ActiveRecord::Base
  set_table_name 'protocol'
  
  #All attributes of Protocol should be read-only
  attr_readonly :created_at,
                :affected_object_type,
                :affected_object_id,
                :action_type,
                :internal_user_id,
                :system_user_login,
                :is_console_action
  
  attr_accessible :affected_object_type,
                  :affected_object_id,
                  :action_type,
                  :internal_user_id
                  
  
  def after_initialize 
    return unless new_record?
    self.is_console_action = self.called_from_console?
    self.system_user_login = self.get_system_user_login
  end
  
  protected
  def called_from_console?
    (defined? IRB) ? true : false
  end
  
  def get_system_user_login
    Sys::Admin.get_login
  end
end