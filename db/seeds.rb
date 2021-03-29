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


user1 = User.create(name: "Seth", username: "MelSwell", email: "s@s.com", password: "abc123") 
user2 = User.create(name: "Henry", username: "HankPVel", email: "h@h.com", password: "abc123") 
user3 = User.create(name: "Tess", username: "Tess15", email: "t@t.com", password: "abc123") 
user4 = User.create(name: "Tim", username: "DiceyFitz", email: "tim@t.com", password: "abc123") 
user5 = User.create(name: "Greg", username: "DWire", email: "g@g.com", password: "abc123") 

20.times do
  User.create(name: Faker::Name.name, username: Faker::Internet.unique.username, email: Faker::Internet.unique.safe_email, password: "abc123")
end


hab1= Habit.create(name: "smoking", category: "general health" )
hab2= Habit.create(name: "nail biting", category: "general health" )
hab3= Habit.create(name: "binge eating", category: "general health" )
hab4= Habit.create(name: "binge shopping", category: "financial health" )
hab5= Habit.create(name: "sleeping late", category: "general health" )
hab6= Habit.create(name: "name calling", category: "general health" )
hab7= Habit.create(name: "farting in public", category: "social health" )
hab8= Habit.create(name: "holding in poops until last minute", category: "general health" )
hab9= Habit.create(name: "negative self talk", category: "mental health" )
hab10= Habit.create(name: "not drinking water", category: "general health" )
hab11= Habit.create(name: "laying in bed past alarm", category: "mental health" )
hab12= Habit.create(name: "punching walls", category: "mental health" )
hab13= Habit.create(name: "being late to work", category: "career health" )
hab14= Habit.create(name: "interrupting people", category: "social health" )
hab15= Habit.create(name: "pulling eyebrow hairs", category: "mental health" )
hab16= Habit.create(name: "eating rocks", category: "mental health" )
hab17= Habit.create(name: "saying dude too much in the workplace", category: "career health" )
hab18= Habit.create(name: "doing things for people and expecting something in return" , category: "social health" )
hab19= Habit.create(name: "giving advice when not warranted" , category: "social health" )
hab20= Habit.create(name: "humble bragging", category: "social health" )

50.times do
  UserHabit.create(user_id: User.all.sample.id, habit_id: Habit.all.sample.id, daily_goal: Faker::Lorem.sentence(word_count: 5), target_days: (21..99).to_a.sample, active: true)
end

moods = ["happy", "sad", "joyous", "excited", "downtrodden", "depressed", "discouraged", "lighthearted", "encouraged", "hopeful", "fantastic", "lit"]
boolean = [true, false]


100.times do
  HabitLog.create(user_habit_id: UserHabit.all.sample.id, mood: moods.sample, entry: Faker::Lorem.paragraph(sentence_count: 2), daily_goal_reached: boolean.sample )
end

Friendship.create(follower_id: User.first.id, followee_id: User.second.id)

25.times do 
  Encouragement.create(user_id: User.all.sample.id, habit_log_id: HabitLog.all.sample.id, comment: Faker::Lorem.paragraph(sentence_count: 2))
end
