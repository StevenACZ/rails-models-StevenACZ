class Critic < ApplicationRecord
  validates :title, :body, presence: { message: "can't be blank. Please write something!" }
end
