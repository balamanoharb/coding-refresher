# 1. TOC

<!-- TOC -->

- [1. TOC](#1-toc)
  - [1.1. DataTypes](#11-datatypes)
  - [1.2. Truthy and Falsy values](#12-truthy-and-falsy-values)
  - [1.3. Check for null values](#13-check-for-null-values)
    - [1.3.1. check if variable, method or class is defined](#131-check-if-variable-method-or-class-is-defined)
    - [1.3.2. check if variable has any value](#132-check-if-variable-has-any-value)
    - [1.3.3. check if string is empty](#133-check-if-string-is-empty)
    - [1.3.4. check if array is empty](#134-check-if-array-is-empty)
    - [1.3.5. check if hash is empty](#135-check-if-hash-is-empty)
  - [1.4. Sentinal Values](#14-sentinal-values)
    - [1.4.1. INFINITY](#141-infinity)
    - [1.4.2. convert to 32 bit signed integers](#142-convert-to-32-bit-signed-integers)
  - [1.5. Strings](#15-strings)
    - [1.5.1. String Mutability](#151-string-mutability)
    - [1.5.2. Looping Strings](#152-looping-strings)
      - [1.5.2.1. each_char](#1521-each_char)
      - [1.5.2.2. to char array](#1522-to-char-array)
      - [1.5.2.3. each_char with_index](#1523-each_char-with_index)
    - [1.5.3. Strings and ASCII](#153-strings-and-ascii)
      - [1.5.3.1. convert string to unicode array](#1531-convert-string-to-unicode-array)
      - [1.5.3.2. convert char to ascii value](#1532-convert-char-to-ascii-value)
      - [1.5.3.3. sum of ascii values of string](#1533-sum-of-ascii-values-of-string)
      - [1.5.3.4. ascii to char](#1534-ascii-to-char)
  - [1.6. Conditional Statements](#16-conditional-statements)
    - [1.6.1. IF..ELSE](#161-ifelse)
    - [1.6.2. SWITCH](#162-switch)
  - [1.7. Loops - Procedural](#17-loops---procedural)
    - [1.7.1. while](#171-while)
  - [1.8. Loops - Functional](#18-loops---functional)
    - [1.8.1. map (alias - collect - came from smalltalk)](#181-map-alias---collect---came-from-smalltalk)
    - [1.8.2. reduce (alias - inject)](#182-reduce-alias---inject)
    - [1.8.3. find (alias - detect)](#183-find-alias---detect)
    - [1.8.4. select](#184-select)
    - [1.8.5. reject](#185-reject)
  - [1.9. Pass by Value vs Pass by Reference](#19-pass-by-value-vs-pass-by-reference)
  - [1.10. Scoping](#110-scoping)
  - [1.11. Arrays](#111-arrays)
    - [1.11.1. must know methods](#1111-must-know-methods)
    - [1.11.2. methods and complexities](#1112-methods-and-complexities)
    - [1.11.3. Filling Arrays with default values](#1113-filling-arrays-with-default-values)
    - [1.11.4. each and each_with_index](#1114-each-and-each_with_index)
  - [1.12. Hash](#112-hash)
    - [Hash with default values](#hash-with-default-values)
    - [1.12.1. implementation details](#1121-implementation-details)
  - [1.13. Set](#113-set)
  - [1.14. Queue](#114-queue)
  - [1.15. Threads](#115-threads)

<!-- /TOC -->

## 1.1. DataTypes

- Booleans
    - *true* - TrueClass
    - *false* - FalseClass
- Symbols
- Numbers
- Strings
- Arrays
- Hashes
- Set (needs to include library)
- Queue (present in Thread::Queue)

## 1.2. Truthy and Falsy values

- falsy values = **nil** and **false**
- everything else is true. even including
    - 0 - numeric zero
    - "" - Empty strings
    - "0" - String 0
    - "\n" - Strings containing only whitespace
    - [] - Empty arrays
    - {} - Empty hashes

- use !! double bang, to convert any value to truthy or falsy values

```ruby
puts !!my_value
```

## 1.3. Check for null values

### 1.3.1. check if variable, method or class is defined

- defined? is a keyword
- returns **nil** or **string described what the variable is**

```ruby
defined? my_val
# returns local-variable, method or constant
```

### 1.3.2. check if variable has any value

```ruby
my_val.nil?
# returns true or false
```

- since only *nil* and *false* evaluates to false, different object should be checked differently

### 1.3.3. check if string is empty

```ruby
my_val = ""
my_val.empty?
# returns true
```

> NOTE : empty? is not part of Numeric or nil.
> empty? should be used only if you are expecting something other than nil or number

### 1.3.4. check if array is empty

```ruby
my_array = []
my_array.empty?
# same as my_array.length == 0
```

### 1.3.5. check if hash is empty

```ruby
my_hash = {}
my_hash.empty?
# same as my_hash.length == 0
```

## 1.4. Sentinal Values

### 1.4.1. INFINITY

```ruby
Inf = Float::INFINITY
NegInf = -Float::INFINITY

require "bigdecimal"
BigDecimal::INFINITY
```

### 1.4.2. convert to 32 bit signed integers

```ruby
my_num = Array(my_num).pack('l').unpack('l').first
#   l         | Integer | 32-bit signed, native endian (int32_t)
#   q         | Integer | 64-bit signed, native endian (int64_t)
```

## 1.5. Strings

### 1.5.1. String Mutability

- Except Boolean, Numeric, nil, and Symbol all objects are mutable
- strings are mutable in ruby
- behaves just like any other object

```ruby
x = "abc"
x.object_id
# 797419909313
x[0] = "ap"
x
# apbc
x.object_id
# 797419909313
```

- the object_id doesn't change

### 1.5.2. Looping Strings

#### 1.5.2.1. each_char

```ruby
s = "abcd"
s.each_char do |val|
# use char
end
```

#### 1.5.2.2. to char array

```ruby
s = "abcd"
s.chars
# returns ["a", "b", "c", "d"]
# shortcut for s.each_char.to_a
```

#### 1.5.2.3. each_char with_index

```ruby
s = "abcd"
s.each_char.with_index do |val, index|
# use char val and index
end
```

### 1.5.3. Strings and ASCII

#### 1.5.3.1. convert string to unicode array

- returns unicode array (in utf-8 first 127 are same as ascii)

```ruby
s = "abcd"
s.codepoints
# returns array [97, 98, 99, 100]
```

#### 1.5.3.2. convert char to ascii value

- returns ascii code of first character in a string

```ruby
s = "a"
s.ord #=> 97
s = "abcd"
s.ord #=> 97
```

#### 1.5.3.3. sum of ascii values of string

```ruby
s = "a"
s.sum #=> 97
s = "abcd"
s.sum #=> 394
```

#### 1.5.3.4. ascii to char

```ruby
97.chr #=> returns a
```

## 1.6. Conditional Statements

### 1.6.1. IF..ELSE

```ruby
if condition
  puts "some stuff"
elsif condition
  puts "some stuff"
else condition
  puts "some stuff"
end
```

### 1.6.2. Switch Case

```ruby
case x
when 1..5
  "It's between 1 and 5"
when 6
  "It's 6"
when "foo", "bar"
  "It's either foo or bar"
when String
  "You passed a string"
else
  "You gave me #{x} -- I have no idea what to do with that."
end
```

## 1.7. Loops - Procedural

### 1.7.1. while

```ruby
counter = 0
while(counter < 100)
  counter += 1
end
```

## 1.8. Loops - Functional

- map, reduce, find, select, reject

### 1.8.1. map (alias - collect - came from smalltalk)

```ruby
[1,2,3,4,5,6,7,8,9,10].map{|e| e*3 }
# returns [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
```

### 1.8.2. reduce (alias - inject)

```ruby
start_val = 0
[1,2,3,4,5].reduce(start_val) {|accumulator, current| accumulator + current }
# start val is optional
# returns 15
```

### 1.8.3. find (alias - detect)

```ruby
[1,2,3,4,5,6,7,8,9,10].find{|el| el / 2 == 2 }
# returns 4
```

### 1.8.4. select

```ruby
[1,2,3,4,5,6,7,8,9,10].select{|el| el%2 == 0 }
# returns [2,4,6,8,10]
```

### 1.8.5. reject

```ruby
[1,2,3,4,5,6,7,8,9,10].reject{|e| e==2 || e==8 }
# returns [1, 3, 4, 5, 6, 7, 9, 10]
```

## 1.9. Pass by Value vs Pass by Reference

- since ruby doesn't have primitive data types and everything is an object, everything is passed by reference.
- However only the immutable objects Boolean, Numeric, nil, and Symbol remain un affected by changes that happens inside the function.

## 1.10. Scoping

## 1.11. Arrays

### 1.11.1. must know methods

- push, pop
- shift, unshift
- length
- insert
- delete, delete_at, delete_if
- clear
- include?
- find_index
- join
- compact - remove nil elements
- flatten
- permutation
- combination
- slice
- splice
- sort, sort_by
- uniq, unique!

### 1.11.2. methods and complexities

| method name    | complexity | Why                  | Source                                                                           |
| -------------- | ---------- | -------------------- | -------------------------------------------------------------------------------- |
| uniq , uniq!   | O(n)       | uses hash internally |                                                                                  |
| push , pop     | O(n)       | amortized            |                                                                                  |
| shift, unshift | O(n)       | amortized            | [ref](https://bobhutchison.wordpress.com/2006/09/23/rubys-arrayshift-is-shifty/) |
| slice, splice  |

insert(pos, element1, element2, ...)

### 1.11.3. Filling Arrays with default values

```
default_value = my_val
[default_value] * n_times
```

NOTE : don't use Array.new(size, value) since same reference value will copied to all array indices.

### 1.11.4. each and each_with_index

```ruby
arr.each_with_index do |element, index|
  # do something with element and indexs
end
```

## 1.12. Hash

### Hash with default values

```ruby
# Hash.new(default_value)
t = Hash.new(0)
t[100] += 1
```

### 1.12.1. implementation details

- https://anadea.info/blog/how-hash-table-works-ruby-examples
- https://www.rubyguides.com/2017/02/hash-tables-explained/

## 1.13. Set

## 1.14. Queue

## 1.15. Threads


https://ruby-doc.org/core-2.1.1/Array.html#method-i-bsearch

https://github.com/ThibaultJanBeyer/cheatsheets/blob/master/Ruby-Cheatsheet.md

http://www.cheat-sheets.org/saved-copy/RubyCheat.pdf

https://www.codeconquest.com/language-cheat-sheets/ruby-cheat-sheet/

$! - latest error message
$@ - location of error
$_ - string last read by gets
$. - line number last read by interpreter
$& - string last matched by regexp
$~ - the last regexp match, as an array of subexpressions
$n - the nth subexpression in the last match (same as $~[n])
$= - case-insensitivity flag
$/ - input record separator
$\ - output record separator
$0 - the name of the ruby script file
$* (or ARGV) - the command line arguments
$$ - interpreter’s process ID
$? - exit status of last executed child process
$-i $-l $-p $-v - Command line switches
$-v (or $VERBOSE) - verbose mode