class HoppingChaosCats
  def self.bottom_up(grid)
    # assuming grid has at least one row and one column
    rows = grid.length
    columns = grid[0].length
    dp = Array.new(rows, Array.new(columns))


    grid.each_index do |row_index|
      grid[row_index].each_with_index do |grid_element, column_index|
        total_paths = 0 if blocked_by_cat?(grid_element)
        total_paths = 1 if base_case?(grid_element, row_index, column_index)
        total_paths = sum_paths_from_neighbors(dp, row_index, column_index) if interior_case?(grid_element, row_index, column_index)

        dp[row_index][column_index] = total_paths
      end
    end

    dp[rows-1][columns-1]
  end

  def self.top_down(grid)
    memo = Hash.new
    rows = grid.length
    columns = grid[0].length

    top_down_helper(grid, memo, rows - 1, columns - 1)
  end

  def self.top_down_helper(grid, memo, row_index, column_index)
    if total_paths_needs_calculating?(memo, row_index, column_index)

      if top_down_base_case?(grid, row_index, column_index)
        total_paths = get_total_paths_for_base_case(grid, row_index, column_index)
      else
        total_paths = top_down_helper(grid, memo, row_index - 1, column_index) + top_down_helper(grid, memo, row_index, column_index - 1)
      end

      save_total_paths!(memo, row_index, column_index, total_paths)
    end

    get_total_paths(memo, row_index, column_index)
  end
  
  def self.top_down_base_case?(grid, row_index, column_index)
    blocked_by_cat?(grid[row_index][column_index]) or top_or_left_edge?(row_index, column_index)
  end

  def self.get_total_paths_for_base_case(grid, row_index, column_index)
    blocked_by_cat?(grid[row_index][column_index]) ? 0 : 1
  end

  def self.get_memo_key(row_index, column_index)
    "#{row_index} #{column_index}"
  end

  def self.total_paths_needs_calculating?(memo, row_index, column_index)
    memo_key = get_memo_key(row_index, column_index)

    !memo.has_key?(memo_key)
  end

  def self.save_total_paths!(memo, row_index, column_index, total_paths)
    memo_key = get_memo_key(row_index, column_index)

    memo[memo_key] = total_paths
  end

  def self.get_total_paths(memo, row_index, column_index)
    memo_key = get_memo_key(row_index, column_index)

    memo[memo_key]

  end

  def self.blocked_by_cat?(grid_element)
    grid_element == "C"
  end

  def self.base_case?(grid_element, row_index, column_index)
    !blocked_by_cat?(grid_element) and top_or_left_edge?(row_index, column_index)
  end

  def self.top_or_left_edge?(row_index, column_index)
    row_index.zero? or column_index.zero?
  end

  def self.interior_case?(grid_element, row_index, column_index)
    !blocked_by_cat?(grid_element) and !top_or_left_edge?(row_index, column_index)
  end

  def self.sum_paths_from_neighbors(dp, row_index, column_index)
    dp[row_index - 1][column_index] + dp[row_index][column_index - 1]
  end

end