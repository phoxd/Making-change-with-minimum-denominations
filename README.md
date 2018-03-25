
_Making Change_: You’re given an unlimited supply of coins of denominations `d_1, d_2, . . . , d_k` (where each `d_i` is a positive integer), and a positive integer number `n`.

Your goal is to give the amount n of money, using in total as few coins as possible.

More formally, you need to design an algorithm for the following problem.

_Given_: positive integers `d_1, d_2, . . . , d_k` and `n` (in binary).

_Find_: a sequence of nonnegative integers `v_1, v_2, . . . , v_k` (where each `v_i` is the number of coins of denomination `d_i`) so that the summation of denominations is `n` and is minimized.

(For example, for denominations `100, 25, 10, 5, 1`, the value `57` is best given using coins
`25 + 25 + 5 + 1 + 1`, for the total of `5` coins.)

<details>
	<summary>**Solution**</summary>

_Step 1_: For `0 <= i <= k` and `0 <= j <= n`, define `A(i,j)` as the smallest number of coins required to pay the amount `j` when using only coins of denominations `d_1, ..., d_i`. (If it is possible to get a change for `j` using only `d_1, ..., d_i`, we say that `A(i, j) = Infinity`.) The optimal value is then `A(k, n)`.

_Step 2_: `A(i, 0) = 0` for all `1 <= i <= k`, and `A(0, j) = Infinity` for all `0 <= j <= n`.

For `i > 0` and `j > 0`:
	
if `j < d_i` then `A(i, j) = A(i - 1, j)`
else `A(i, j) = min{A(i - 1, j), 1 + A(i, j- d_i)}` 
	
_Step 3_: Compute the values in the array `A`:

```
for i : 1..k
	A[i, 0] <- 0
for j : 0..n 
	A[j, 0] <- Infinity
	
for i : 1..k
	for J : 1..n
		if j < d[i] then A[i, j] <- A[i - 1, j]
		else A[i, j] <- min{A[i - 1, j], 1 + A[i, j - d[i]]}
```
_Step 4_: Extract Solution for `PrintOpt(k, n)` if `A[k, n] /= Infinity`

```
PrintOpt(i, j) {
	if j = 0 then return;
	if A[i, j] = A[i - 1, j] then PrintOpt(i - 1, j);
	else {
		PrintOpt(i, j - d[i]);
		print d[i];
	}
```
	
</details>
	
