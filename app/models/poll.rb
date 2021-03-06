class Poll < ActiveRecord::Base

  has_many :options

  # took this code from mae and sebatians code
  accepts_nested_attributes_for :options, allow_destroy: true,
                                reject_if: lambda { |option| option['answer'].blank? }
  validates :owner, presence: true
  validates :question, presence: true

  def old
    self.created_at + (7*24*60*60) < DateTime.now
  end
end
