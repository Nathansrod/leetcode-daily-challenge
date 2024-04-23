// LeetCode Problem 2024-04-23
// 310. Minimum Height Trees
// Dart Solution by Nathan Silva Rodrigues, based on cs_iitian's solution.

class Solution {
  List<int> findMinHeightTrees(int n, List<List<int>> edges) {
    Map<int, List<int>> graph = {};
    Set<int> leaves = {};

    if (n == 1) {
      return [0];
    }

    // Create graph
    for (final edge in edges) {
      final u = edge[0];
      final v = edge[1];
      graph.putIfAbsent(u, () => []);
      graph.putIfAbsent(v, () => []);
      graph[u]!.add(v);
      graph[v]!.add(u);
    }

    while (graph.length > 2) {
      graph.forEach((node, children) {
        if (children.length == 1) {
          leaves.add(node);
        }
      });
      while (leaves.isNotEmpty) {
        final leaf = leaves.first;
        leaves.remove(leaf);
        graph[leaf]!.forEach((child) {
          graph[child]!.remove(leaf);
        });
        graph.remove(leaf);
      }
    }

    print(graph.keys.toList());
    return graph.keys.toList();
  }
}

void main(List<String> args) {
  final solution = Solution();

  solution.findMinHeightTrees(4, [
    [1, 0],
    [1, 2],
    [1, 3]
  ]);
  solution.findMinHeightTrees(6, [
    [3, 0],
    [3, 1],
    [3, 2],
    [3, 4],
    [5, 4]
  ]);
}
