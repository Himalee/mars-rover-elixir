# MarsRover

A program that takes in commands and moves one or more robots around Mars.

## Getting Started

#### Prerequisites
1. Install [Elixir](https://elixir-lang.org/install.html)

#### Running instructions

1. Clone the repository
2. In your terminal, navigate into the repository
3. Install dependencies with `$ mix deps.get`
4. Run the test suite by running `$ mix test`
5. Start the app by running `$ mix start`


#### Improvements

Improve user experience:
- Display prompts for grid size, initial robot positions and commands, then display final positions
- Introduce user input validation

Refactor:
- The 'Move' methods are called twice per command, once to assess whether the move is valid, and once to return the next position. Look to call once to improve performance.
- Create a 'PositionValidator' module and extract relevant methods from MarsRover.
