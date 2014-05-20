class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.text :explanation, default: ''
      t.belongs_to :quiz,  index: true
    end
  end
end
