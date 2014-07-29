class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.string :details
      t.text :words
      t.text :shloka
      t.timestamps
    end
  end
end
