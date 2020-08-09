class Array
  def except(value)
    self - [value].flatten
  end
end
