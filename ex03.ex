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

    def reverse([]) do [] end
    def reverse([h|t]) do reverse(t) ++ [h] end

    def odd_even([])  do [] end
    def odd_even(list) when list != [] do

        [h | t] = list

        m_to_oe = %{0 => :even, 1 => :odd}

        mod_h = rem(h,2)
        
        %{^mod_h => oe} = m_to_oe
        
        new_list = [oe]

        reverse(odd_even(t,new_list))
    end

    def odd_even([],new_list) do new_list end
    def odd_even(list, new_list) when list != [] do

        [h | t] = list

        m_to_oe = %{0 => :even, 1 => :odd}

        mod_h = rem(h,2)
        
        %{^mod_h => oe} = m_to_oe
        
        new_list = [oe | new_list]

        odd_even(t,new_list)
    end


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

    def list_contains([],_val) do false end
    def list_contains(list,val) do 
        
        [h | t] = list

        check = h == val

        val_map = %{:false => list_contains(t,val), :true => true}

        %{^check => stop} = val_map

        stop
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

    def len([]) do 0 end
    def len([_h | t]) do 1 + len(t) end

    def list_equal([],[]) do true end
    def list_equal(1,1) do false end
    def list_equal(list1,list2) do 

        check_len = len(list1) == len(list2)

        [h1 | t1] = list1
        [h2 | t2] = list2

        list1_map = %{false: 1, true: t1}
        list2_map = %{false: 1, true: t2}

        %{^check_len => t1} = list1_map
        %{^check_len => t2} = list2_map

        check_val = h1 == h2

        val_map = %{true: list_equal(t1,t2), false: false}
        %{^check_val => stop} = val_map

        stop

    end



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

    def won(state) do

        #assumes input will not have both win by nature of the game

        has_won_o = check(state, :o)

        %{^has_won_o => winner} = %{:o => :o,false => check(state, :x)}

        winner

    end

    def check(state, player) do

        win = { player,player,player }
        has_won = false

    
        #win states
        h1 = { elem(state,0), elem(state,1), elem(state,2) }
        h2 = { elem(state,3), elem(state,4), elem(state,5) }
        h3 = { elem(state,6), elem(state,7), elem(state,8) }

        v1 = { elem(state,0), elem(state,3), elem(state,6) }
        v2 = { elem(state,1), elem(state,4), elem(state,7) }
        v3 = { elem(state,2), elem(state,5), elem(state,8) }

        d1 = { elem(state,0), elem(state,4), elem(state,8) }
        d2 = { elem(state,2), elem(state,4), elem(state,6) }
    
        #all checks mapped

        h1_check = %{true => true, false => h1 == win}
        h2_check = %{true => true, false => h2 == win}
        h3_check = %{true => true, false => h3 == win}

        v1_check = %{true => true, false => v1 == win}
        v2_check = %{true => true, false => v2 == win}
        v3_check = %{true => true, false => v3 == win}

        d1_check = %{true => true, false => d1 == win}
        d2_check = %{true => true, false => d2 == win}

        #if already won, keep true else check again
        %{^has_won => winner} = h1_check
        has_won = winner
        %{^has_won => winner} = h2_check
        has_won = winner
        %{^has_won => winner} = h3_check
        has_won = winner

        %{^has_won => winner} = v1_check
        has_won = winner
        %{^has_won => winner} = v2_check
        has_won = winner
        %{^has_won => winner} = v3_check
        has_won = winner

        %{^has_won => winner} = d1_check
        has_won = winner
        %{^has_won => winner} = d2_check
        has_won = winner

        %{^has_won => winner} = %{true => player, false => false}

        winner

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
