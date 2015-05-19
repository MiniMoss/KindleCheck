class CreateDics < ActiveRecord::Migration
  def change
    create_table :dics do |t|
      t.string :word
      t.string :createdtime
      t.string :book
      t.string :author
      t.string :language
      t.string :usage
      t.string :translation
      t.string :basic_explains

      t.timestamps null: false
    end
  end
end
