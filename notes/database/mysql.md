# Operators and Functions

Here m,n can be two numbers, a number and a string (string will be auto casted to number '100x' can be converted to 100 however 'x100x' will be NULL), a string and a string or column values

These operators can come in select or in where conditions

## Arithmetic Operators

| Operation | Operator |
|-----------|----------|
| Addition  |  m + n   |
| Subtraction | m - n  |
| Multiplication | m * n|
| Division       | m / n|
| Modulus        | m % n|

*Example*

These operators can be used in where condition as well

```sql
SELECT EnglishProductName,
       Color,
       StandardCost,
       SalesAmount,
       TaxAmt,
       SalesAmount + TaxAmt  AS 'Total Amount',
       SalesAmount - StandardCost AS 'Profit',
       SalesAmount * 2 AS 'Multiplication Ex',
       SalesAmount / TaxAmt,
       SalesAmount % TaxAmt
  FROM `MySQL Tutorial`.`product sales`;
  ```

## Math functions

| Function     | function name     |
|--------------|-------------------|
| absolute     |     abs(n)        |
| floor        |     floor(n)      |
| ceiling      |     ceil(n)       |
| rounding off n to D digits |     round(n, D)   |
| exponentiation |    pow(m, n)     |
| random number between 0 to 1 | rand() |
| random number with seed n, repeatable value | rand(n) |

## String functions

>NOTE : In MySQL string starts with base index as 1

| Function description                         | function                                |
|----------------------------------------------|-----------------------------------------|
| substring                                    |substring(col_name, start_index, number chars from start index inclusive of start index)|
| substring from left end                      |left(col_name, number of chars from left)|
| substring from right end                     |right(col_name, number of chars from right)|
| convert to lower case                        |lower(col_name or string_value) |
| convert to upper case                        |upper(col_name or string_value) |
| reverse a string or a col                    |reverse                         |
| join one or more strings                     |concat(one or more strings, columns) |
| measure length of string in bytes            |octet_length() / LENGTH() |
| measure length of string based on characters |CHAR_LENGTH() |

# limit and offset

- limit 10
- will return first 10 records

- limit 1, 10
- will start from row number 2 and return 10 records

- limit 10 offset 1
- will start from row number 2 and return 10 records

> Limit and Offsets are generally used for pagination
> It is better to use LIMIT no_of_records_to_be_returned OFFSET where_to_start_from for readability

## Pagination

```sql
SELECT * FROM tbl order by id asc LIMIT 5,10;
-- rows 6-15

-- both are same
SELECT id,name,description FROM tablename LIMIT 1000,25
SELECT id,name,description FROM tablename LIMIT 25 OFFSET 1000
```

## Performance for pagination

- https://use-the-index-luke.com/no-offset

# Where conditions

- Any function or operator can be used in where condition
- REGEXP and LIKE are used to totally different cases.
- LIKE is used to add wildcards to a string whereas REGEXP is used to match an attribute with Regular Expressions.
- LIKE is little bit more performant compared to regexp


# case..when..else

```mysql
SELECT CASE             
    WHEN A + B > C AND B + C > A AND A + C > B THEN
        CASE 
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR B = C OR A = C THEN 'Isosceles'
            ELSE 'Scalene'
        END
    ELSE 'Not A Triangle'
    END
from
triangles
```

# pivot table

```mysql
set @r1 = 0, @r2 = 0, @r3 = 0, @r4 = 0;

select min(Doctor), min(Professor), min(Singer), min(Actor)
from
(select case when Occupation='Doctor' then (@r1:=@r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) as T
group by RowNumber;
```

# Questions

- What is a storage engine ?

Storage engine is the core module used by a dbms to do CRUD operations on data.

- What are different types of Storage engines ? List all Storage Engines you know.

There are two types of storage engines in MySQL. They are:
1. Transactional
    - InnoDB
2. Non Transactional
    - MyISAM
    - Others
        - Memory
        - CSV
        - Merge
        - Archive
        - Federated
        - Example

