class CreateImapSessions < ActiveRecord::Migration
  def change
    create_table :imap_sessions do |t|
      t.string :ip
      t.string :flag

      t.timestamps
    end
  end
end
