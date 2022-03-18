package main

import "fmt"

func factorialise(n int) int {
	sum := 1
	for n > 0 {
		sum *= n
		n--
	}
	return sum
}

func main() {
	fmt.Println(factorialise(2))
	fmt.Println(factorialise(4))
	fmt.Println(factorialise(6))
	fmt.Println(factorialise(10))
}
