// define the 'ranks' constant
let ranks = 1...8

// define the 'files' constant
let files = "A"..."H"

func isValidSquare(rank: Int, file: String) -> Bool {
  return ranks.contains(rank) && files.contains(file.uppercased())
}

func getRow(_ board: [String], rank: Int) -> [String] {
  // ranks go 1..8, with 8 being the last row
  guard ranks.contains(rank) else { return [] }
  
  let start = (rank - 1) * 8
  let end = start + 7
  return Array(board[start...end])
}