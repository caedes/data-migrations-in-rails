class User < ActiveRecord::Base
  include ActAsTimeAsBoolean

  time_as_boolean :filled, opposite: :unfilled
end
