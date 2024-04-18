// LeetCode Problem 2024-04-12
// 42. Trapping Rain Water
// Dart Solution by Nathan Silva Rodrigues

class Solution {
  int trap(List<int> height) {
    var waterCounter = 0;
    for (int i = 0; i < height.length; i++) {
      final leftSide = findLeftSide(height, i);
      final rightSide = findRightSide(height, i);
      if (leftSide != null && rightSide != null) {
        if (leftSide <= rightSide) {
          waterCounter += leftSide - height[i];
        }
        else {
          waterCounter += rightSide - height[i];
        }
      }
    }
    return waterCounter;
  }

  int? findLeftSide(List<int> height, int index) {
    int? leftSide = null;
    for (int i = index; i >= 0; i--) {
      if (height[i] > height[index]) {
        if (leftSide == null || height[i] > leftSide) {
          leftSide = height[i];
        }
      }
    }
    return leftSide;
  }

  int? findRightSide(List<int> height, int index) {
    int? rightSide = null;
    for (int i = index; i < height.length; i++) {
      if (height[i] > height[index]) {
        if (rightSide == null || height[i] > rightSide) {
          rightSide = height[i];
        }
      }
    }
    return rightSide;
  }
}

void main(List<String> args) {
  var result;
  final solution = Solution();

  result = solution.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]);
  print(result);
  result = solution.trap([4, 2, 0, 3, 2, 5]);
  print(result);
}
