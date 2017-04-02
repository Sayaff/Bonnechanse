class AddAttachmentImageToFabrics < ActiveRecord::Migration
  def self.up
    change_table :fabrics do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :fabrics, :image
  end
end
