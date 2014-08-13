
#Your task is to build a function knight_moves that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

#You can think of the board as having 2-dimensional coordinates.
#Your function would therefore look like:
#knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
#knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
#knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]
#Put together a script that creates a game board and a knight.
#Treat all the possible moves the knight could make as children in a tree.
#Don't allow any moves to go off the board.
#Decide which search algorithm is best to use for this case.
#Hint: one of them could be a potentially infinite series.
#Use the chosen search algorithm to find the shortest path between the starting
# square (or node) and the ending square. Output what that full path looks like,
# e.g.:
#    > knight_moves([3,3],[4,3])
#    You made it in 3 moves!  Here's your path:
#    [3,3]
#    [4,5]
#    [2,4]
#    [4,3]

#takes position in form [0-7, 0-7]
#returns an array of all legal moves for a knight from one position
def possible_moves(position)
  x = position[0]
  y = position[1]
  possibles = []
  move_grid(x,y).each {|move| possibles << move if move_legal?(move)}
  possibles
end

def move_grid(x, y)
  [[x+2, y-1], [x+2, y+1], [x-2, y+1], [x-2, y-1],
   [x+1, y+2], [x-1, y+2], [x+1, y-2], [x-1, y-2]]
end

#checks if a move is legal for a knight from the current location
def move_legal?(move)
  return true if move[0].between?(0, 7) && move[1].between?(0,7)
  false
end

p possible_moves([6,7])
