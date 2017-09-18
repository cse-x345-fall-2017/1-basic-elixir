# Assignment 2

In this directory you'll find a set of files named `ex01.ex`,
`ex02.ex`, and so on.

Each contains an exercise to be completed. In each exercise there's a
description of an *anonymous* or *named function* to be written, and
some code.

You'll write your anonymous function where is says `your_anonymous_function(..)`.

You'll write your named function where is says `"your code"`.

In ex01 and ex02, tests are included below where you write your code:

    assert your_fn(...) = some_value

These show the results that are expected to be returned. Once you've
finished, you can run these tests from the command line using

    $ elixir ex01.exs

(or `ex02.exs` ...)

You're done when all the tests pass.


In ex03 and ex04, the code should be written using named functions.
The tests are included in the documentation that says what each
function should do: it looks like a sample iex session. For example:

    @doc """

    Write a function (or functions) that take a list of integers and
    generates a new list of atoms, where the output list contains `:odd`
    is the corresponding integer is odd, `:even` otherwise.

        iex> Ex03.odd_even [ 1, 2, 4, 7, 9 ]
        [ :odd, :even, :even, :odd, :odd ]

    (The library functions `Integer.is_even` and `Integer.is_odd` may
    be used if needed.)

    """

These tests are also run using the command

    elixir ex03.ex

This set of exercises is in a slightly strange format. That's
because we haven't yet looked at Elixir projects.
