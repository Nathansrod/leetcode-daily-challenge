// LeetCode Problem 2024-04-20
// 1992. Find All Groups of Farmland
// Dart Solution by Nathan Silva Rodrigues

class Solution {
  int rows = 0;
  int cols = 0;

  List<List<int>> findFarmland(List<List<int>> land) {
    List<List<int>> farmlandCoordinates = [];
    rows = land.length;
    cols = land[0].length;
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (land[i][j] == 1) {
          final farm = findCorner(land, i, j);
          farmlandCoordinates.add(farm);
          markFarmland(land, farm);
        }
      }
    }

    print(farmlandCoordinates);
    return farmlandCoordinates;
  }

  List<int> findCorner(List<List<int>> land, int i, int j) {
    int iCorner = i;
    int jCorner = j;

    while (iCorner < rows && land[iCorner][j] != 0) {
      iCorner++;
    }
    iCorner--;

    while (jCorner < cols && land[i][jCorner] != 0) {
      jCorner++;
    }
    jCorner--;

    return [i, j, iCorner, jCorner];
  }

  void markFarmland(List<List<int>> land, List<int> farmCoodinates) {
    final iStart = farmCoodinates[0];
    final jStart = farmCoodinates[1];
    final iEnd = farmCoodinates[2];
    final jEnd = farmCoodinates[3];

    for (int i = iStart; i <= iEnd; i++) {
      for (int j = jStart; j <= jEnd; j++) {
        land[i][j] = 0;
      }
    }
  }
}

void main(List<String> args) {
  final solution = Solution();
  solution.findFarmland([[1,0,0],[0,1,1],[0,1,1]]);
  solution.findFarmland([[1,1],[1,1]]);
  solution.findFarmland([[0]]);
}