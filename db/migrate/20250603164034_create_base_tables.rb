class CreateBaseTables < ActiveRecord::Migration[8.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    create_table :grammar_rules do |t|
      t.string :title
      t.text :description
      t.text :example_one
      t.text :example_one_explanation
      t.text :example_two
      t.text :example_two_explanation
      t.text :example_three
      t.text :example_three_explanation
      t.text :example_four
      t.text :example_four_explanation
      t.references :subject, foreign_key: true

      t.timestamps
    end

    create_table :lessons do |t|
      t.string :title
      t.text :body
      t.references :subject, foreign_key: true
      t.text :section_one
      t.text :example_one
      t.text :example_one_explanation
      t.text :section_two
      t.text :example_two
      t.text :example_two_explanation
      t.text :section_three
      t.text :example_three
      t.text :example_three_explanation
      t.text :section_four
      t.text :example_four
      t.text :example_four_explanation
      t.text :section_five
      t.text :example_five
      t.text :example_five_explanation
      t.text :section_six
      t.text :example_six
      t.text :example_six_explanation
      t.text :section_seven
      t.text :example_seven
      t.text :example_seven_explanation
      t.text :section_eight
      t.text :example_eight
      t.text :example_eight_explanation
      t.text :section_nine
      t.text :example_nine
      t.text :example_nine_explanation
      t.text :section_ten
      t.text :example_ten
      t.text :example_ten_explanation

      t.timestamps
    end

    create_table :lesson_grammar_rules do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :grammar_rule, null: false, foreign_key: true
      t.timestamps
    end
  end
end
