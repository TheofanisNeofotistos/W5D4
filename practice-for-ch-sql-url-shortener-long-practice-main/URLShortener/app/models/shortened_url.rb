# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, presence: true
    validates :short_url, uniqueness: true

    belongs_to :user

    after_ininitialize do |shortened_url|
        generate_short_url
    end, if: new_record?

    def self.random_code
        string = SecureRandom.urlsafe_base64
        until !self.exists?(:short_url => string)
            string = SecureRandom.urlsafe_base64
        end
        string
    end

    private
    def generate_short_url
        string = "https://open.appacademy.io/#{ShortenedUrl.random_code}"
    end
end
