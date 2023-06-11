# Hello
hello = "Hello"
IO.puts hello

# Lists and maps
list = [1, 2, 3]
map = %{"a" => 1, :b => 2}

IO.inspect list
IO.inspect map

# Anonymous functions
add_five = fn n -> n + 5 end
add_ten = &(&1 + 10)

IO.puts( add_ten.( add_five.(15) ) ) # 30

# Pipe operator
15 |> add_five.() |> add_ten.() |> IO.puts

# Pattern matching
{x, y, z} = {:Hello, :World, 2023}

IO.puts x
IO.puts y
IO.puts z

# Conditions
if x == :Hello do
  IO.puts x
end

unless x != :Hello do
  IO.puts x
end

# Modules
defmodule Human do
  def run() do
    IO.puts "Running..."
  end

  # Concurrency
  def listen do
    receive do
      {:message1} -> IO.puts "Received"
      {:message2, value} -> IO.puts value
    end
    listen()
  end
end

Human.run()

process = spawn(Human, :listen, [])

send process, {:message1}
send process, {:message2, "Hello"}
send process, {:message1}
send process, {:message2, "World"}
send process, {:message1}
