class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  module ApplicationRecord
    def to_username(string)
      string.parameterize.truncate(80, omission: '')
    end
  end
end
