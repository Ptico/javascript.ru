class CreateQuestionsSpecialitiesJoinTable < ActiveRecord::Migration
  def change
    create_table :questions_specialities, id: false do |t|
      t.belongs_to :question,   index: true
      t.belongs_to :speciality, index: true
    end
  end
end
