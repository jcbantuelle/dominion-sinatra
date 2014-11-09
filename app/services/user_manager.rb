class UserManager
  @@users = []

  class << self

    def flush_inactive_users
      @@users.reject!{ |user| user.inactive?(:lobby) }
    end

    def add_user(name)
      new_user = User.new(name)
      @@users << new_user
      new_user
    end

    def remove_user(user)
      @@users.reject!{ |u| u.name == user.name }
    end

    def user_exists?(name)
      !@@users.detect{ |user| user.name == name }.nil?
    end

  end
end
