
_Making Change_: You’re given an unlimited supply of coins of denominations `d\_1, d\_2, . . . , d\_k` (where each `d\_i` is a positive integer), and a positive integer number `n`.

Your goal is to give the amount n of money, using in total as few coins as possible.

More formally, you need to design an algorithm for the following problem.

_Given_: positive integers `d_1, d_2, . . . , d_k` and `n` (in binary).

_Find_: a sequence of nonnegative integers `v_1, v_2, . . . , v_k` (where each `v_i` is the number of coins of denomination `d_i`) so that the summation of denominations is `n` and is minimized.

(For example, for denominations `100, 25, 10, 5, 1`, the value `57` is best given using coins
`25 + 25 + 5 + 1 + 1`, for the total of `5` coins.)
