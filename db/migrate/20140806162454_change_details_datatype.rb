class ChangeDetailsDatatype < ActiveRecord::Migration
  def change
    change_table :synonyms do |t|
      t.change :details, :text
    end
  end
end
