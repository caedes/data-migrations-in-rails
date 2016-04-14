namespace :adhoc do
  namespace :users do
    task fill_up: :environment do
      User.all.each do |user|
        user.filled! if user.first_name && user.last_name
      end
    end
  end
end
