// LeetCode Problem 2024-04-15
// 129. Sum Root to Leaf Numbers
// Dart Solution by Nathan Silva Rodrigues

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> stack = [];
  List<int> values = [];

  int sumNumbers(TreeNode? root) {
    depthSearch(root);
    int sum = 0;
    values.forEach((element) {
      sum += element;
    });
    return sum;
  }

  void depthSearch(TreeNode? node) {
    if (node != null) {
      stack.add(node.val);
      depthSearch(node.left);
      depthSearch(node.right);
      if (node.left == null && node.right == null) {
        addStackToValues();
      }
      stack.removeLast();
    }
  }

  void addStackToValues() {
    values.add(int.parse(stack.join('')));
  }
}