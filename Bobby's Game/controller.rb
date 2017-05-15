require_relative 'view'
require_relative 'model'

class ContactController
  include ContactListView

  def run!
    contact_list = ContactList.new
    Print.title
    loop do
      Print.menu
      case Print.fetch_user_input.upcase
      when 'V'
        Print.print_contacts(contact_list.contacts)
      when 'A'
        contact_list.add_contact(Print.serialize_contact)
      when 'D'
        contact_list.delete_contact(Print.deleted_id.to_i)
      when 'Q'
        puts 'Goodbye'
        exit
      else
        Print.error_message
      end
    end
  end
end

ContactController.new.run!
