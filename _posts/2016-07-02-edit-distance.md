---
published: true
layout: post
title: Edit Distance
tags:
  - leetcode
  - algorithm
categories: programming
---

### introduction

[Edit Distance](https://en.wikipedia.org/wiki/Edit_distance) is a famous [algorithm problem](https://leetcode.com/problems/edit-distance/) solved by dynamic programming. I heard it for multiple times, until now I understand the solution after having an algorithm class.

### problem

Given two strings `word1` and `word2`, everytime we are allowed to `insert`, `delete`, `replace` a character of `word1`. Return the minimum number of steps to convert `word1` to `word2`.

### solutions

#### DFS

It's not the common solution, using depth-first search for this problem. But it's still worthy of mentioning.

The time complexity is around $O(4^(2n))$ while space complexity is around $O(n)$, also considering the time introduced by `.substring()` here. Even after optimizing `.substring()` the time is still exponential.

```java
public class Solution {
    public int minDistance(String word1, String word2) {
        // dfs

        // base case
        if (word1.length() == 0) {
          return word2.length();
        }
        if (word2.length() == 0) {
          return word1.length();
        }

        // recursive rules
        int nothing = Integer.MAX_VALUE;
        if (word1.charAt(0) == word2.charAt(0)) {
          nothing = minDistance(word1.substring(1), word2.substring(1));
        }
        int replace = 1 + minDistance(word1.substring(1), word2.substring(1));
        int delete = 1 + minDistance(word1.substring(1), word2);
        int insert = 1 + minDistance(word1, word2.substring(1));
        return Math.min(Math.min(nothing, replace), Math.min(delete, insert));
    }
}
```

#### Dynamic Programming

We use `dp[i][j]` to store the min num of steps transfering from `word1.substring(0, i)` to `word2.substring(0, j)`.

The time complexity is $O(n^2)$ and the space complexity is also $O(n^2)$.

```java
public class Solution {
    public int minDistance(String word1, String word2) {
        int[][] dp = new int[word1.length() + 1][word2.length() + 1];

        // base rule
        dp[0][0] = 0;
        for (int i = 1; i <= word1.length(); ++i) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= word2.length(); ++j) {
            dp[0][j] = j;
        }

        for (int i = 1; i <= word1.length(); ++i) {
            for (int j = 1; j <= word2.length(); ++j) {
                // induction rules

                // word1 = word1Sub + word1LC // word1LC is the Last Char
                // word2 = word2Sub + word2LC // word2LC is the Last Char

                // case 1: nothing
                // word1LC == word2LC
                // distance(word1, word2) = distance(word1Sub, word2Sub)
                int nothing = Integer.MAX_VALUE;
                if (word1.charAt(i - 1) == word2.charAt(j - 1)) {
                    nothing = dp[i - 1][j - 1];
                }

                // case 2: replace
                // distance(word1Sub + (word1LC), word2Sub + (word2LC)) = 1 + distance(word1Sub, word2Sub)
                int replace = 1 + dp[i - 1][j - 1];

                // case 3: delete
                // distance(word1Sub + (word1LC), word2) = 1 + distance(word1Sub, word2)
                int delete = 1 + dp[i - 1][j];

                // case 4: insert
                // distance(word1 + (word2LC), word2Sub + (word2LC)) = 1 + distance(word1, word2Sub)
                int insert = 1 + dp[i][j - 1];

                // fill the dp[][]
                dp[i][j] = Math.min(Math.min(nothing, replace), Math.min(delete, insert));
            }
        }

        return dp[word1.length()][word2.length()];
    }
}
```

Of course, the above code could be shortened, but in fact the same:

```java
public class Solution {
    public int minDistance(String word1, String word2) {
        int[][] dp = new int[word1.length() + 1][word2.length() + 1];

        for (int i = 0; i <= word1.length(); ++i) {
            for (int j = 0; j <= word2.length(); ++j) {
                if (i == 0 || j == 0) {
                    if (i == 0) {
                        dp[i][j] = j;
                    } else {
                        dp[i][j] = i;
                    }
                    continue;
                }

                if (word1.charAt(i - 1) == word2.charAt(j - 1)) {
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    dp[i][j] = 1 + Math.min(dp[i - 1][j - 1],
                        Math.min(dp[i - 1][j], dp[i][j - 1]));
                }
            }
        }

        return dp[word1.length()][word2.length()];
    }
}
```

#### even better Dynamic Programming

Note that we only care about the current and the previous rows of `dp[][]` while filling it. As a result, we only need to keep track of the current and previous rows instead of `n` rows! Then the time is still $O(n^2)$ but the space becomes $O(n)$.

```java
public class Solution {
    public int minDistance(String word1, String word2) {
        int[][] dp = new int[2][word2.length() + 1]; // only 2 rows needed

        int prevRow = 1;
        int currRow = 0;

        for (int i = 0; i <= word1.length(); ++i) {
            for (int j = 0; j <= word2.length(); ++j) {
                prevRow = 1 - i % 2; // toggle between 0 and 1
                currRow = i % 2;

                if (i == 0 || j == 0) {
                    if (i == 0) {
                        dp[currRow][j] = j;
                    } else {
                        dp[currRow][j] = i;
                    }
                    continue;
                }

                if (word1.charAt(i - 1) == word2.charAt(j - 1)) {
                    dp[currRow][j] = dp[prevRow][j - 1];
                } else {
                    dp[currRow][j] = 1 + Math.min(dp[prevRow][j - 1], Math.min(dp[prevRow][j], dp[currRow][j - 1]));
                }
            }
        }

        return dp[currRow][word2.length()];
    }
}
```

### End

Edit Distance problem is important because it's the typical 2D dynamic programming example.
