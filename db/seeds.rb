def create_user(email)
  User.where(email: email).first_or_create(
    name: Faker::Name.name,
    age: rand(18..99),
    phone: Faker::PhoneNumber.phone_number
  )
end

def create_post(user)
  Post.create(
    user: user,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    tags: [Faker::Lorem.word, Faker::Lorem.word, Faker::Lorem.word]
  )
end

def create_comment(user, post)
  Comment.create(
    user: user,
    post: post,
    body: Faker::Lorem.paragraph
  )
end

def create_like(user, post)
  Like.where(
    user: user,
    post: post
  ).first_or_create(is_like: [true, false].sample)
end

12..20.times do |i|
  us = create_user(Faker::Internet.email)
  2..3.times do |j|
    ps = create_post(us)
    5..7.times do |k|
      co = create_comment(us, ps)
      lk = create_like(us, ps)
    end
  end
end