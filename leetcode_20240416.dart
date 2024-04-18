// LeetCode Problem 2024-04-16
// 623. Add One Row to Tree
// Dart Solution by Nathan Silva Rodrigues

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? addOneRow(TreeNode? root, int val, int depth) {
    if (depth > 1) {
      recursiveAddOneRow(root, val, depth);
      return root;
    }
    else {
      return TreeNode(val, root, null);
    }
  }

  TreeNode? recursiveAddOneRow(TreeNode? root, int val, int depth) {
    if (root != null && depth > 1) {
      TreeNode? nodeLeft = recursiveAddOneRow(root.left, val, depth - 1);
      if (depth - 1 == 1) {
        addIntermediaryNode(root, nodeLeft, val, true);
      }
      TreeNode? nodeRight = recursiveAddOneRow(root.right, val, depth - 1);
      if (depth - 1 == 1) {
        addIntermediaryNode(root, nodeRight, val, false);
      }
    }
    if (depth == 1) {
      return root;
    }
    return null;
  }

  void addIntermediaryNode(
      TreeNode parent, TreeNode? child, int val, bool isLeftChild) {
    if (isLeftChild) {
      final newNode = TreeNode(val, child, null);
      parent.left = newNode;
    } else {
      final newNode = TreeNode(val, null, child);
      parent.right = newNode;
    }
  }
}
