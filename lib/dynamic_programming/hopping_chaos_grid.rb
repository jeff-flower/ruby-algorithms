class HoppingChaosGrid
  def self.bottom_up(rows, columns)
    dp = Array.new(rows, Array.new(columns)) 

    dp.each_index do |row_index|
      dp[row_index].each_index do |column_index|
        if is_top_or_left_edge?(row_index, column_index)
          dp[row_index][column_index] = 1 
        else 
          dp[row_index][column_index] = dp[row_index - 1][column_index] + dp[row_index][column_index - 1]
        end
      end
    end

    dp[rows - 1][columns - 1]
  end

  def self.is_top_or_left_edge?(row_index, column_index)
    row_index.zero? or column_index.zero?
  end

end