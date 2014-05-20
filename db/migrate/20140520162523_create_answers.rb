class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text       :body
      t.boolean    :right,    default: false
      t.belongs_to :question, index: true
    end
  end
end
