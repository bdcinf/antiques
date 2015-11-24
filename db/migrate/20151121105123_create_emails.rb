class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.string :name
    	t.string :mail
    	t.string :phone
    	t.attachment :image_file
    	t.string :subject
    	t.text :message
      t.timestamps
    end
  end
end
