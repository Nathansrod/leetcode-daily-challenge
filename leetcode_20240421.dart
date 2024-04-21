// LeetCode Problem 2024-04-21
// 1971. Find if Path Exists in Graph
// Dart Solution by Nathan Silva Rodrigues, adapted from ethulsr's solution

class Solution {
  bool validPath(int n, List<List<int>> edges, int source, int destination) {
    Map<int, List<int>> graph = {};
    for (final edge in edges) {
      final u = edge[0];
      final v = edge[1];
      graph.putIfAbsent(u, () => []);
      graph.putIfAbsent(v, () => []);
      graph[u]!.add(v);
      graph[v]!.add(u);
    }

    for (int i = 0; i < n; i++) {
      graph.putIfAbsent(i, () => []);
    }

    Set<int> visited = {};  // A set is faster than a list when working with large elements.
    List<int> stack = [];
    stack.add(source);

    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      if (node == destination) {
        return true;
      }
      visited.add(node);
      for (final neighbor in graph[node]!) {
        if (visited.contains(neighbor) == false) {
          stack.add(neighbor);
        }
      }
    }
    return false;
  }
}

void main(List<String> args) {
  final solution = Solution();
  solution.validPath(
      3,
      [
        [0, 1],
        [1, 2],
        [2, 0]
      ],
      0,
      2);
  solution.validPath(
      6,
      [
        [0, 1],
        [0, 2],
        [3, 5],
        [5, 4],
        [4, 3]
      ],
      0,
      5);
  solution.validPath(
      5,
      [
        [0, 4]
      ],
      0,
      4);
  solution.validPath(1, [], 0, 0);
}
