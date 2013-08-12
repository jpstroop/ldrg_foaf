require 'uri'

class Foaf < ActiveRecord::Base

  validates :name, :work, :ident, :birthday, presence: true

  # validates :ident, 

  validates :work, allow_blank: true, format: {
    with: URI::regexp,
    message: 'must be a valid URI.'
  }

  validates :ident, uniqueness: true, format: {
    with: /\A[[a-z]]{1,}\z/,
    message: 'may only consist of lowercase letters and no spaces'
  }

  # Need a function that makes sure the value is a date. This doesn't work:
  # validates :birthday, allow_blank: true, format: {
  #   with: /\A\d{4}\z/,
  #   message: 'must be formatted as YYYY-MM-DD.'
  # }


end
