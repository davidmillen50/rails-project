require 'yaml'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding database..."

Subject.create!([
  {
    title: "Conversation",
    description: "This lesson is how to speak to other people.  This includes how to greet people (colloquially and formally), conversation starters."
  },
  {
    title: "Grammar",
    description: "This lesson relates to the rules that govern the English language."
  },
  {
    title: "Syntax",
    description: "This lesson relates to structuring sentences."
  },
  {
    title: "Semantics",
    description: "This lesson relates to the meaning of words and phrases."
  }
])

subjects = Subject.all.index_by { |s| s.title.downcase }

GrammarRule.create!([
  {
    title: "Verbs",
    description: "Verbs are words which denote action or movement and change based on when the action is, was or will be performed and who it is performed by.",
    subject: subjects["grammar"]
  },
  {
    title: "Tenses",
    description: "Verbs conjugate in different ways according to when the action is performed and the tense denotes when the action takes place.",
    subject: subjects["grammar"]
  },
  {
    title: "Person",
    description: "Person relates to who is writing, being written about or who is performing an action and whether they are are a single person or group of people.",
    subject: subjects["grammar"]
  },
  {
    title: "Nouns",
    description: "Nouns are words which relate to objects or abstract concepts.  Nouns are split into proper nouns (they have a capitalised first letter e.g. United Kingdom or a name like David.  Common nouns are not capitalised and are for general things like table or chair.",
    subject: subjects["grammar"]
  },
  {
    title: "Prepositions",
    description: "Prepositions are relational words which denote location or relation to actions or other objects.",
    subject: subjects["grammar"]
  },
  {
    title: "Adjectives",
    description: "Simply put, adjectives describe nouns.",
    subject: subjects["grammar"]
  },
  {
    title: "Adverbs",
    description: "Adverbs are words which describe verbs, i.e. they describe how an action is being performed",
    subject: subjects["grammar"]
  },
  {
    title: "Articles",
    description: "Articles are words which denote specificity of a noun.",
    subject: subjects["grammar"]
  },
  {
    title: "Quantity",
    description: "There can be only two quantities in grammar: singular and plural.",
    subject: subjects["grammar"]
  },
  {
    title: "Cases",
    description: "Cases relate to nouns and pronouns and the way they relate to other words in a sentence.",
    subject: subjects["grammar"]
  },
  {
    title: "Moods",
    description: "Moods are ways of structuring phrases or sentences to create a certain feeling or mood of the sentence.",
    subject: subjects["grammar"]
  },
  {
    title: "Interrogative",
    description: "Interrogative relates to words which are used when asking questions.",
    subject: subjects["grammar"]
  }
])

Lesson.create!([
  {
    title: "Greetings",
    body: "This lesson is how to greet other people in English.",
    subject: subjects["conversation"]
  },
  {
    title: "Questions",
    body: "This lesson addresses how to ask questions.",
    subject: subjects["conversation"]
  },
  {
    title: "Making a statement",
    body: "This lesson addresses how to ask questions.",
    subject: subjects["conversation"]
  },
  {
    title: "Grammar Lesson 1",
    body: "Verbs and Adverbs",
    subject: subjects["grammar"]
  },
  {
    title: "Grammar Lesson 2",
    body: "Nouns, Articles and Adjectives",
    subject: subjects["grammar"]
  },
  {
    title: "Grammar Lesson 3",
    body: "Person, Tenses and Quantity",
    subject: subjects["grammar"]
  },
  {
    title: "Grammar Lesson 4",
    body: "Cases",
    subject: subjects["grammar"]
  },
  {
    title: "Grammar Lesson 5",
    body: "Prepositions",
    subject: subjects["grammar"]
  },
  {
    title: "Grammar Lesson 6",
    body: "Moods",
    subject: subjects["grammar"]
  }
])

lessons = Lesson.all.index_by { |s| s.title.downcase }
grammar_rules = GrammarRule.all.index_by { |g| g.title.downcase }

LessonGrammarRule.create!([
  { lesson: lessons['greetings'], grammar_rule: grammar_rules['interrogative'] },
  { lesson: lessons['questions'], grammar_rule: grammar_rules['interrogative'] },
  { lesson: lessons['making a statement'], grammar_rule: grammar_rules['verbs'] },
  { lesson: lessons['making a statement'], grammar_rule: grammar_rules['cases'] },
  { lesson: lessons['making a statement'], grammar_rule: grammar_rules['person'] },
  { lesson: lessons['making a statement'], grammar_rule: grammar_rules['quantity'] },
  { lesson: lessons['making a statement'], grammar_rule: grammar_rules['moods'] },
  { lesson: lessons['grammar lesson 1'], grammar_rule: grammar_rules['verbs'] },
  { lesson: lessons['grammar lesson 1'], grammar_rule: grammar_rules['adverbs'] },
  { lesson: lessons['grammar lesson 1'], grammar_rule: grammar_rules['person'] },
  { lesson: lessons['grammar lesson 1'], grammar_rule: grammar_rules['quantity'] },
  { lesson: lessons['grammar lesson 2'], grammar_rule: grammar_rules['nouns'] },
  { lesson: lessons['grammar lesson 2'], grammar_rule: grammar_rules['articles'] },
  { lesson: lessons['grammar lesson 2'], grammar_rule: grammar_rules['adjectives'] },
  { lesson: lessons['grammar lesson 2'], grammar_rule: grammar_rules['quantity'] },
  { lesson: lessons['grammar lesson 2'], grammar_rule: grammar_rules['cases'] },
  { lesson: lessons['grammar lesson 3'], grammar_rule: grammar_rules['person'] },
  { lesson: lessons['grammar lesson 3'], grammar_rule: grammar_rules['tenses'] },
  { lesson: lessons['grammar lesson 3'], grammar_rule: grammar_rules['quantity'] },
  { lesson: lessons['grammar lesson 4'], grammar_rule: grammar_rules['cases'] },
  { lesson: lessons['grammar lesson 5'], grammar_rule: grammar_rules['prepositions'] },
  { lesson: lessons['grammar lesson 5'], grammar_rule: grammar_rules['cases'] },
  { lesson: lessons['grammar lesson 5'], grammar_rule: grammar_rules['nouns'] },
  { lesson: lessons['grammar lesson 5'], grammar_rule: grammar_rules['articles'] },
  { lesson: lessons['grammar lesson 6'], grammar_rule: grammar_rules['moods'] },
  { lesson: lessons['grammar lesson 6'], grammar_rule: grammar_rules['verbs'] },
  { lesson: lessons['grammar lesson 6'], grammar_rule: grammar_rules['person'] },
  { lesson: lessons['grammar lesson 6'], grammar_rule: grammar_rules['quantity'] }
])

puts "SeedingDone!"
