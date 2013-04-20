namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    n = ARGV.last.to_i || 100

    users = (n / 10) - 1
    neos = n - 1
    votes = (n*10 - 1)/10

    #Pretty colors
    BLUE = "\033[34m"
    RED = "\033[31m"
    GREEN = "\033[32m"
    RESET = "\033[0m"

    def strip_decimals(n)
        ((n*100).to_i)/100.0
    end

    puts "#{GREEN}Starting populate task.#{RESET}"

    puts "There will be #{BLUE}#{users}#{RESET} users, #{BLUE}#{neos}#{RESET} NEOs and #{BLUE}#{votes}#{RESET} votes."

    User.attr_accessible :full_name
    User.create!(full_name: "Foo Bar",
                 email: "coder.soham@gmail.com",
                 password: "foobar")

    print "#{RED}Creating dummy users...#{RESET} \r"

    users.times do |n|
      print "#{RED}Creating dummy users...#{BLUE} #{strip_decimals(n*100.0/users).to_s.rjust(5)}% #{RESET}\r"
      name  = Faker::Name.name
      email = "example-#{n+1}@foobar.org"
      password  = "password"
      User.create!(full_name:     name,
                   email:    email,
                   password: password)
    end
    puts "#{RED}Creating dummy users...#{GREEN} done.#{RESET}  "

    print "#{RED}Creating dummy NEOs, please wait...#{RESET} \r"

    neos.times do |n|
      print "#{RED}Creating dummy NEOs, please wait...#{BLUE} #{strip_decimals(n*100.0/neos).to_s.rjust(5)}% #{RESET}\r"
      name  = Faker::Name.last_name
      num = rand(1..10000)

      Neo.create!(name: "#{name} #{num}",
                   user_id: rand(1..100),
                   ra: rand(0..8640000)/100.0,
                   dec: rand(-32400000..32400000)/100.0,
                   magnitude: rand(-25..30),
                   notes: Faker::Lorem.sentence(10),
                   score: rand(0..100))
    end
    puts "#{RED}Creating dummy NEOs, please wait...#{GREEN} done.#{RESET}  "

    print "#{RED}Adding random votes...#{RESET} \r"

    users.times do |n|
      print "#{RED}Adding random votes...#{BLUE} #{strip_decimals((n*1000.0/users**2.0)/2).to_s.rjust(5)}% #{RESET}\r"
      user = User.find(n+1)
      (1..((users/20.0).to_i-1)).to_a.sample(users+1).each do |x|
        user.vote_for(Neo.find(x+1))
      end  
      ((users/20.0).to_i..users/10).to_a.sample(users+1).each do |x|
        user.vote_against(Neo.find(x+1))
      end 
    end  
    puts "#{RED}Adding random votes...#{GREEN} done.#{RESET}  "
    puts "Done! Go, code and make the world an awesomer place."

    task n.to_s.to_sym do ; end
  end
end