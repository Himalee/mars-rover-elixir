defmodule MarsRoverTest do
  use ExUnit.Case
  doctest MarsRover

  test "return a single robots final position and orientation given one command" do
    assert MarsRover.update_position([1, 1, :south], "L") == [1, 1, :east]
  end

  test "return a single robots final position and orientation given multiple commands" do
    assert MarsRover.update_position([2, 3, :east], "LFRFF") == [4, 4, :east]
    assert MarsRover.update_position([2, 3, :north], "FLLFR") == [2, 3, :west]
  end
end
