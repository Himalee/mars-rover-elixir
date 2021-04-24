defmodule Mix.Tasks.Start do
  use Mix.Task

  def run(_) do
    IO.puts Message.welcome()

    IO.puts Message.input_example_1()
    IO.puts Message.pre_result()
    robot_inputs_example_1 = [{[2, 3, :east], "LFRFF"}, {[0, 2, :north], "FFLFRFF"}]
    IO.puts(Message.final_positions(robot_inputs_example_1))

    IO.puts Message.input_example_2()
    IO.puts Message.pre_result()
    robot_inputs_example_2 = [{[2, 3, :north], "FLLFR"}, {[1, 0, :south], "FFRLF"}]
    IO.puts(Message.final_positions(robot_inputs_example_2))
  end
end
