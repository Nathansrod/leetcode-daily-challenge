// LeetCode Problem 2024-04-13
// 85. Maximal Rectangle
// Dart Solution by Nathan Silva Rodrigues
// INCOMPLETE

class Solution {
  int maximalRectangle(List<List<String>> matrix) {
    var rectangleCounter = 0;
    final rows = matrix.length;
    final cols = matrix[0].length;
    return rectangleCounter;
  }
}

void main(List<String> args) {
  final solution = Solution();
  int result;

  result = solution.maximalRectangle([
    ["1", "0", "1", "0", "0"],
    ["1", "0", "1", "1", "1"],
    ["1", "1", "1", "1", "1"],
    ["1", "0", "0", "1", "0"]
  ]);
  print(result);

  result = solution.maximalRectangle([
    ["1", "0"],
    ["1", "0"],
  ]);
  print(result);

  result = solution.maximalRectangle([
    ["1", "0", "1", "1", "1"],
  ]);
  print(result);

  result = solution.maximalRectangle([
    ["1"],
    ["1"],
    ["0"],
    ["1"],
    ["1"],
    ["1"],
    ["1"],
    ["1"],
    ["1"],
    ["1"],
  ]);
  print(result);

  result = solution.maximalRectangle([
    ["0"]
  ]);
  print(result);

  result = solution.maximalRectangle([
    ["1"]
  ]);
  print(result);
}
