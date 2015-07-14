require_relative 'contact'

# TODO: Implement command line interaction
# This should be the only file where you use puts and gets

require 'csv'
# contacts = CSV.read('contacts.csv')

# puts contacts

# CSV.foreach('contacts.csv') do |row|
#   puts row.inspect
# end

# CSV.open('contacts.csv', 'ab' ) do |writer|
#     writer << ["helo",323]
# end

if ARGV.empty?
  puts "enter help for list of options"
end

#a = ARGV[0].downcase
case ARGV[0]
when "help"
  puts "Here is a list of available commands:,
    new  - Create a new contact,
    list - List all contacts,
    show - Show a contact,
    find - Find a contact"
when "new"
  puts "Enter the name of the new contact"
  name = STDIN.gets.chomp
  puts "Enter the email address"
  email = STDIN.gets.chomp
  new_contact = Contact.new(name, email)
  Contact.add_new_contact(new_contact)
when "list"
  puts "the user chose the list option"
when "show"
  if ARGV[1] == nil
    print "there must be an index value "
  else
    CSV.foreach('contacts.csv') do |row|
      if row[0] == ARGV[1]
        puts "#{row[0]} #{row[1]} #{row[2]}"
      end
    end
  end
when "find"
  puts "the user chose the find option"
  #puts CSV.read('contacts.csv')
else
  puts "other statement"
end
