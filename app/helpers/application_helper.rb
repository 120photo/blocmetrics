module ApplicationHelper

  def hacker_error
    return "Error : '#{Faker::Hacker.say_something_smart.capitalize}'"
  end
end
