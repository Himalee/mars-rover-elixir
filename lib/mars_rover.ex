defmodule MarsRover do

  def final_state([x, y, orientation], movement_commands, x_axis, y_axis) do
    commands = String.split(movement_commands, "", trim: true)
    initial_result = :not_lost
    Enum.reduce_while(commands, {[x, y, orientation], initial_result}, fn command, {[x, y, orientation], _result} ->
      if is_move_valid?([x, y, orientation], command, x_axis, y_axis) do
        {:cont, case command do
          "L" -> {Move.rotate_left([x, y, orientation]), :not_lost}
          "F" -> {Move.move_forward([x, y, orientation]), :not_lost}
          "R" -> {Move.rotate_right([x, y, orientation]), :not_lost}
        end
        }
      else
        {:halt, {[x, y, orientation], :lost}}
      end
    end)
  end

  defp is_move_valid?([x, y, orientation], command, x_axis, y_axis) do
    result = case command do
      "L" -> [next_x, next_y, _] = Move.rotate_left([x, y, orientation])
             result(next_x, next_y, x_axis, y_axis)
      "F" -> [next_x, next_y, _] = Move.move_forward([x, y, orientation])
             result(next_x, next_y, x_axis, y_axis)
      "R" -> [next_x, next_y, _] = Move.rotate_right([x, y, orientation])
             result(next_x, next_y, x_axis, y_axis)
    end
    result == :not_lost
  end

  defp result(x, y, x_axis, y_axis) do
    if off_grid?(x, y, x_axis, y_axis) do
      :lost
    else
      :not_lost
    end
  end

  defp off_grid?(x, y, x_axis, y_axis) do
    x < 0 || y < 0 || x > x_axis || y > y_axis
  end
end
