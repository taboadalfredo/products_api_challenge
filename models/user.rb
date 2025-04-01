# frozen_string_literal: true

class User
  def self.authenticate(username, password)
    USERS[username] == password
  end
end
