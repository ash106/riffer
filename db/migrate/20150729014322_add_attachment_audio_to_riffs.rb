class AddAttachmentAudioToRiffs < ActiveRecord::Migration
  def self.up
    change_table :riffs do |t|
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :riffs, :audio
  end
end
