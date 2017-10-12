class AddAttachmentImageToStrands < ActiveRecord::Migration
  def self.up
    change_table :strands do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :strands, :image
  end
end
