class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.integer :votecount, default: 0

      t.timestamps
    end
  end
end
