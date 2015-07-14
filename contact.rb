require 'pg'

class Contact

  attr_accessor :name, :email, :phone, :id
  attr_reader :num_contacts

  def initialize(name, email, num_contacts = 0)
    @name = name
    @email = email
    @phone
    @id
  end

  def save
    conn = Contact.connection
    conn.prepare('statement1', 'update people set name = $1, email = $2, phone = $3')
    conn.exec_prepared('statement1', [ self.name, self.email, self.phone])
    #conn.prepare('statement2', "SELECT lastval('p')"

  end

  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contact
      contact_object = Contact.new(name, email)
      Contact.add_new_contact(contact_object)
    end

    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end

    def all
      # TODO: Return the list of contacts, as is
    end

    def show(id)
      # TODO: Show a contact, based on ID
    end

  end

  def self.add_new_contact(contact)
    conn = Contact.connection
    conn.prepare('statement1', 'insert into people ( name, email) values ($1, $2) RETURNING ID')
    conn.exec_prepared('statement1', [ contact.name, contact.email]) do |results|
      puts results
      results.each do |person|
        contact.id = person['id']
        puts contact.id
        # foo =  person.inspect
        # puts "this is foo {person}"
        # puts "this is foo at id {person['id']}"
        # contact.id = foo["id"]
        # puts contact.id
        # puts "yo"
      end
    end
    # puts "********************************"

    # puts "this isntiesrtenas #{ret_value.values}"

  end

  def self.connection
    return conn = PG.connect(
    host: 'localhost',
    dbname: 'contacts',
    user: 'development',
    password: 'development'
    )
  end

end

contact = Contact.new("tim", "j.ntesr@teinw.ciom")
Contact.add_new_contact(contact);
# contact.email = "jeff@gmail.com"

# conn = Contact.connection

# conn.exec('SELECT * FROM people;') do |results|
#   results.each do |country|
#     puts country.inspect
#   end
# end

# contact.email = "jeff@gmail.com"


# contact.save

# conn.exec('SELECT * FROM people;') do |results|
#   results.each do |country|
#     puts country.inspect
#   end
# end
