module ContactListView

  module Print
    class << self
      def error_message
        puts "That's not a command key. Try again!"
      end

      def title
title = <<TITLE

      ======================
      =    ADDRESS BOOK    =
      ======================
TITLE
        puts title
      end

      def menu
menu = <<MENU

      ====== Contacts ======
      - (V)iew your Contacts
      - (A)dd a Contact
      - (D)elete a Contact
      - (Q)uit Program
      ======          ======

MENU
        puts menu
      end

      def print_contacts(contacts)
        contacts.each do |contact|
          puts "#{contact.id}\n
          #{contact.first_name} #{contact.last_name}\n
          #{contact.phone_number}\n
          #{contact.email}"
        end
      end

      def serialize_contact
        {}.tap do |obj|
          [
            [:first_name, "\nEnter the first name:"],
            [:last_name, 'Enter the last name:'],
            [:email, 'Enter the email:'],
            [:phone_number, 'Enter the phone number:']
          ].each do |sym, ques|
            obj[sym] = fetch_user_input(ques)
          end
        end
      end

      def deleted_id
        fetch_id = "\nEnter the id of the contact item you want to delete."
        fetch_user_input(fetch_id)
      end

      def fetch_user_input(question = nil)
        puts question if question
        print '> '
        gets.chomp
      end
    end
  end
end
