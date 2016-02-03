class Potluck
  attr_accessor :user

  def initialize
    @user = User.new
  end

  def no_user_api
    puts "1) I have an API key"
    puts "2) Create user"
    puts "3) Exit"
    print "> "
    while api_nil_option = gets.chomp.to_i
      case api_nil_option
      when 1
        print "Enter API key > "
        user.api = gets.chomp
        show_menu
      when 2
        user.get_email
        user.get_api_key
        show_menu
      when 3
        break
      else
        puts "Please select either 1, 2 or 3"
        print "> "
      end
    end
  end

  def has_user_api
    puts "1) See all Potluck items"
    puts "2) Add Item"
    puts "3) Exit"
    print "> "
    while api_option = gets.chomp.to_i
      case api_option
      when 1
        user.see_all_items
        show_menu
      when 2
        user.add_item
        show_menu
      when 3
        break
      else
        puts "Please select either 1, 2 or 3"
        print "> "
      end
    end
  end

  def show_menu
    puts "Select One:"
    if user.api == nil
      no_user_api
    else
      has_user_api
    end
  end

end
