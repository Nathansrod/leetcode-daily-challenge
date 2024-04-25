// LeetCode Problem 2024-04-25
// 2370. Longest Ideal Subsequence
// Dart Solution by Nathan Silva Rodrigues, adapted from Alam_04's solution

class Solution {
  int longestIdealString(String s, int k) {
    List<int> lengths = List.filled(27, 0);
    List<String> letters = s.split('');
    int index = 0;
    int maxVal = -1;
    int rangeLeft = 0;
    int rangeRight = 0;

    for (int i = letters.length-1; i >= 0; i--) {
      index = letters[i].codeUnitAt(0) - 97;
      maxVal = -1;
      rangeLeft = max((index - k), 0);
      rangeRight = min((index + k), 26);

      for (int j = rangeLeft; j <= rangeRight; j++) {
        maxVal = max(maxVal, lengths[j]);
      }

      lengths[index] = maxVal + 1;
    }

    maxVal = maxValueOfList(lengths);
    return maxVal;
  }

  int max(int a, int b) {
    if (a > b) {
      return a;
    }
    return b;
  }

  int min(int a, int b) {
    if (a < b) {
      return a;
    }
    return b;
  }

  int maxValueOfList(List<int> list) {
    int max = -1;
    for (int i = 0; i < list.length; i++) {
      if (list[i] > max) {
        max = list[i];
      }
    }
    return max;
  }
}

void main(List<String> args) {
  final solution = Solution();
  solution.longestIdealString("acfgbd", 2);
  solution.longestIdealString("abcd", 3);
}