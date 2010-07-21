class ActsAsProtocolableMigration < ActiveRecord::Migration
  def self.up
    create_table :protocol do |t|
      t.datetime  :created_at
      t.string    :affected_object_type
      t.integer   :affected_object_id
      t.string    :action_type
      t.integer   :internal_user_id
      t.string    :system_user_login
      t.boolean   :is_console_action

    end

    add_index :protocol, :affected_object_type
    add_index :protocol, :affected_object_id
    add_index :protocol, :action_type
    add_index :protocol, :internal_user_id
    add_index :protocol, :system_user_login
    add_index :protocol, :is_console_action
  end

  def self.down
    drop_table :protocol
  end
end