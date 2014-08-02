class AddSummaryColumn < ActiveRecord::Migration
  def change
    change_table :synonyms do |t|
      t.string :summary
    end
  end
end
