class SessionsView
  def ask_user_for(stuff)
    puts "What's the #{stuff}"
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong credentials. Try again!"
  end
end