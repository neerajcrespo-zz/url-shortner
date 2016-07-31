class Link < ActiveRecord::Base

  validates :out_url, :http_status, :presence => true
  #validates :in_url, :uniqueness => true
  after_commit :assign_encoded_in_url, unless: lambda { |link| link.in_url.present? }
  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)


  def self.encode(i)
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def self.decode(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end
  

  private

  def assign_encoded_in_url
    if self.id.present?
      self.in_url = Link.encode(self.id)
      self.save
    end
  end



end
