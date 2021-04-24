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

  test "returns lost with final valid position if robots falls off Mars" do
    assert MarsRover.final_state([0, 2, :north], "FFLFRFF", 4, 8) == {[0, 4, :west], :lost}
    assert MarsRover.final_state([1, 0, :south], "FFRLF", 4, 8) == {[1, 0, :south], :lost}
  end

  test "returns final states of multiple robots - example 1" do
    robot_inputs = [{[2, 3, :east], "LFRFF"}, {[0, 2, :north], "FFLFRFF"}]
    expected_robot_outputs = [{[4, 4, :east], :not_lost}, {[0, 4, :west], :lost}]
    assert MarsRover.final_states(robot_inputs, 4, 8) == expected_robot_outputs
  end

  test "returns final states of multiple robots - example 2" do
    robot_inputs = [{[2, 3, :north], "FLLFR"}, {[1, 0, :south], "FFRLF"}]
    expected_robot_outputs = [{[2, 3, :west], :not_lost}, {[1, 0, :south], :lost}]
    assert MarsRover.final_states(robot_inputs, 4, 8) == expected_robot_outputs
  end
end
