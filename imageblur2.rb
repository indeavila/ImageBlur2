class Image
  def initialize(array)
    @image = array
  end
  def output_image
    @new_image.each_with_index do |r|
      puts r.join
    end
  end
  def blur(row, col)
    if @image[row][col] == 1
      @new_image[row][col] = 1
      if row + 1 < @image.count
        @new_image[row + 1][col] = 1
      end
      if row - 1 >= 0
        @new_image[row - 1][col] = 1
      end
      if col + 1 < @image[row].count
        @new_image[row][col + 1] = 1
      end
      if col -1 >= 0
        @new_image[row][col - 1] = 1
      end
    end
  end
  def blur_loop
    @new_image = []
    @image.each do |row|
      points = []
      row.each do |point|
        points << point
      end
      @new_image << points
    end
      @image.each_with_index do |r, row|
        r.each_with_index do |c, col|
          blur(row, col)
        end
      end
  end
end
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.blur_loop
image.output_image