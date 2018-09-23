class Program < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title, :description]
end
