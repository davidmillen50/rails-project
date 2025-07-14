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
    subject: subjects["grammar"],
    example_one: "I am going to the cinema today.",
    example_one_explanation: "'Going' is the present tense of the verb 'to go' and relates to travelling to the cinema.",
    example_two: "I went to the cinema yesterday.",
    example_two_explanation: "'Went' is the past tense of the verb 'to go' and relates to travelling to the cinema yesterday.",
    example_three: "I will go to the cinema tomorrow.",
    example_three_explanation: "'Will go' is the future tense of the verb 'to go' and indicates that I will travel to the cinema tomorrow."
  },
  {
    title: "Tenses",
    description: "Verbs conjugate in different ways according to when the action is performed and by whom.  The tense denotes when the action takes place.",
    subject: subjects["grammar"],
    example_one: "Present tense: I am going, you (singular) are going, he/she/it is going, we are going, you (plural) are going, they are going.",
    example_one_explanation: "The present tense denotes actions that are happening now.",
    example_two: "Past tense: I went, you (singular) went, he/she/it went, we went, you (plural) went, they went.",
    example_two_explanation: "The past tense denotes actions that occured before the present time.",
    example_three: "Future tense: I will go, you (singular) will go, he/she/it will go, we will go, you (plural) will go, they will go.",
    example_three_explanation: "The future tense denotes actions that will occur in the future (after the present time)."
  },
  {
    title: "Person",
    description: "Person relates to who is writing, being written about or who is performing an action and whether they are are a single person or group of people.",
    subject: subjects["grammar"],
    example_one: "I, You, He/She/It, We, You (plural) and They",
    example_one_explanation: "'I' is the first person singular pronoun. 'You' is the second person singular pronoun. 'He' is the third person singular masculine pronoun. 'She' is the third person singular feminine pronoun. 'It' is the third person singular pronoun relating to something that is not 'he' or 'she' for example inanimate objects.  'We' is the first person plural pronoun.  'You' is also the second person plural pronoun (used when addressing multiple people).  'They' is the third person plural pronoun.",
    example_two: "Me, You, Him/Her/It, Us, You (plural) and Them",
    example_two_explanation: "These are the accusative pronouns used when a person is the object of a sentence.  For example, 'I (nominative case / subject of the sentence) saw her (accusative/objective case / object of the sentence) yesterday.'",
    example_three: "My, Your (singular), His/Her/Its, Our, Your (plural) and Their",
    example_three_explanation: "These are possessive (genitive) pronouns which indicate ownership.  For example, 'This is my hat'"
  },
  {
    title: "Adverbs",
    description: "Adverbs are words which describe verbs, i.e. they describe how an action is being performed.  Most of the time they end in '-ly' for example 'quickly, quietly, slowly'.",
    subject: subjects["grammar"],
    example_one: "He laughed quietly.",
    example_one_explanation: "'Quietly' is an adverb because it describes how the action of laughing is performed.",
    example_two: "The dog walked slowly.",
    example_two_explanation: "The adverb 'Slowly' describes how the dog walked."
  },
  {
    title: "Nouns",
    description: "Nouns are words which relate to objects or abstract concepts.  Nouns are split into proper nouns (they have a capitalised first letter e.g. United Kingdom or a person's name like John).  Common nouns are not capitalised and are for general things like table or chair.",
    subject: subjects["grammar"],
    example_one: "Proper Nouns: France, Paris, Penelope, Archibald, Downing Street.",
    example_one_explanation: "Proper nouns are capitalised and refer to specific people, places or things.",
    example_two: "Common Nouns: desk, chair, house, dog, cat, love.",
    example_two_explanation: "Common nouns are not capitalised and refer to general objects or concepts"
  },
  {
    title: "Prepositions",
    description: "Prepositions are relational words which denote location or relation to actions or other objects.",
    subject: subjects["grammar"],
    example_one: "I sat on (preposition) the chair.",
    example_one_explanation: "'On' is a preposition which relates to the location of the chair relative to my act of sitting.",
    example_two: "We met at (preposition) the cinema.",
    example_two_explanation: "'At' is a preposition which indicates where the act of meeting took place.",
    example_three: "Other prepositions include: in, on, at, by, with, for, to, from, about, against, between, among, during, without.",
    example_three_explanation: "These prepositions denote the location, time, direction and other relationships between two objects."
  },
  {
    title: "Nouns, Articles and Adjectives",
    description: "Articles are words which denote specificity of a noun.  Adjectives are words which describe nouns.",
    subject: subjects["grammar"],
    example_one: "The (definite article) dog (common noun) is brown (adjective).",
    example_one_explanation: "'The' is a definite article which indicates a specific dog (as opposed to 'a dog'). 'Brown' is an adjective which describes the colour of the dog.",
    example_two: "A (article) cat (noun) is black (adjective).",
    example_two_explanation: "'A' is an indefinite article which indicates any cat. 'Black' is an adjective which describes the colour of the cat."
  },
  {
    title: "Adjectives",
    description: "Simply put, adjectives describe nouns.",
    subject: subjects["grammar"],
    example_one: "The large truck zoomed down the dark road.",
    example_one_explanation: "'Large' and 'dark' are adjectives which describe the truck and the road"
  },
  {
    title: "Articles",
    description: "Articles are words which denote specificity of a noun.",
    example_one: "The rabbit jumped out of the tall grass.",
    example_one_explanation: "'The' is the definite article which indicates a specific rabbit.  Possibly the rabbit was previously described in the conversation or in the text.",
    example_two: "A rabbit jumped out of the tall grass.",
    example_two_explanation: "'A' is the indefinite article which suggests a previously unmentioned (in the conversation or text) rabbit lept out of the tall grass.",
    subject: subjects["grammar"]
  },
  {
    title: "Quantity",
    description: "There can be only two quantities in grammar: singular and plural.",
    subject: subjects["grammar"],
    example_one: "The cat chased a piece of string.",
    example_one_explanation: "'Cat' is a singular noun because there is only one cat. 'A piece of string' is also singular because it refers to one piece of string.",
    example_two: "The cats chased two pieces of string.",
    example_two_explanation: "'Cats' and 'pieces of string' are plural because there are multiple cats and multiple pieces of string.  When conjugating the relevant verbs in a sentence you must ensure that the verb denotes the correct quantity.  For example, 'the cat leaps over the fence' (singular) compared to 'the cats leap over the fence' (plural).  The quantity of something also determines the pronouns used.  For example 'I saw him yesterday' (singular) compared to 'I saw them yesterday' (plural)."
  },
  {
    title: "Cases",
    description: "Cases relate to nouns and pronouns and the way they relate to other words in a sentence.",
    subject: subjects["grammar"],
    example_one: "I (nominative) saw him (accusative) yesterday with his (genitive) briefcase.",
    example_one_explanation: "Nomintive case is used for the subject, accusative for the object, dative for the indirect object and genitive for possession.",
    example_two: "He (nominativ/subject) gave her (dative/indirect object) a present (accusative/object) for her (genitive) birthday."
  },
  {
    title: "Moods",
    description: "Moods are ways of structuring phrases or sentences to create a certain feeling or mood of the sentence.",
    subject: subjects["grammar"],
    example_one: "Indicative mood: The dog bit me.",
    example_one_explanation: "The indicative mood is used to make statements of fact or ask questions.",
    example_two: "Passive mood: I was bitten by the dog.",
    example_two_explanation: "The passive mood is where the subject and object are switched around.  The passive mood focuses on the action rather than who performed the action",
    example_three: "Subjunctive mood: If I had a million dollars, I would buy an expensive car.",
    example_three_explanation: "The subjunctive mood gives an indication of a hypothetical situation or one of imagination or wonder.",
    example_four: "Imperative mood: Go to your room!",
    example_four_explanation: "The imperative mood is used when giving commands."
  },
  {
    title: "Interrogative",
    description: "Interrogative words are those which are used when asking questions.",
    subject: subjects["grammar"],
    example_one: "Who, Where, When, What, Why, How",
    example_one_explanation: "These words each indicate a question is being asked and a question mark (?) should be used at the end of the question.  'Who' relates to a person as in 'Who took the chocolate?' - I am asking for the person who took the chocolate.  'Where' relates to a location or place as in 'Where was the chocolate stored?' I am asking for the place the chocolate was stored.  'When' relates to time as in 'When was the chocolate last seen?' - I am asking for the time/day the chocolate was last seen.  'What' relates to an object as in 'What was the chocolate stored in?' - here I am looking to find out in what object the chocolate was stored.  'Why' relates to asking for a reason behind something for example 'Why was the chocolate stolen?' - here I am asking for the reason behind the stealing of the chocolate.  'How' relates to the way in which an action took place for example, 'How was the chocolate stolen?' - here I am asking for the way in which the chocolate was stolen."
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
