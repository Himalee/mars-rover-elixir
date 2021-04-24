defmodule MarsRoverTest do
  use ExUnit.Case
  doctest MarsRover

  test "return a single robots final position and orientation given one command" do
    assert MarsRover.update_position([1, 1, :south], "L", 2, 2) == [1, 1, :east]
  end

  test "return a single robots final position and orientation given multiple commands" do
    assert MarsRover.update_position([2, 3, :east], "LFRFF", 5, 5) == [4, 4, :east]
    assert MarsRover.update_position([2, 3, :north], "FLLFR", 5, 5) == [2, 3, :west]
  end

  test "returns 'LOST' if robots final state is off the grid" do
    assert MarsRover.update_position([0, 2, :north], "FFLFRFF", 4, 8) == "LOST"
    assert MarsRover.update_position([1, 0, :south], "FFRLF", 4, 8) == "LOST"
  end
end
