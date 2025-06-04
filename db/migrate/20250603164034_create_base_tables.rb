class CreateBaseTables < ActiveRecord::Migration[8.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description
      t.text :example_one
      t.text :example_two
      t.text :example_three
      t.text :example_four
      t.text :example_five
      t.text :example_six
      t.text :example_seven

      t.timestamps
    end

    create_table :grammar_rules do |t|
      t.string :title
      t.text :description
      t.text :example_one
      t.text :example_two
      t.text :example_three
      t.references :subject, foreign_key: true

      t.timestamps
    end

    create_table :lessons do |t|
      t.string :title
      t.text :body
      t.references :subject, foreign_key: true
      t.text :section_one
      t.text :example_one
      t.text :section_two
      t.text :example_two
      t.text :section_three
      t.text :example_three
      t.text :section_four
      t.text :example_four
      t.text :section_five
      t.text :example_five
      t.text :section_six
      t.text :example_six
      t.text :section_seven
      t.text :example_seven
      t.text :section_eight
      t.text :example_eight
      t.text :section_nine
      t.text :example_nine
      t.text :section_ten
      t.text :example_ten

      t.timestamps
    end

    create_table :lesson_grammar_rules do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :grammar_rule, null: false, foreign_key: true
      t.timestamps
    end
  end
end
