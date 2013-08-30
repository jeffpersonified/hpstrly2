class UrlValidator < ActiveModel::Validator
  require 'net/http'

  def validate(record)
    url = URI.parse(self.original_url)
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path)
  rescue
    # record.errors[:base] << "Choose a valid url. Yours was too obscure."
    # errors.add(:yyy,'discount with no business')
    raise "Choose a valid url. Yours was too obscure."
  else
    true
  end
end