# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserHabit.destroy_all
Encouragement.destroy_all
HabitLog.destroy_all
Friendship.destroy_all
User.destroy_all
Habit.destroy_all

UserHabit.reset_pk_sequence
HabitLog.reset_pk_sequence
Friendship.reset_pk_sequence
User.reset_pk_sequence
Encouragement.reset_pk_sequence
Habit.reset_pk_sequence


user1 = User.create(name: "Seth", username: "MelSwell", email: "s@s.com", password: "abc123", image_url: Faker::Avatar.image) 
user2 = User.create(name: "Henry", username: "HankPVel", email: "h@h.com", password: "abc123", image_url: Faker::Avatar.image) 
user3 = User.create(name: "Tess", username: "Tess15", email: "t@t.com", password: "abc123", image_url: Faker::Avatar.image) 
user4 = User.create(name: "Tim", username: "DiceyFitz", email: "tim@t.com", password: "abc123", image_url: Faker::Avatar.image) 
user5 = User.create(name: "Greg", username: "DWire", email: "g@g.com", password: "abc123", image_url: Faker::Avatar.image) 

100.times do
  User.create(name: Faker::Name.name, username: Faker::Internet.unique.username, email: Faker::Internet.unique.safe_email, password: "abc123", image_url: Faker::Avatar.unique.image)
end


hab1= Habit.create(name: "Smoking", category: "general health" )
hab2= Habit.create(name: "Nail Biting", category: "general health" )
hab3= Habit.create(name: "Binge Eating", category: "general health" )
hab4= Habit.create(name: "Binge Shopping", category: "financial health" )
hab5= Habit.create(name: "Sleeping Late", category: "general health" )
hab6= Habit.create(name: "Name Calling", category: "general health" )
hab7= Habit.create(name: "Farting in Public", category: "social health" )
hab8= Habit.create(name: "Holding in Poops Until Last Minute", category: "general health" )
hab9= Habit.create(name: "Negative Self Talk", category: "mental health" )
hab10= Habit.create(name: "Not Drinking Water", category: "general health" )
hab11= Habit.create(name: "Laying in Bed Past Alarm", category: "mental health" )
hab12= Habit.create(name: "Punching Walls", category: "mental health" )
hab13= Habit.create(name: "Being Late to Work", category: "career health" )
hab14= Habit.create(name: "Interrupting People", category: "social health" )
hab15= Habit.create(name: "Pulling Eyebrow Hairs", category: "mental health" )
hab16= Habit.create(name: "Eating Rocks", category: "mental health" )
hab17= Habit.create(name: "Saying Dude too Much in the Workplace", category: "career health" )
hab18= Habit.create(name: "Doing Things for People and Expecting Something in Return" , category: "social health" )
hab19= Habit.create(name: "Giving Advice When Not Warranted" , category: "Social health" )
hab20= Habit.create(name: "Humble Bragging", category: "social Health" )

200.times do
  UserHabit.create(user_id: User.all.sample.id, habit_id: Habit.all.sample.id, daily_goal: Faker::Lorem.sentence(word_count: 5), target_days: (21..99).to_a.sample, active: true)
end

moods = ["Happy", "Sad", "Joyous", "Excited", "Downtrodden", "Depressed", "Discouraged", "Lighthearted", "Encouraged", "Hopeful", "Fantastic", "Lit"]
boolean = [true, false]


200.times do
  HabitLog.create(user_habit_id: UserHabit.all.sample.id, mood: moods.sample, entry: Faker::Lorem.paragraph(sentence_count: 4), daily_goal_reached: boolean.sample )
end

300.times do  
  Friendship.create(follower_id: User.all.sample.id, followee_id: User.all.sample.id)
end

500.times do 
  Encouragement.create(user_id: User.all.sample.id, habit_log_id: HabitLog.all.sample.id, comment: Faker::Lorem.paragraph(sentence_count: 3))
end
