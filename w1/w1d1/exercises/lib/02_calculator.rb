def add(x, y)
  x + y
end

def subtract(x, y)
  x - y
end

def sum(arr)
  arr.reduce(0, :+)
end

def multiply(arr)
  return 0 if arr.empty?
  arr.reduce(:*)
end

def power(x, y)
  x ** y
end

def factorial(x)
  return 1 if x <= 1 
  x * factorial(x - 1)
end
