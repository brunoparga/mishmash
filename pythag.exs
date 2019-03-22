pyth = for a <- 1..100, b <- a..100, c <- b+1..a+b-1, c<100, a*a + b*b == c*c, do: {a, b, c}

IO.inspect(pyth)
