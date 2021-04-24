defmodule MarsRover do
  def move_forward([x, y, orientation]) do
    case orientation do
      :north -> [x, y + 1, orientation]
      :east -> [x + 1, y, orientation]
      :west -> [x - 1, y, orientation]
      :south -> [x, y - 1, orientation]
    end
  end

  def rotate_left([x, y, orientation]) do
    case orientation do
      :north -> [x, y, :west]
      :east -> [x, y, :north]
      :south -> [x, y, :east]
      :west -> [x, y, :south]
    end
  end
end
