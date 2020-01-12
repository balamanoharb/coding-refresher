# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  #   top row, top col, bottom row, bottom col
    return [] if matrix.length == 0
    row_start = 0
    row_end = matrix.length-1
    col_start = 0
    col_end = matrix[0].length - 1
    result = []
    while(row_start <= row_end && col_start <= col_end)
      # left to right
      col_start.upto(col_end) do |c|
        result.push(matrix[row_start][c])
      end
      row_start += 1
      # top to bottom
      row_start.upto(row_end) do |r|
        result.push(matrix[r][col_end])
      end
      col_end -= 1
      
      # right to left
      if(row_start <= row_end)
        col_end.downto(col_start) do |c|
          result.push(matrix[row_end][c])
        end
      end
      row_end -= 1
      
      # bottom to up
      if(col_start <= col_end)
        row_end.downto(row_start) do |r|
          result.push(matrix[r][col_start])
        end
      end
      col_start += 1
      
    end
    return result
  end