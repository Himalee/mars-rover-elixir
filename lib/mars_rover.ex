defmodule MarsRover do

  def update_position([x_coordinate, y_coordinate, orientation], commands) do
    commands = String.split(commands, "", trim: true)
    Enum.reduce(commands, [x_coordinate, y_coordinate, orientation], fn command, [x_coordinate, y_coordinate, orientation] ->
      case command do
        "L" -> Move.rotate_left([x_coordinate, y_coordinate, orientation])
        "F" -> Move.move_forward([x_coordinate, y_coordinate, orientation])
        "R" -> Move.rotate_right([x_coordinate, y_coordinate, orientation])
      end
    end)
  end
end
