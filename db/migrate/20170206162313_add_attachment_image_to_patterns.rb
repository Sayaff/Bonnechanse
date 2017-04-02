class AddAttachmentImageToPatterns < ActiveRecord::Migration
  def self.up
    change_table :patterns do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :patterns, :image
  end
end
