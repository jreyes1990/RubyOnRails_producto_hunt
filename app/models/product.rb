# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: {message: 'El nombre es requerido.'}
  validates :description, presence: {message: 'La descripcion es requerida.'}
  validates :name, length: {maximum: 200, minimum: 2}
  validates :name, :uniqueness => {message: 'El nombre debe ser unico'}

  has_one_attached :image, :dependent => :destroy
end
