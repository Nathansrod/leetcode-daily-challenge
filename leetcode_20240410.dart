// LeetCode Problem 2024-04-10
// 950. Reveal Cards In Increasing Order
// Dart Solution by Nathan Silva Rodrigues

class Solution {
  List<int> deckRevealedIncreasing(List<int> deck) {
    deck.sort();
    final reverseDeck = deck.reversed.toList();
    final List<int> sortedDeck = [];
    reverseDeck.forEach((card) {
      addCardToDeck(sortedDeck, card);
    });
    return sortedDeck;
  }

  void addCardToDeck(List<int> deck, int card) {
    deck.insert(0, card);
    if (deck.length > 2) {
      final lastCard = deck.removeLast();
      deck.insert(1, lastCard);
    }
  }
}

void main(List<String> args) {
  final solution = Solution();
  print(solution.deckRevealedIncreasing([17,13,11,2,3,5,7]));
}
