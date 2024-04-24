## LeetCode Problem 2024-04-24
## 1137. N-th Tribonacci Number
## Python Solution by Nathan Silva Rodrigues

class Solution:
    def tribonacci(self, n: int) -> int:
        triboList = [0,1,1]

        if (n == 0):
            return 0
        if (n == 1 or n == 2):
            return 1

        while (n > 2):
            triboList.append(triboList[0] + triboList[1] + triboList[2])
            triboList.pop(0)
            n -= 1
            
        print(triboList)
        return triboList[-1]