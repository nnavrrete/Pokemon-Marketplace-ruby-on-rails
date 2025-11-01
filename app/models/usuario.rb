class Usuario < ApplicationRecord
    has_secure_password
    has_many :publicaciones
    has_many :compras
end
