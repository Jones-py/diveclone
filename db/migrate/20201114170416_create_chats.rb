class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.text :post
    end
  end
end
