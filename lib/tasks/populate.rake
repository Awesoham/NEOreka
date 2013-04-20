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

    puts "#{RED}Starting populate task.#{RESET}"

    puts "There will be #{BLUE}#{users}#{RESET} users, #{BLUE}#{neos}#{RESET} NEOs and #{BLUE}#{votes}#{RESET} votes."

    User.attr_accessible :full_name
    User.create!(full_name: "Foo Bar",
                 email: "coder.soham@gmail.com",
                 password: "foobar")

    ##############################################################################################################################

    print "#{BLUE}Creating dummy users...#{RESET} \r"

    users.times do |n|
      print "#{BLUE}Creating dummy users...#{RED} #{strip_decimals(n*100.0/users).to_s.rjust(5)}% #{RESET}\r"
      name  = Faker::Name.name
      email = "example-#{n+1}@foobar.org"
      password  = "password"
      User.create!(full_name:     name,
                   email:    email,
                   password: password)
    end
    puts "#{BLUE}Creating dummy users...#{RED} done.#{RESET}  "

    ##############################################################################################################################

    print "#{BLUE}Creating dummy NEOs, please wait...#{RESET} \r"

    neos.times do |n|
      print "#{BLUE}Creating dummy NEOs, please wait...#{RED} #{strip_decimals(n*100.0/neos).to_s.rjust(5)}% #{RESET}\r"
      name  = Faker::Name.last_name
      num = rand(1..10000)

      Neo.create!(name: "#{name} #{num}",
                   user: User.find(rand(1..users)),
                   magnitude: rand(-25..30),
                   notes: Faker::Lorem.sentence(10),
                   score: rand(0..100))
    end
    puts "#{BLUE}Creating dummy NEOs, please wait...#{RED} done.#{RESET}  "

    ##############################################################################################################################

    print "#{BLUE}Creating sample observations, one moment...#{RESET} \r"

    (neos*10).times do |n|
      print "#{BLUE}Creating sample observations, one moment...#{RED} #{strip_decimals(n*10/neos).to_s.rjust(5)}% #{RESET}\r"

      Observation.create!(neo: Neo.find(rand(1..neos)),
                    user: User.find(rand(1..users)),
                    ra: rand(0..86400),
                    dec: rand(-324000..324000))
    end
    puts "#{BLUE}Creating sample observations, one moment...#{RED} done.#{RESET}  "

    ##############################################################################################################################

    print "#{BLUE}Adding random votes...#{RESET} \r"

    users.times do |n|
      print "#{BLUE}Adding random votes...#{RED} #{strip_decimals(10*n/users).to_s.rjust(5)}% #{RESET}\r"
      user = User.find(n+1)
      (1..((users/20.0).to_i-1)).to_a.sample(users+1).each do |x|
        user.vote_for(Neo.find(x+1))
      end  
      ((users/20.0).to_i..users/10).to_a.sample(users+1).each do |x|
        user.vote_against(Neo.find(x+1))
      end 
    end  
    puts "#{BLUE}Adding random votes...#{RED} done.#{RESET}  "

    ##############################################################################################################################

    puts "Done! Go, code and make the world an awesomer place."

    task n.to_s.to_sym do ; end
  end
end