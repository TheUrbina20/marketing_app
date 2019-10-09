# frozen_string_literal: true

class Campain < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :coworkers
  has_one_attached :image
  belongs_to :company, polymorphic: true

  validates :name,
            :start_date,
            :end_date,
            :objective,
            :campain_type,
            :product,
            :image,
            presence: true
end
