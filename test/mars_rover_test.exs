defmodule MarsRoverTest do
  use ExUnit.Case
  doctest MarsRover

  test "moves robot forward one space facing north" do
    assert MarsRover.move_forward([1, 1, :north]) == [1, 2, :north]
  end

  test "moves robot forward one space facing east" do
    assert MarsRover.move_forward([1, 1, :east]) == [2, 1, :east]
  end

  test "moves robot forward one space facing west" do
    assert MarsRover.move_forward([1, 1, :west]) == [0, 1, :west]
  end

  test "moves robot forward one space facing south" do
    assert MarsRover.move_forward([1, 1, :south]) == [1, 0, :south]
  end

  test "rotates north facing robot left by 90 degrees" do
    assert MarsRover.rotate_left([1, 1, :north]) == [1, 1, :west]
  end

  test "rotates east facing robot left by 90 degrees" do
    assert MarsRover.rotate_left([1, 1, :east]) == [1, 1, :north]
  end

  test "rotates south facing robot left by 90 degrees" do
    assert MarsRover.rotate_left([1, 1, :south]) == [1, 1, :east]
  end

  test "rotates west facing robot left by 90 degrees" do
    assert MarsRover.rotate_left([1, 1, :west]) == [1, 1, :south]
  end
end
