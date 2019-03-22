defmodule Fibonacci do
  def start() do
    {:ok, pid} = Agent.start_link(fn -> %{0 => 0, 1 => 1} end)
    pid
  end

  def fib(number) do
    pid = start()
    update_index(pid, number)
    numbers = get_numbers(pid)
    File.write("fib_#{number}", "fib(#{number}) = #{numbers[number]}")
  end

  def get_numbers(pid) do
    Agent.get(pid, fn state -> state end)
  end

  def update_index(pid, index) do
    map = get_numbers(pid)
    unless Map.has_key?(map, index - 1) do
      update_index(pid, index - 1)
    end
    Agent.update(pid, fn state -> build_fib(state, index) end)
  end

  defp build_fib(map, index) do
    Map.put(map, index, map[index - 1] + map[index - 2])
  end
end
