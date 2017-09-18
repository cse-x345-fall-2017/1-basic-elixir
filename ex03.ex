Code.compiler_options(ignore_module_conflict: true)

defmodule Ex03 do
  require Integer

  ##############################################################################
  # 3: 4 questions,  20 points available                                       #
  ##############################################################################
  # Rubric (per question):                                                     #
  #                                                                            #
  # Does it pass tests?. . . . . . . . . . . . . . . . 60%                     #
  #                                                                            #
  # Was is written using the given constraints? Is . . 20%                     #
  # it free of any errors not found by the tests                               #
  #                                                                            #
  #                                                                            #
  # Is it written in a functional, Elixir style? . . . 20%                     #
  ##############################################################################

  @moduledoc """

  All the exercises in this module should be solved using _named
  functions_ (`def fname...`).

  The `iex` sessions in the documentation block for each shows samples
  of how the function should be used.

  Remember you can load this code in `iex` from the command line and
  play with it using:

      $ iex ex03.ex

  You can run tests using:

      $ elixir ex03.ex

  Use no library functions unless explicitly noted.
  """

  ##############################################################################
  # 3.1:  5 points #
  ##################

  @doc """

  Write a function (or functions) that take a list of integers and
  generates a new list of atoms, where the output list contains `:odd`
  is the corresponding integer is odd, `:even` otherwise.

      iex> Ex03.odd_even [ 1, 2, 4, 7, 9 ]
      [ :odd, :even, :even, :odd, :odd ]

  (The library functions `Integer.is_even` and `Integer.is_odd` may
  be used if needed.)

  """

  def outputAtom(n) when Integer.is_odd(n) do :odd end
  def outputAtom(n) when Integer.is_even(n) do :even end

  def odd_even([]), do: [] #IO.puts "empty list"#
  def odd_even([head|tail]), do: [outputAtom(head)|odd_even(tail)]


  ##############################################################################
  # 3.2:  5 points #
  ##################

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

  def list_contains([head|tail],n) do
    cond do
       n in [head|tail] -> true 
       !(n in [head|tail]) -> false
    end
  end

  ##############################################################################
  # 3.3:  5 points #
  ##################

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

  def list_equal([],[]), do: true	#The 2 lists are empty lists then they are equal.
  def list_equal([a1|tail1],[a2|tail2]) #Recursion if the head elements are equal from each list.
	when a1 == a2, do:
	   list_equal(tail1,tail2)
  def list_equal([a1|tail1],[a2|tail2]) #Print false if head elemnets are not equal.	
	when a1 !== a2, do: false
  def list_equal([],[_]), do: false     #Print false if size are not equal for lists.
  def list_equal([_],[]), do: false     #Print false if size are not equal for lists.



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

  There are eight winning positions (three horizontal, three vertical,
  and two diagonal). Write a function that returns :x if X has won, :o
  if O has won, and false otherwise.

      iex> Ex03.won { :x, :o, 3,   :x, 5, :o,   :x, 8, :o }
      :x

      iex> Ex03.won { :o, :x, 3,   :x, :o, 6,   :x, 5, :o }
      :o

      iex> Ex03.won { :o, :x, 3,   :x, :o, 6,   :x, :o, 9 }
      false

  Think a little about a nice way to lay this code out.
  """

  def won({a1,a2,a3,a4,a5,a6,a7,a8,a9}) do
         cond do
		{:o,:o,:o}in[{a1,a2,a3},{a4,a5,a6},{a7,a8,a9},{a1,a4,a7},{a2,a5,a8},{a3,a6,a9},{a1,a5,a9},{a3,a5,a7}] -> :o
		{:x,:x,:x}in[{a1,a2,a3},{a4,a5,a6},{a7,a8,a9},{a1,a4,a7},{a2,a5,a8},{a3,a6,a9},{a1,a5,a9},{a3,a5,a7}] -> :x
		({:o,:o,:o}in[{a1,a2,a3},{a4,a5,a6},{a7,a8,a9},{a1,a4,a7},{a2,a5,a8},{a3,a6,a9},{a1,a5,a9},{a3,a5,a7}] && 
		{:x,:x,:x}in[{a1,a2,a3},{a4,a5,a6},{a7,a8,a9},{a1,a4,a7},{a2,a5,a8},{a3,a6,a9},{a1,a5,a9},{a3,a5,a7}]) -> false
		!({:o,:o,:o}in[{a1,a2,a3},{a4,a5,a6},{a7,a8,a9},{a1,a4,a7},{a2,a5,a8},{a3,a6,a9},{a1,a5,a9},{a3,a5,a7}] && 
		{:x,:x,:x}in[{a1,a2,a3},{a4,a5,a6},{a7,a8,a9},{a1,a4,a7},{a2,a5,a8},{a3,a6,a9},{a1,a5,a9},{a3,a5,a7}]) -> false
	end
  end


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
