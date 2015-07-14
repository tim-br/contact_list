## TODO: Implement CSV reading/writing
#this is the adapter
require 'csv'
require_relative 'contact'
require 'pg'

class ContactDatabase

  def self.connection
    return conn = PG.connect(
    host: 'localhost',
    dbname: 'contacts',
    user: 'development',
    password: 'development'
    )
  end

  def self.add_new_contact(contact)
    conn = ContactDatabase.connection
    conn.prepare('statement1', 'insert into people (id, name) values ($1, $2)')
    conn.exec_prepared('statement1', [ id, name ])
  end
end

#Contact_Database.add_new_contact(Contact.new("yo", "t.@gmail.com"))

ContactDatabase.add_new_contact
puts "added new contact, hopefully"
