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
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development? && AdminUser.count < 1

p 'All done! 🎉'
