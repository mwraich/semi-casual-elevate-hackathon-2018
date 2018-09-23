class Program < ApplicationRecord

  acts_as_taggable

  include PgSearch
  pg_search_scope :search,
    against: [:title, :description],
    using: {
      tsearch: { dictionary: "english" }
    }
end
