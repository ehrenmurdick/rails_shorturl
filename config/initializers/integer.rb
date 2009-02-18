class Integer
  VALID_BASE64_CHARS = (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ['-', '_'])
  def to_64
    result, remainder = self.divmod(VALID_BASE64_CHARS.size)
    if result != 0
      result.to_64
    end.to_s + VALID_BASE64_CHARS[remainder]
  end
end
