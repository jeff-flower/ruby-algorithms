# Problem description
# There are n steps
# It is possible to move up one step or two steps at a time
# How many distinct ways are there to navigate the n steps?
class HoppingChaos
  # Alternative to class instance variable:
  # Create empty hash inside method, create second, helper method
  # Pass hash as argument to helper method
  # Call helper method recursively
  @memo = Hash.new 

  # recursive, top down solution
  def self.distinct_top_down(n)
    return 1 if n == 1
    return 2 if n == 2

    return @memo[n] if @memo.key?(n)

    # the top step can be reach by taking one step or two steps
    # count the unique ways to get within one or two steps of the top
    @memo[n] = distinct_top_down(n - 1) + distinct_top_down(n - 2)

    @memo[n]
  end

  def self.distinct_bottom_up(n)
    return 1 if n == 1
    return 2 if n == 2

    dp = [0, 1, 2]


    Range.new(3, n).each do |current|
      dp[current] = dp[current - 1] + dp[current - 2]
      current += 1
    end

    dp[n]

  end

end