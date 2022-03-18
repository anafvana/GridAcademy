// List functions
const cons = (head, tail) =>
    bool => bool ? head : tail

const head = pair => pair(true)
const tail = pair => pair(false)

const pairToString = pair => "(" + head(pair) + "," + tail(pair) + ")"

const myPair = cons(1, 2)
console.log(pairToString(myPair))
console.log(head(myPair))
console.log(tail(myPair))

const list = arr => {
    arr.push(null);
    return arr.reduceRight((acc, curr) => cons(curr, acc))
}

const listToString = list => {
    const elems = list =>
        list == null ?
            "" :
            " " + head(list) + elems(tail(list))
    return "(" + elems(list).substring(1) + ")"
}

const myList = list([1, 2, 3, 4, 5])
console.log(listToString(myList))

// Utils
const sum = (a, b) => a + b

const multiply = (a, b) => a * b


// Reduce functions

// Reduce right
const sumDaFunc = (list) => (tail(list) == null ? 0 : head(list) + sumDaFunc(tail(list)))

const multiplyDaFunc = (list) => (tail(list) == null ? head(list) : head(list) * (multiplyDaFunc(tail(list))))

const exponentialise = (list) => tail(list) == null ? head(list) : head(list) ** (exponentialise(tail(list)))

const reduceRight = (initial, list, func) => list == null ? initial : reduceRight(func(initial, head(list)), tail(list), func)

reduceRight(list([1, 2, 3, 4, 5]), sum)
reduceRight(list([1, 2, 3, 4, 5]), multiply)

const factorise = (n) => n == 1 ? 1 : n * factorise(n-1)

const factoriseIteratively = n => {
    const iter = (res, i) => 
        i <= 1 ? res : iter(res*i, i-1)
    return iter(1, n)
}

const stringifyRight = (initial, list) => list == null ? initial : head(list) + stringifyRight(initial, tail(list))

// Reduce left
const stringifyLeft = (initial, list) => list == null ? initial : stringifyLeft(initial, tail(list)) + head(list)
const stringifyLeftALT = (initial, list) => list == null ? initial : sum(stringifyLeft(initial, tail(list)), head(list))

const reduceLeft = (initial, list, func) => list == null ? initial : func(reduceLeft(initial, tail(list), func), head(list))
