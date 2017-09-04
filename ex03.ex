Code.compiler_options(ignore_module_conflict: true)

defmodule Ex03 do
  require Integer
  @doc """

  Write a function (or functions) that take a list of integers and
  generates a new list of atoms, where the output list contains `:odd`
  is the corresponding integer is odd, `:even` otherwise.

      iex> Ex03.odd_even [ 1, 2, 4, 7, 9 ]
      [ :odd, :even, :even, :odd, :odd ]

  (The library functions `Integer.is_even` and `Integer.is_odd` may
  be used if needed.)
  """

  def odd_even([x | t]) when Integer.is_even(x), do: [:even | odd_even(t)]
  def odd_even([x | t]) when Integer.is_odd(x), do: [:odd | odd_even(t)]
  def odd_even(x), do: x

  @doc """
  Write a function that returns true if a list contains a
  given value, false otherwise.
      iex> Ex03.list_contains([ 1, 2, 3, 4], 3)
      true

      iex> Ex03.list_contains([ 1, 2, 3, 4], 3)
      true

      iex> Ex03.list_contains([ 1, 2, 3, 4], 3)
      true
  """

  def list_contains([x | _t], x), do: true
  def list_contains([_1 | t], x), do: list_contains(t, x)
  def list_contains(_, _x), do: false

  @doc """
  Two lists are equal if they contain the same number of elements,
  and each element in one equals the corresponding element in
  the other. Normally you use the operator `==` to test for this.

  However, let's assume that `==` doesn't work for lists. Write
  a function that checks for the equality of two lists. You don't
  need to consider nested lists.

      iex> Ex03.list_equal [ 1, 2, 3 ], [1, 2, 3]
      true
      iex> Ex03.list_equal [ 1, 2, 3 ], [1, 2, 3, 4]
      false
      iex> Ex03.list_equal [ 1, 2, 3 ], [3, 2, 1]
      false

  """

  def list_equal([], []), do: true
  def list_equal([x | t1], [x | t2]), do: list_equal(t1, t2)
  def list_equal(_, _), do: false

  ##############################################################################
  # 3.4:  5 points #
  ##################

  @doc """
  Inspired by recent computer wins in the game of Go, your team
  decides to push the boundaries of technology by implementing
  a noughts-and-crosses playing program.

  The team has decided to represent the board as a 9 element
  tuple:

       0 | 1 | 2
       --+---+--
       3 | 4 | 5      => { 1, 2, 3,  4, 5, 6,  7, 8, 9 }
       --+---+--
       6 | 7 | 8

  Each element of the tuple is set to :x or :o if the corresponding
  player has occupied the square, or its number otherwise.

       X | X |
       --+---+--
         | O |        => { :x, :x, 3,   4, :o, 6,   7, :o, :x }
       --+---+--
         | O | X
  """

  def won({x, x, x, _4, _5, _6, _7, _8, _9}), do: x
  def won({_1, _2, _3, x, x, x, _7, _8, _9}), do: x
  def won({_1, _2, _3, _4, _5, _6, x, x, x}), do: x
  def won({x, _2, _3, x, _5, _6, x, _8, _9}), do: x
  def won({_1, x, _3, _4, x, _6, _7, x, _9}), do: x
  def won({_1, _2, x, _4, _5, x, _7, _8, x}), do: x
  def won({x, _2, _3, _4, x, _6, _7, _8, x}), do: x
  def won({_1, _2, x, _4, x, _6, x, _8, _9}), do: x
  def won(_), do: false

  ###########################
  # IGNORE FROM HERE TO END #
  ###########################

  @after_compile __MODULE__

  def __after_compile__(_env, bytecode) do
    File.write("Elixir.Ex03.beam", bytecode)
  end

end


ExUnit.start
defmodule TestEx03 do
  use ExUnit.Case
  doctest Ex03
end
