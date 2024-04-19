// LeetCode Problem 2024-04-19
// 200. Number of Islands
// Dart Solution by Nathan Silva Rodrigues

class Solution {
  int rows = 0;
  int cols = 0;

  int numIslands(List<List<String>> grid) {
    int islandCounter = 0;
    rows = grid.length;
    cols = grid[0].length;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (grid[i][j] == '1') {
          islandCounter += 1;
          mapIsland(grid, i, j);
        }
      }
    }
    print(grid);
    print(islandCounter);
    return islandCounter;
  }

  void mapIsland(List<List<String>> grid, int i, int j) {
    if (i < 0 || i >= rows || j < 0 || j >= cols) {
      return;
    }
    if (grid[i][j] == '0') {
      return;
    }
    grid[i][j] = '0';
    mapIsland(grid, i, j-1);
    mapIsland(grid, i-1, j);
    mapIsland(grid, i, j+1);
    mapIsland(grid, i+1, j);
    return;
  }
}

void main(List<String> args) {
  final solution = Solution();
  solution.numIslands([["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]);
  solution.numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]);
  solution.numIslands([["1","1","1"],["0","1","0"],["1","1","1"]]);
}
