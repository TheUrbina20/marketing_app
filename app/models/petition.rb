# frozen_string_literal: true

class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :responsable, class_name: 'Coworker', foreign_key: 'coworker_id'
  belongs_to :post
  enum status: %i[active unaproved aproved]
  validates :message, presence: true
  validates :status, presence: true
end
