class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text   :description, default: ''

      t.timestamps
    end
  end
end
