class Program < ApplicationRecord
  include PgSearch
  pg_search_scope :search,
    against: [:title, :description],
    using: {
      tsearch: { dictionary: "english" }
    }

  acts_as_taggable
end
