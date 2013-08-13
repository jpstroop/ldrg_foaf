require 'uri'

class Foaf < ActiveRecord::Base
  has_and_belongs_to_many :interests, autosave: false
  accepts_nested_attributes_for :interests

  validates :name, :work, :slug, :birthday, presence: true

  # validates :slug, 

  validates :work, allow_blank: true, format: {
    with: URI::regexp,
    message: 'must be a valid URI.'
  }

  validates :slug, uniqueness: true, format: {
    with: /\A[[a-z]]{1,}\z/,
    message: 'may only consist of lowercase letters and no spaces'
  }

end
