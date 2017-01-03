class State < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.default
    find_by(default: true)
  end

  def make_default!
    State.update_all(default: false)
    update!(default: true)
  end

  def to_s
    name
  end
end