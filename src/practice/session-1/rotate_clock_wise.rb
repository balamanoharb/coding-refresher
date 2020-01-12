# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  n = matrix.size
  0.upto(n/2) do |i|
    i.upto(n-i-2) do |j|
      tmp = matrix[i][j]
      fixed = n-i-1
      moving = n-j-1
      matrix[i][j] = matrix[moving][i]
      matrix[moving][i] = matrix[fixed][moving]
      matrix[fixed][moving] = matrix[j][fixed]
      matrix[j][fixed] = tmp
    end
  end
end