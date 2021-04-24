defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_) do
    IO.puts display_welcome_message()
    IO.puts "The following input:\n4x8 grid\nStarting positions and commands:\n(2, 3, E) LFRFF\n(0, 2, N) FFLFRFF"
    IO.puts display_final_position_message()
    robot_inputs_example_1 = [{[2, 3, :east], "LFRFF"}, {[0, 2, :north], "FFLFRFF"}]
    IO.puts(display_final_positions(robot_inputs_example_1))
    IO.puts "The following input:\n4x8 grid\nStarting positions and commands:\n(2, 3, N) FLLFR\n(1, 0, S) FFRLF"
    IO.puts display_final_position_message()
    robot_inputs_example_2 = [{[2, 3, :north], "FLLFR"}, {[1, 0, :south], "FFRLF"}]
    IO.puts(display_final_positions(robot_inputs_example_2))
  end

  defp display_welcome_message() do
    "Welcome to Mars Rover!"
  end

  defp display_final_positions(robot_inputs) do
    robot_inputs
    |> MarsRover.final_states(4, 8)
    |> Enum.map(fn {[x, y, orientation], result} ->
      display_result = display_result(result)
      display_orientation = display_orientation(orientation)
      "(#{x}, #{y}, #{display_orientation}) #{display_result}\n"
    end)
  end

  defp display_result(result) do
    if result == :lost, do: "LOST", else: ""
  end

  defp display_orientation(orientation) do
    case orientation do
      :north -> "N"
      :east -> "E"
      :south -> "S"
      :west -> "W"
    end
  end

  defp display_final_position_message() do
    "Results in the following final positions:"
  end
end
