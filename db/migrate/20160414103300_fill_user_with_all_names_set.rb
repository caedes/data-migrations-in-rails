class FillUserWithAllNamesSet < ActiveRecord::Migration
  def change
    User.all.each do |user|
      user.filled! if user.first_name && user.last_name
    end
  end
end
