class User < ApplicationRecord
	has_many :twitter_accounts
	has_secure_password
	has_many :tweets

	validates :email, presence: true
end

# en la BD:
# email:string
# password _digest:string
# me da:
# password:string virtual
# password_confirmation:string virtual
# autenticate
