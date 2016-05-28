class AddTypeToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :message_type, :text, default: "text"
  end
end
