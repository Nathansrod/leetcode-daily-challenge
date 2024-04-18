// LeetCode Problem 2024-04-17
// 988. Smallest String Starting From Leaf
// Dart Solution by Nathan Silva Rodrigues

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> smallestPath = [];
  List<int> currentPath = [];

  String smallestFromLeaf(TreeNode? root) {
    depthSearch(root);
    String smallestPathString = "";
    smallestPath.forEach((val) {
      smallestPathString += convertToChar(val);
    });
    return smallestPathString;
  }

  TreeNode? depthSearch(TreeNode? node) {
    if (node != null) {
      currentPath.insert(0, node.val);
      if (depthSearch(node.left) != null && currentPath.length > 0) {
        currentPath.removeAt(0);
      }
      if (depthSearch(node.right) != null && currentPath.length > 0) {
        currentPath.removeAt(0);
      }
      if (isLeaf(node)) {
        comparePaths();
      }
      return node;
    }
    return null;
  }

  bool isLeaf(TreeNode node) {
    if (node.left == null && node.right == null) {
      return true;
    }
    return false;
  }

  void comparePaths() {
    print(smallestPath);
    print(currentPath);
    if (smallestPath.length == 0) {
      smallestPath = [...currentPath];
      return;
    }
    final limit = smallestPath.length < currentPath.length ? smallestPath.length : currentPath.length;
    for (int i = 0; i < limit; i++) {
      if (currentPath[i] < smallestPath[i]) {
        smallestPath = [...currentPath];
        return;
      }
      else if (currentPath[i] > smallestPath[i]) {
        return;
      }
    }
    if (currentPath.length < smallestPath.length) {
        smallestPath = [...currentPath];
        return;
    }
  }

  String convertToChar(int val) {
    return String.fromCharCode(val + 97);
  }
}
