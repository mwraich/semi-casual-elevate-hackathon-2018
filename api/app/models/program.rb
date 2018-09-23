class Program < ApplicationRecord
  include PgSearch
  pg_search_scope :search,
    against: [:title, :description],
    using: { tsearch: { dictionary: "english" } }

  pg_search_scope :search_location,
    against: [:branch_name],
    using: { tsearch: { dictionary: "english" } }

  acts_as_taggable
end
