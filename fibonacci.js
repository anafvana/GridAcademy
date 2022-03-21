// Factorials review
const factorialise = n => n == 1 ? 1 : n * factorialise(n-1)

// Fibonacci - recursive
const recursiveFibonacci = n => n <= 1 ? n : recursiveFibonacci(n-2) + recursiveFibonacci(n-1)

// Fibonacci - iterative
const iterativeFibonacci = n => {
    const fibonacci = (f, s, loop) => loop == n ? f : fibonacci(s, f+s, loop + 1);
    return fibonacci(0, 1, 0)
}