class CreateImapDbs < ActiveRecord::Migration
  def change
    create_table :imap_dbs do |t|
      t.string :ip
      t.integer :flag

      t.timestamps
    end
  end
end
