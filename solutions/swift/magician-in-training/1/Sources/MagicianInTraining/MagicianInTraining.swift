func getCard(at index: Int, from stack: [Int]) -> Int {
  return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  guard index >= 0 && index < stack.count else { return stack }
  var result = stack
  result[index] = newCard
  return result
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
  var result = stack
  result.append(newCard)   // put on top = end of array
  return result
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  guard index >= 0 && index < stack.count else { return stack }
  var result = stack
  result.remove(at: index)
  return result
}

func insert(_ newCard: Int, at index: Int, from stack: [Int]) -> [Int] {
  // valid indices for insertion are 0...stack.count (including end)
  guard index >= 0 && index <= stack.count else { return stack }
  var result = stack
  result.insert(newCard, at: index)
  return result
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  return stack.count == size
}