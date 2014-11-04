class Tweet < ActiveRecord::Base
  validates :content, length: { maximum: 140 }
  # データの検証をしている
  belongs_to :user
end


