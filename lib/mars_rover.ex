defmodule MarsRover do

  def update_position([x_coordinate, y_coordinate, orientation], movement_commands, x_axis, y_axis) do
    [final_x_coordinate, final_y_coordinate, final_orientation] = final_state([x_coordinate, y_coordinate, orientation], movement_commands)
    if off_grid?(final_x_coordinate, final_y_coordinate, x_axis, y_axis) do
      "LOST"
    else
      [final_x_coordinate, final_y_coordinate, final_orientation]
    end
  end

  defp final_state([x_coordinate, y_coordinate, orientation], movement_commands) do
    commands = String.split(movement_commands, "", trim: true)
    Enum.reduce(commands, [x_coordinate, y_coordinate, orientation], fn command, [x_coordinate, y_coordinate, orientation] ->
      case command do
        "L" -> Move.rotate_left([x_coordinate, y_coordinate, orientation])
        "F" -> Move.move_forward([x_coordinate, y_coordinate, orientation])
        "R" -> Move.rotate_right([x_coordinate, y_coordinate, orientation])
      end
    end)
  end

  defp off_grid?(x_coordinate, y_coordinate, x_axis, y_axis) do
    x_coordinate < 0 || y_coordinate < 0 || x_coordinate > x_axis || y_coordinate > y_axis
  end
end
