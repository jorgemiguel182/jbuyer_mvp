class AddAttachmentFotoToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :pictures, :foto
  end
end
