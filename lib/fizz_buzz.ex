defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error while reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(num) when rem(num, 3) == 0 and rem(num, 5) == 0, do: :FizzBuzz
  defp evaluate_numbers(num) when rem(num, 3) == 0, do: :Fizz
  defp evaluate_numbers(num) when rem(num, 5) == 0, do: :Buzz
  defp evaluate_numbers(num), do: num
end
