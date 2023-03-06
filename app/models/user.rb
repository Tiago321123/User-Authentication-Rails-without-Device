class User < ApplicationRecord
    has_secure_password # i want accept a senha and transform it in to a 'senha' digest and store it in the password_digest
    #Quando incluído no código, será possível salvar: Um atributo password_digest no banco, que será a senha encriptada; Os atributos virtuais, password e password_confirmation, incluindo a requisição se eles combinam; Um método authenticate que retorna o usuário quando a senha está correta. O único requerimento para funcionamento desse comportamento é a criação do campo password_digest na tabela User. Para implementar é preciso criar uma migration com o código a seguir: rails generate migration add_password_digest_to_users password_digest:string

    validates :name, presence: true, length: {maximum: 50}
    validates :password, presence: true, length: {minimum: 6}
    VALID_EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP  # /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false} # https://stackoverflow.com/questions/690664/rails-validates-uniqueness-of-case-sensitivity
    before_save { self.email = email.downcase } # antes de salvar, vamos transformar o email em letra minúscula
end 
