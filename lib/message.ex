defmodule Message do

  @grid_size_x_axis 4
  @grid_size_y_axis 8

  def welcome() do
    "Welcome to Mars Rover!"
  end

  def pre_result() do
    "Results in the final positions:"
  end

  def input_example_1() do
    "The following input:\n4x8 grid\nStarting positions and commands:\n(2, 3, E) LFRFF\n(0, 2, N) FFLFRFF"
  end

  def input_example_2() do
    "The following input:\n4x8 grid\nStarting positions and commands:\n(2, 3, N) FLLFR\n(1, 0, S) FFRLF"
  end

  def final_positions(robot_inputs) do
    robot_inputs
    |> MarsRover.final_states(@grid_size_x_axis, @grid_size_y_axis)
    |> Enum.map(fn {[x, y, orientation], result} ->
      result = result(result)
      orientation = orientation(orientation)
      "(#{x}, #{y}, #{orientation}) #{result}\n"
    end)
  end

  defp result(result) do
    if result == :lost, do: "LOST", else: ""
  end

  defp orientation(orientation) do
    case orientation do
      :north -> "N"
      :east -> "E"
      :south -> "S"
      :west -> "W"
    end
  end
end
