# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  slug        :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_products_on_slug  (slug) UNIQUE
#
class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: {message: 'El nombre es requerido.'}
  validates :description, presence: {message: 'La descripcion es requerida.'}
  validates :name, length: {maximum: 200, minimum: 2, message: 'Debe ingresar minimo 2 caracteres y maximo 200'}
  validates :name, :uniqueness => {message: 'El nombre debe ser unico'}

  has_one_attached :image, :dependent => :destroy

  has_many :product_categories, :dependent => :destroy
  has_many :categories, through: :product_categories #join: union de categorias a product_cate
  has_many :comments, -> { order('id DESC')}, :dependent => :destroy  #Un producto puede poseer multiples comentarios

  accepts_nested_attributes_for :categories #Se podra relacionar las categorias con los productos

  def category_default
    return self.categories.last.name if self.categories.any?
    'Sin Categoria'
  end
end