> InnoDB and MyISAM are the most used ones.

- What storage engine do you use and why ?

- What type of field would you use to store currency information in a MySQL database?


One of the most common — and counterintuitive — is currency storage. Since we tend to write prices and transactions as decimals — for example, 19.95 — you might be tempted to use a FLOAT or DOUBLE field for currency storage. But for more applications, the most commonly-used field type is actually INTEGER.

Given the numerous field types above, which type to choose for various input formats can be a difficult, subjective decision. But there are some fairly common conventions across the tech world, and it can be helpful to know them before your interview.

Why is that? Because storing currency values as US Dollars in a field type like FLOAT can lead to rounding errors and other compatibility problems down the line.

As a solution, most currencies are stored in databases as INTEGER fields representing cents and not dollars. So, an item that costs $19.95 would be represented in a database as costing 1995 cents.

- Aggregate functions

SUM() — used to calculate the sum of various rows of data to find meaningful patterns and trends.
AVG() — used to find averages over large quantities of data.
COUNT() — used to count rows; particularly useful for aggregating quantity information.
MAX() and MIN() — used to find maximum and minimum values within a large set of data.

- UNION vs UNION ALL

- Full outer in mysql 

```sql
SELECT
	*
FROM 
	students
LEFT JOIN
	advisors ON students.advisor_id = advisors.advisor_id
UNION ALL
SELECT
	*
FROM
	students
RIGHT JOIN
	advisors ON students.advisor_id = advisors.advisor_id
WHERE
	students.advisor_id IS NULL;
```

- insert, delete and update

- comparison operators

<table class="table table-responsive table-striped" style="text-align: center; max-width: 400px; margin: 0 auto;">
  <thead>
    <tr>
      <th style="text-align: center;">Operator</th>
      <th style="text-align: center;">Meaning</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code class=" language-sql"><span class="token operator">=</span></code></td>
      <td>Equal to</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">&lt;&gt;</span></code> or <code class=" language-sql"><span class="token operator">!=</span></code></td>
      <td>Not equal to</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">&gt;</span></code></td>
      <td>Greater than</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">&gt;=</span></code></td>
      <td>Greater than or equal to</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">&lt;</span></code></td>
      <td>Less than</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">&lt;</span></code></td>
      <td>Less than or equal to</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">&gt;</span></code></td>
      <td>Greater than</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">IN</span><span class="token punctuation">(</span><span class="token punctuation">)</span></code></td>
      <td>Matches a value within another list</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">NOT</span></code></td>
      <td>The opposite of a given condition</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">BETWEEN</span><span class="token punctuation">(</span><span class="token punctuation">)</span></code></td>
      <td>Within a specified range (inclusive)</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">IS</span> <span class="token boolean">NULL</span></code></td>
      <td>Checks to see whether a given value is <code class=" language-sql"><span class="token boolean">NULL</span></code> (generally, <code class=" language-sql"><span class="token operator">=</span><span class="token boolean">NULL</span></code> does not work for this)</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">IS</span> <span class="token operator">NOT</span> <span class="token boolean">NULL</span></code></td>
      <td>Checks to see whether a given value is not <code class=" language-sql"><span class="token boolean">NULL</span></code> (generally, <code class=" language-sql"><span class="token operator">=</span><span class="token operator">!</span><span class="token boolean">NULL</span></code> does not work for this)</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token operator">LIKE</span></code></td>
      <td>Checks to see whether a given value matches a simple pattern using the <code class=" language-sql"><span class="token string">'%'</span></code> and <code class=" language-sql"><span class="token string">'_'</span></code> symbols</td>
    </tr>
    <tr>
      <td><code class=" language-sql"><span class="token keyword">EXISTS</span></code></td>
      <td>Returns <code class=" language-sql"><span class="token boolean">TRUE</span></code> if query matches at least one row in set</td>
    </tr>
  </tbody>
</table>