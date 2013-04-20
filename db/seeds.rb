User.create! do |user|
  user.full_name = 'Soham Chowdhury'
  user.email = 'redacted.coder@gmail.com'
  user.password = '123456'
  user.confirmed_at = Time.now
end