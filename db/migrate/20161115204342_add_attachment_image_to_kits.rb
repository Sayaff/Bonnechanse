class AddAttachmentImageToKits < ActiveRecord::Migration
  def self.up
    change_table :kits do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :kits, :image
  end
end
