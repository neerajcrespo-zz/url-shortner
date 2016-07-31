module Hasher
  ALPHABET = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join.split(//)

    # (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join

  def encode(i)
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def decode(s)
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end


