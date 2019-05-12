# frozen_string_literal: true

class CreateResumes < ActiveRecord::Migration[5.2]
  def up
    create_table :resumes do |t|
      t.string :name
      t.string :role
      t.integer :contact_number
      t.string :email
      t.text :about
      t.timestamps
    end
  end
end
