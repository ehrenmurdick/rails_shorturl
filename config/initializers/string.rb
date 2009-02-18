class String
  def from_64
    tot = 0
    self.split('').reverse.each_with_index do |c, place|
      n = Integer::VALID_BASE64_CHARS.index(c)
      tot += (n * (64 ** place))
    end
    tot
  end
end
