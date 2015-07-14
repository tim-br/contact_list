require 'pg'

class Contact

  attr_accessor :name, :email
  attr_reader :num_contacts, :id

  def initialize(name, email, num_contacts = 0)
    @name = name
    @email = email
  end

  def save
    conn = Contact.connection
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
    conn.prepare('statement1', 'insert into people ( name, email) values ($1, $2)')
    conn.exec_prepared('statement1', [ contact.name, contact.email])
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
