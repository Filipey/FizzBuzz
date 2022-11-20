defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when invalid file was provided, should returns the converted list" do
      expected_response =
        {:ok, [1, 2, :Fizz, 4, :Buzz, :Buzz, :FizzBuzz, :Buzz, :FizzBuzz, 53, 11, 31, 56]}

      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "when invalid file was provided, should returns a error" do
      expected_response = {:error, "Error while reading the file: enoent"}
      assert FizzBuzz.build("invalid.txt") == expected_response
    end
  end
end
