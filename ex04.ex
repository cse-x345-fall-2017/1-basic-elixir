Code.compiler_options(ignore_module_conflict: true)

defmodule Ex04 do
  require Integer

  ##############################################################################
  # 3: 3 questions,  20 points available #
  ########################################

  @doc """
  Here's a `reduce` function you can use in the following exercises.
  You may not use any Elixir library functions unless specifically allowed
  in the notes for an exercise.

      iex> Ex04.reduce [1, 2, 3, 4], 0, &(&1 + &2)
      10

      iex> Ex04.reduce [1, 2, 3, 4], &(&1 + &2)
      10

      iex> Ex04.reduce [1, 2, 3, 4], [], &[ &1 | &2 ]
      [ 4, 3, 2, 1 ]

  """

  def reduce([ h | t ],  func),        do: reduce(t, h, func)
  def reduce([ ], state, _func),       do: state
  def reduce([ h | t ], state, func),  do: reduce(t, func.(h, state), func)


  ##############################################################################
  # 4.1:  5 points #
  ##################

  @doc """
  Use `reduce` to reverse a list. (there's a hint above)

      iex> Ex04.reverse [ 5, 4, 3, 2, 1 ]
      [ 1, 2, 3, 4, 5 ]

  """
  def reverse([ h | t ]), do: reduce0( t, [h] )
  def reduce0([ h | t ], v ), do: reduce0( t, [ h | v ])
  def reduce0([], v), do: v



  ##############################################################################
  # 4.2:  5 points #
  ##################
  @doc """
  Use `reduce` to find the minimum of a list of numbers.

      iex> Ex04.min [ 5, 2, 7, 9 ]
      2

      iex> Ex04.min [ 5, 2, -7, 9 ]
      -7

  """
  #def mins([ h | t ]), do: mins( t, h )
  #def mins([ h | t ], state) do 
  #case h < state do
  #true -> mins( t, h )
  #false -> mins( t, state )
  #end
  #end
  #def mins([], state), do: state



  def min([ h | t ]) do
  reduce( t, h, fn(a, b) -> case a < b do
  true -> a
  false -> b
  end
  end)
  end
 




  ##############################################################################
  # 4.3: 10 points #
  ##################
  @doc """
  Given a list of integers, return a two element tuple. The first element
  is a list of the even numbers from the list. The second is a list of
  the odd numbers. You may use the library functions `Integer.is_even` and
  `Integer.is_odd`, and you can use the `reverse` function you defined
  above. Feel free to write helper functions if you want.

      iex> Ex04.even_odd [ 1, 2, 3, 4, 5 ]
      { [ 2, 4],  [ 1, 3, 5 ] }

  Hint: you're taking a list and converting it into something else. What function
  helps you do that. And, if you use that function, what does it return? That
  return value will be the thing you have to manipulate.
  """

  def even_odd([ h | t ]) do
  case Integer.is_even(h) do
  true -> even_odd( t, [h], [])
  false -> even_odd( t, [], [h])
  end
  end
  def even_odd([ h | t ], even, odd ) do
  case Integer.is_even(h) do
  true -> even_odd( t, [ h | even ], odd )
  false -> even_odd( t, even, [ h | odd ])
  end
  end
  def even_odd([], even, odd ), do: {reverse(even), reverse(odd)}

  





  ###########################
  # IGNORE FROM HERE TO END #
  ###########################

  @after_compile __MODULE__

  def __after_compile__(_env, bytecode) do
    File.write("Elixir.Ex04.beam", bytecode)
  end

end


ExUnit.start
defmodule TestEx04 do
  use ExUnit.Case
  doctest Ex04
end

