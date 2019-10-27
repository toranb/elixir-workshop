defmodule Game.Engine do
  defstruct cards: [], winner: false, animating: false, playing_cards: [], random: nil, score: nil

  alias Game.Card
  alias Game.Hash

  def new(playing_cards, random) do
    cards =
      playing_cards
      |> generate_cards(random)

    %__MODULE__{cards: cards, playing_cards: playing_cards, random: random, score: 0}
  end

  def flip(struct, _id) do
    struct
  end

  def unflip(struct) do
    struct
  end

  def prepare_restart(struct) do
    struct
  end

  def restart(%__MODULE__{playing_cards: playing_cards, random: random}) do
    __MODULE__.new(playing_cards, random)
  end

  @doc false
  def generate_cards(cards, random) do
    length = 6
    total = Enum.count(cards)

    Enum.map(cards, fn name ->
      hash = Hash.hmac("type:card", name, length)
      one = %Card{id: "#{hash}1", name: name, image: "/images/cards/#{name}.png"}
      two = %Card{id: "#{hash}2", name: name, image: "/images/cards/#{name}.png"}
      [one, two]
    end)
    |> List.flatten()
    |> random.take_random(total * 2)
  end
end
