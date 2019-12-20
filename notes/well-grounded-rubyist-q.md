- Question

<details>
<summary>Answer</summary>

```ruby
```

</details>

## Chapter 11

- RegExp
    - use literal syntax to create an empty regex
    - how to use regex in if statement
    - what's the difference between match method and the =~ operator
    - how to get MatchData object when using =~ operator ($~)
    - how to create a character class
    - special characters that represent character classes
        - all digits
        - all non digits
        - words
        - non wordssp
        - white space
        - non white space
    - match method
        - how to get the entire matched string
            - what's the global variable where this is stored
        - how to get the sub class matched string. how does it work
            - what are the corresponding global variables
            - what's the downside of using global variables for this.
        - how to use array operator [] and capture method on MatchData object to get
            - entire matched string
            - first matched block
            - second matched block and so one
        - how to get the part of string
            - before the match
            - after the match
        - how to get the indexs of the captured string
            - begin
            - end
        - what are named captures and how to use them
    - Quantifiers
        - what are the quantifier symbols
            - zero or one
            - zero or more
            - one or more
            - match any char
        - how make the qunatifiers non greedy.
        - how to specify the number of times a regex must be repeated
            - how to specify a range instead of a fixed number
        - why should quantifiers be always with in the group seperators
    - Anchors
        - beginning of string
            - alternative for symbol
        - end of string
            - alternative for symbol
            - alternative that allows new line to be matched
        - whole word match
    - Assertions
        - look ahead assertions
            - ?=
            - ?!
        - look behind assertions
            - ?<=
            - ?<!
        - conditional matches
            - ?(1)
    - Modifiers
        - case insensitive
        - ignore new lines
        - ignore whitespace
    - String & RegExp
        - interpolate string into pattern
        - how to escape the special chars in string
    - Regexp to string
        - to_s vs inspect
    - methods that accept RegExp
        - scan(//) { optional code block }
        - what does strscan library provide
        - split using regex
        - use matched string in sub method with regex
        - use gsub
        - grep method
            - why does grep accept regexp
            - use === with regexp and string

## Chapter 12

- IO
    - list input, output and error
        - constants
        - globals
            - why does a duplicate of constant exist here
            - change global so everything gets printed to file
            - how to use the default stream when the globals have been re assigned
    - enumerables and IO objects
        - use each on input stream to read a line
        - how does the stream know that it has reached a line
- File
    - read entire content of a file
    - read file line by line using gets
    - read file line by line using readline
    - get all content in array of lines
    - difference between gets and readline
    - read byte by byte
    - read character by character
        - use both get version and read version
    - file handle positions
        - reset position of file handle to start
        - check current position
        - set position
        - seek
            - IO constansts used in seek (IO:: SEEK_SET, SEEK_CUR, SEEK_END)
            - set the position to 20
            - advance poistion from current position by 10
            - set postion from the end
    - CLASS methods
        - read
        - readlines
        - what's the advantage of using class methods
        - system ( low level methods)
            - seek
            - read
            - write
    - Enumerability
        - enumerable methods
        - how is file different from arrays, hashes and other collections with respect to enumerability
- Querying File
    - difference b/n File and FileTest
    - get the size of a file using File and FileTest
    - print the stats of a file
    - check if a file exists
    - check if a file is a directory
    - or the given path is file
    - or a symbolic link
    - check if they are readable, writable or executable
    - size of the file
    - whether the size is zero bytes
    - get the file stats
        - with Stat object
        - with file object
- Querying Directory
    - get all entries of a directory
    - loop through all entries and find the total size of all files in a directory
    - get full path of an entry
    - glob method
        - equivalent of glob method
        - use * wildcard
    - excercise
        - create a directory, traverse to that directory and create a file inside the directory
        - write "This is a test file to the file"
        - print the size and other stats of that file
        - delete that file
        - then go back to the start directory
        - delete the newly created directory
- FileUtils (operating system specific)
    - do rm -rf
    - create a symbolic link (ln -s)
    - copy one file to to another
    - create a directory
    - copy a bunch of files to the created directory
    - move the copied files to another location
    - delete a file
    - use dry run to test
    - use no write mode to delete a file and see what happens
- Pathname
    - get the string representation of the path
    - get the extension of the file
    - get the base name
    - get the directory name of the path
    - go up the directory till root
- StringIO
    - use of temp-file class
    - write a method that accepts (inp_file, out_file, comment_re = /\A\s*#/) read a file assuming it's a program.rb file. remove all comments tand write it to an output file
        - use this method passsing file handles
        - use the same method using StringIO objects
    - what does the open method from open-uri return?

## Chapter 13

- Singleton methods
    - where do the singleton methods reside ?
    - two ways of creatnig singleton methods for an object
    - where the class << object_ref notation most used ?
    - what is the difference between using class << object_ref vs objec_ref.method_name version ?
    - method look up tree re defined with singleton class
    - how does singleton methods defined at class level behave when inherited
    - what does singleton generally mean with regards to design patterns
        - what's the class ruby provies for this purpose
- Modifying Ruby's core classes
    - why is it not recommended to change ruby's core class
        - modifying match method on regexp to always return an array
        - gsub! and sub! examples
    - Additive changes
        - give an example
    - Passthrough changes
        - give the conventional way to do this
    - Additive-Passthrough Hybrid
    - using extend
        - extend at class level
        - class << object_name notation
        - extend method
    - refined modules
        - refine class_name do code_block end
        - using method_name
- Using BasicObject
    - explore Builder class in XML library
    - write a class that inherits BasicObject

## Chapter 14

- Proc
    - create a proc block with new and a code block that prints "yo" and call it
    - do the same with proc object
    - using code block as proc by using special arguments
    - define a proc block and pass it as an argument
    - loop through an array of string with each. instead of code block pass a proc
    - what happens when you pass a proc with &myprocref
    - create a class Person with attr_reader name. store array of person. define to_proc class singleton method. pass person class in map block to get name upcase.
    - create a proc call back counter make_counter
    - Proc and their argument behavior
- Lambda
    - create a lambda and call
    - difference between lamda and proc
        - automatic conversion
        - how return works
        - method arguments
    - stabby lambda operator
        - why was it introduced
        - how to give parameter list in this format
- Methods as Objects
    - True or False ? Methods don't present themselves as Objects.
    - How to get method as an Object
    - how to call the method object
    - how to unbind and bind the method to a different object
    - skip the default hierarchy of class defined and make class C call method defined on class A.
- Two other ways of invoking callable objects instead of call
    - the array square bracket notation
    - .() notation
- eval
    - example
        - use eval to get a method name from user
        - define a method with that name
        - call that method through eval
    - use binding with eval to print a local variable at top level to print inside a method
    - what's the $SAFE variable ?
    - why is eval is not used by experienced programmers
    - use instance_eval to print a private variable
        - use instance_exec to pass arguments
        - example
            - define a class called person
            - define methods name= and age=
            - use instance eval to execute assignment code block
    - class_eval
        - create a method with define_method and access local variable inside class with class_eval
- Threads
    - What is default fallback mechanism if OS doesn't support threads
    - Will a thread get killed if the program finishes before the thread finished
    - what does the join method do ?
    - status checking methods for thread
        - status
        - alive?
        - stop?
        - wakeup after stop
    - what is the Fiber class
        - give an example using yield and resume
    - require 'socket' library and create a simple TCPServer
        - accept all connections
        - get name from the user and respond with Username and Date
        - change the program to chat server with welcome and broadcase message.
    - Threads and Scope
        - what's the only difference between blocks and threads with respect to global variables and scope
    - Example
        - Define rps class with comparable module included
        - define the comparable spaceship operator and a play method which
- system commands inside ruby
    - system
    - backquote
    - %x
    - what version allows string interpolation
    - how to check the status of the process executed via these commands
    - use open and popen3 to open a two way communication with a system command

## Chapter 15

- method_missing
    - create a person class and use method_missing to make set_ method available and corresponding respond_to_missing? method
    - use the function method on an object to get object as an method
    - use method missing on a class hierarchy to call method from the parent hierarchy skipping parent classes
    - use
        - included
            - print a message whenever a module is included into a class
            - use included to add class methods
        - extended
            - print a message whenever a module is extended
        - const_missing
            - initialize the missing constant to some value
        - method_added example
        - singleton_method_added example
- Querying Object capabilities
    - get all non private method that deals with case
    - get all method that has bang modifiers
    - get all methods that doesn't have mathcing bang modifiers
    - Object level method listings
        - public_methods
        - private_methods
        - protected_methods
    - Class level method_listings. How to exclude methods defined in ancestor classes
        - instance_methods
        - public_instance_methods
        - private_instance_methods
        - protected_instance_methods
    - singleton_methods
        - it also lists methods from ancestor line
    - list all local variables, global variables and instance variables of an object
- Stacktrace
    - what method gives the call stack trace