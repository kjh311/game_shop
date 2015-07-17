class Game < ActiveRecord::Base
  def to_s
    "#{title} (#{platform})"
  end
end
