require 'Faker'

class Contact
  attr_accessor :id, :first_name, :last_name, :phone_number, :email

  def initialize(args)
    @id = args[:id]
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @phone_number = args[:phone_number]
    @email = args[:email]
  end
end

class ContactList
  attr_accessor :contacts

  def initialize
    @primary_id = 0
    @contacts = []
    populate_dummy_contacts
  end

  def add_contact(input)
    @contacts << Contact.new(input.merge(fetch_id))
  end

  def delete_contact(id)
    @contacts.delete_if { |n| n.id == id }
  end

  def populate_dummy_contacts
    5.times do
      add_contact(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email)
    end
  end

  private

  def fetch_id
    { id: @primary_id += 1 }
  end
end
