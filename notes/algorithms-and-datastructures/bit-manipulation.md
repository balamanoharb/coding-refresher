## Bit wise operators

| Operation | Operator |
|-----------|----------|
|   AND     |    &     |
|   OR      |    \|    |
|   NOT     |    ~     |
|   XOR     |    ^     |
| Left Shift|    <<    |
| Right Shift|   >>    |

## Bit wise Operators properties

### AND

```
1 & 1 = 1
0 & 0 = 0
1 & 0 = 0
0 & 1 = 0
```

```
 x & 0s = 0
 x & 1s = x
 x & x = x
 ```

### OR

```
1 | 1 = 1
0 | 0 = 0
1 | 0 = 1
0 | 1 = 1
```

```
x | 0s = x
x | 1s = 1s
x | x = x
```

### NOT

```
~1 = 0
~0 = 1
```

### XOR


```
1 ^ 1 = 0
0 ^ 0 = 0
1 ^ 0 = 1
0 ^ 1 = 1
```

```
x ^ 0s = x
x ^ 1s = ~x
x ^ x = 0
```

### Right Shift

- Arthimetic right shift is division by 2
- Here, the sign bit will be preserved and the shifting occurs in the remaining bits (most significant bits)


-70 (negative) in 8 bit representation

| 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|

-70 >> 1 = -35

| 1 | 0 | 1 | 0 | 0 | 0 | 1 | 1 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|


### Left Shift

- Left Shift is multiplication by 2
- Similar to right shift, we shift values to the left and fill the remaininng bits (least significant bits)

-70 (negative) in 8 bit representation

| 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 0 |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|

-70 << 1 = -140

| 1 | 1 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|


## Number representation

- Computers store numbers as two's complement.
- A positive number is represented as itself.
- A negative number is represented as two's complement of its absolute value with 1 in its sign bit to indicate negative value.
- The binary representation of -K (negative K) as a N-bit number is concat(1, 2<sup>N - 1</sup> - K).
- This is same as flipping all bits except the sign bit and adding one to it (i.e)
For Eg.

7 -> 0111
Two's complement -> sign bit is reserved. so (1000 + 1) = 1001

|   |       |    |        |
|---|-------|----|--------|
| 7 | 0 111 | -1 | 1 111  |
| 6 | 0 110 | -2 | 1 110  |
| 5 | 0 101 | -3 | 1 101  |
| 4 | 0 100 | -4 | 1 100  |
| 3 | 0 011 | -5 | 1 011  |
| 2 | 0 010 | -6 | 1 010  |
| 1 | 0 001 | -7 | 1 001  |
| 0 | 0 000 |    |        |

### 1's complement vs 2's complement

- In 1's complement is flipping of all bits in a number
Eg. 1's complement of 7 -> 0111 is 1000
- To identify negative and positive, 1's complement needs the most significant bit to be reserved. For positive numbers this bit is set to 0. For negative this bit is set to 1.
- Draw back of 1's complement is 0 can be represented as both positive and negative. It needs different handling for positive and negative.


## Bit Hacks

### set a bit

```
num | (1 << pos)
```

- x | 1 is 1.

### Unset or clear 

#### 1 bit

```
num & (~(1 << pos))
```

- x | 0 is 0.

#### unset everything except last n bits

```ruby
num & ((1 << n) - 1)

# 1 << 4 = 0001000 = 16
# 16 - 1 = 0000111
# 
```

### Update a bit with given bit

```
given = is_bit_1? ? 1 : 0
mask = =(1 << i);
(num & mask) I (value << i);
```

### Extract a bit at given position

```
num & (1<<pos)
```

### To toggle a bit

```
num ^ (1 << pos)
```

1. Check if an given integer is even or odd
2. Detect if two integers have opposite signs or not
3. Add 1 to a given integer
4. Swap two numbers without using any third variable
5. Turn off kth bit in a number
6. Turn on kth bit in a number
7. Check if kth bit is set for a number
8. Toggle the kth bit
9. Check if given positive integer is a power of 2 without using any branching or loop
10. Find position of the rightmost set bit
11. Find position of the only set bit in a number
12. Computing parity of a number (Naive solution)
13. Convert uppercase character to lowercase
14. Convert lowercase character to uppercase
15. Invert alphabet’s case
16. Find letter’s position in alphabet
17. Given an integer, compute its absolute value (abs) without branching
18. Find number of bits needed to be flipped to convert given integer to another
19. Check if binary representation of a number is palindrome or not
20. Find XOR of two numbers without using XOR operator

Refs
1. https://www.youtube.com/watch?v=ZusiKXcz_ac
2. https://leetcode.com/problems/sum-of-two-integers/discuss/84278/A-summary%3A-how-to-use-bit-manipulation-to-solve-problems-easily-and-efficiently