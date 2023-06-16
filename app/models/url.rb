class Url < ApplicationRecord
    # Associations
    has_many :visits

    # Callback
    after_create :generate_shortened_url

    # Generates the token for short url
    def generate_shortened_url
        token = SecureRandom.alphanumeric(6)
        while Url.exists?(shortened: token)
            token = SecureRandom.alphanumeric(6)
        end
        self.update_attribute("shortened", token)
    end
end
