class Memoizer
  def initialize
    @cache = Hash.new
  end

  def memoized?(row, column)
    @cache.has_key?(memo_key(row, column))
  end

  def add_value(value, row, column)
    @cache[memo_key(row, column)] = value
  end

  def get_value(row, column)
    @cache[memo_key(row, column)]
  end

  private

  def memo_key(row, column)
    "#{row} #{column}"
  end
end