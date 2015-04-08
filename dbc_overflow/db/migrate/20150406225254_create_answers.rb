class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.text :content
      t.string :answerer

      t.references :question, index: true

      t.timestamps
    end
  end
end
