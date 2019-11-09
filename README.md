## Installation

To build the container with docker

```
docker build -t game .
```

To run the container on macOS or Linux

```
docker run -it -p 4000:4000 -v $(pwd):/game game
```

To run the container on windows with [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-6#finding-powershell-in-windows-10-81-80-and-7)

```
docker run -it -p 4000:4000 -v ${PWD}:/game game
```

Install dependencies at the command line

```
mix deps.get
```

To run the web server and visit localhost:4000

```
mix phx.server
```

To run the tests

```
mix test.watch test/game/game_test.exs
```

To run all of the tests

```
mix test
```

## Objectives

The entire workshop centers around a single Elixir source file. The game [engine](https://github.com/toranb/elixir-workshop/blob/master/lib/game/engine.ex) has 3 incomplete functions that need to be implemented for the game to function correctly.

```elixir
defmodule Game.Engine do
  def flip(struct, _id) do
    struct
  end

  def unflip(struct) do
    struct
  end

  def prepare_restart(struct) do
    struct
  end
end
```

### flip

![flipp](https://user-images.githubusercontent.com/147411/67634906-5d400800-f88f-11e9-8d3e-125fc09268a1.gif)

This function is executed when the player clicks a playing card. Simply enumerate the cards and mark the one with the id as `flipped` using a boolean. If 2 cards have been flipped at this point attempt to match them by the id. When a match is found mark each card as `paired` and set the `flipped` for both back to false. Finally, if all the cards are paired declare the game over by marking the `winner` using a boolean value.

One edge case here is that if 2 cards are flipped but they do *not* match, you need to set the `animating` boolean to true. This will later instruct the engine to fire `unflip`.

### unflip

![unfliip](https://user-images.githubusercontent.com/147411/67634902-4ac5ce80-f88f-11e9-8bbe-451093d55e4d.gif)

This function is executed after a 2nd card has flipped but failed to match. Simply enumerate the cards and mark the `flipped` attribute to false for any non paired card. You will also need to revert `animating` to false so the flip function works properly.

### prepare_restart

![prepareRestart](https://user-images.githubusercontent.com/147411/67634990-ed7e4d00-f88f-11e9-8af0-03c456c2e466.gif)

This function is executed after the player decides to play again. Simply enumerate the cards and mark all `paired` and `flipped` attributes to false.

## Bonus

If you complete the above and want some extra credit the game engine struct has a `score` attribute but it doesn't currently track anything. Update the game engine to increment this value with each card paired.

## Debugging Tips

To print something in the Elixir source code use `IO.inspect`

```elixir
"Hello World!" |> IO.inspect()

foo_bar |> IO.inspect(label: "The foo_bar variable")
```

To hang a debugger in the Elixir source code use `IEx.pry`

```elixir
require IEx

def flip(struct, card_id) do
  IEx.pry

  struct
end
```

If you are using `IEx.pry` with the test runner you cannot use watch so instead

```
iex -S mix test test/game/game_test.exs
```

When `IEx.pry` is executed the runtime will ask you `Allow? [Yn]`

If you say `n` the program will continue without interruption. If you answer `Y` you can ask questions of the running program. If you want to continue execution of the program type `respawn` and hit enter.

For a complete list of [debugging](https://elixir-lang.org/getting-started/debugging.html) options be sure to read over the getting started guide.

## License

Copyright © 2019 Toran Billups https://toranbillups.com

Licensed under the MIT License
