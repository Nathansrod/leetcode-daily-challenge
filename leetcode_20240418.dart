// LeetCode Problem 2024-04-18
// 463. Island Perimeter
// Dart Solution by Nathan Silva Rodrigues

/**
 * top: i-1, j, i-1 > 0
 * right: i, j+1, j+1 < cols
 * bottom: i+1, j, i+1 < rows
 * left: i, j-1, j-1 > 0
 */

class Solution {
  int islandPerimeter(List<List<int>> grid) {
    int perimeter = 0;
    final rows = grid.length;
    final cols = grid[0].length;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == 1) {
          // Check top tile
          if (i - 1 < 0) {
            perimeter += 1;
          } else {
            if (grid[i - 1][j] == 0) perimeter += 1;
          }
          // Check right tile
          if (j + 1 >= cols) {
            perimeter += 1;
          } else {
            if (grid[i][j + 1] == 0) perimeter += 1;
          }
          // Check bottom tile
          if (i + 1 >= rows) {
            perimeter += 1;
          } else {
            if (grid[i + 1][j] == 0) perimeter += 1;
          }
          // Check left tile
          if (j - 1 < 0) {
            perimeter += 1;
          } else {
            if (grid[i][j - 1] == 0) perimeter += 1;
          }
        }
      }
    }
    return perimeter;
  }
}

void main(List<String> args) {
  final solution = Solution();
  var perimeter = solution.islandPerimeter([
    [0, 1, 0, 0],
    [1, 1, 1, 0],
    [0, 1, 0, 0],
    [1, 1, 0, 0]
  ]);
  print(perimeter);
  perimeter = solution.islandPerimeter([[1]]);
  print(perimeter);
  perimeter = solution.islandPerimeter([[1,0]]);
  print(perimeter);
}
