p 'Generating seeds...'

categories = %w[Лыжный Пеший Лыжно-пеший]
directions = [
  'Белорусское',
  'Казанское',
  'Киевское',
  'Курское Южное',
  'Курское Горьковское',
  'Ленинградское',
  'Павелецкое',
  'Рижское',
  'Савеловское',
  'Ярославское'
]

if Category.count < 1
  p 'Generating categories...'
  categories.each { |category| Category.create!(name: category) }
  p 'Categories generated!'
end

if Direction.count < 1
  p 'Generating directions...'
  directions.each { |direction| Direction.create!(name: direction) }
  p 'Directions generated!'
end

User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && User.count < 1

if Hike.count < 1
  p 'Generating hikes...'
  50.times do |i|
    Hike.create!(
      name: "Hike #{i + 1}",
      description: "description",
      distance: rand(1..10),
      # random date in last 3 weeks
      date: (DateTime.now - (rand * 21)).to_date,
      user: User.first,
      category: Category.all.sample,
      direction: Direction.all.sample,
    )
  end
  p 'Hikes generated!'
end

p 'All done! 🎉'
