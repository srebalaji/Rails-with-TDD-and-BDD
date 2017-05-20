class Article < ApplicationRecord
	validates :title, :description, presence: true

	default_scope { order(created_at: :desc)}
end
