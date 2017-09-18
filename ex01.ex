ExUnit.start
Code.load_file "support.ex"

defmodule Ex01 do
  use ExUnit.Case
  #import Support

  ##############################################################################
  # 1: 5 questions,  30 points available                                       #
  ##############################################################################
  # Rubric (per question):                                                     #
  #                                                                            #
  # Does it pass tests?. . . . . . . . . . . . . . . . 60%                     #
  #                                                                            #
  # Was is written using the given constraints? Is . . 20%                     #
  # it free of any errors not found by the tests                               #
  #                                                                            #
  # Is it written in a functional, Elixir style? . . . 20%                     #
  ##############################################################################


  @moduledoc """

  All the exercises should be solved using anonymous functions.

  You can try your answers first in iex.

  You can run the tests on your functions using

      elixir ex01.ex
  """

  ##################
  # 1.1:  5 points #
  ##########################################################
  # Write a function that adds two numbers using fn syntax #
  ##########################################################

  # sum2a = your_anonymous_function(1, 2)
  sum2a = fn(a, b) -> a + b end

  assert sum2a.(1, 2)    == 3
  assert sum2a.(-1, 100) == 99

  ##################
  # 1.2:  5 points #
  ##########################################################
  # Write a function that adds two numbers using & syntax  #
  ##########################################################

  #sum2b = your_anonymous_function(1, 2)
  sum2b = &(&1 + &2)

  assert sum2b.(1, 2)    == 3
  assert sum2b.(-1, 100) == 99

  ##################
  # 1.3:  5 points #
  #####################################################################
  # Write a function that adds three numbers. Use the fn syntax, and  #
  # use the sum2() function you defined above inside it (so there are #
  # no explicit + operators in your function                          #
  #####################################################################

  #sum3a = your_anonymous_function(1, 2, 3)
  sum3a = fn(a, b, c) -> sum2a.(a, sum2a.(b, c)) end


  assert sum3a.(1, 3, 5)  == 9
  assert sum3a.(1, -3, 5) == 3

  ##################
  # 1.4:  5 points #
  ####################################
  # Do the same using the & notation #
  ####################################

  #sum3b = your_anonymous_function()
  sum3b = &(sum2b.(&1, sum2b.(&2, &3)))

  assert sum3b.(1, 3, 5)  == 9
  assert sum3b.(1, -3, 5) == 3

  ##################
  # 1.5: 10 points #
  ########################################################################
  # Write a function then takes a numeric parameter, and returns another #
  # function. This second function also takes a numeric parameter. When  #
  # you call the second function with a parameter, it returns the        #
  # sum of that parameter and the parameter passed to the first          #
  # function. The examples below will make this clearer :)               #
  ########################################################################

  #create_adder = your_anonymous_function(1)
  create_adder = fn(a) -> fn(b) -> a+b end end

  add_2  = create_adder.(2)
  add_99 = create_adder.(99)

  assert add_2.(3)  == 5
  assert add_99.(3) == 102

end


