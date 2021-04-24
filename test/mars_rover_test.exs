defmodule MarsRoverTest do
  use ExUnit.Case
  doctest MarsRover

  test "return a single robots final position and orientation given one command" do
    assert MarsRover.final_state([1, 1, :south], "L", 2, 2) == {[1, 1, :east], :not_lost}
  end

  test "return a single robots final position and orientation given multiple commands" do
    assert MarsRover.final_state([2, 3, :east], "LFRFF", 5, 5) == {[4, 4, :east], :not_lost}
    assert MarsRover.final_state([2, 3, :north], "FLLFR", 5, 5) == {[2, 3, :west], :not_lost}
  end

  test "returns lost with final position if robots falls off Mars" do
    assert MarsRover.final_state([0, 2, :north], "FFLFRFF", 4, 8) == {[0, 4, :west], :lost}
    assert MarsRover.final_state([1, 0, :south], "FFRLF", 4, 8) == {[1, 0, :south], :lost}
  end
end
