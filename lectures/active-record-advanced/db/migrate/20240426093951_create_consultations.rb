class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.date :date
      t.references :patient, foreign_key: true
      t.references :doctor, foreign_key: true
      t.timestamps
    end
  end
end
