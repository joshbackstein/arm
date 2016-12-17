#### D Tasks - Complete

* ~~Compile an assembly program with gcc~~
  * In makefile.
* ~~Use the debugger to step through a program~~
  * Run the program in GDB using `gdb <executable file>`, then `start`, then `si` to make individual steps through the program.
* ~~Use the debugger to look at the contents of registers~~
  * When running the program in GDB, use the command `info registers` or `i r` for the shorthand version. Additionally, to view specific registers, the registers can be appended to the end of the command. For example, to view registers `r0` and `r4`, use the command `i r r0 r4`.
* ~~Use the debugger to look at the contents of memory~~
  * When running the program in GDB, use the command `x <address here>`. For example, to view the memory at the address `0x8000`, we can use the command `x *0x8000`. If a register is storing an address, we can use `x $r<number>` to view the memory at the address in the register. If register `r0` is holding the address `0x8000`, using the command `x $r0` performs the same action as the previous example. Different amounts of data can be displayed in different forms by appending `/<number><type>` to the `x` command.
* ~~Set a breakpoint in the debugger~~
  * When running the program in GDB, using the command `b <address here>` will set a breakpoint on that address. The command `b *0x8000` will set a breakpoint on address `0x8000`. Additionally, labels can be used in place of addresses to make testing easier.
* ~~Output text to the console using printf~~
  * Under the `interact` label in `d_prof.s`.
* ~~Output non-text data to the console as text using printf~~
  * Under the `interact` label in `d_prof.s`.
* ~~Get input from the console using scanf~~
  * Under the `interact` label in `d_prof.s`.
* ~~Execute a system call~~
  * In `utilities.s` uner the `printString` label.
* ~~Create static data in memory~~
  * At the top of `d_prof.s`.
* ~~Create a global variable~~
  * At the top of `d_prof.s`.
* ~~Create a local variable on the stack~~
  * In the math section of `d_prof.s`.
* ~~Do simple math (add, subtract, multiply, divide)~~
  * In the math section of `d_prof.s`.
* ~~Create a loop~~
  * In `c-tasks` folder in `pro.s` under the `while` and `for` labels.
* ~~Create an if statement~~
  * In `c-tasks` folder in `pro.s` under the `checkAge` label.
* ~~Create a function~~
  * In `c-tasks` folder in `pro.s` under the `PromptAge` label.


#### C Tasks - Complete

* ~~Write a program that compiles with as/ld, without C libs~~
  * In `https://github.com/joshbackstein/cuddly-spoon/blob/master/makefile`.
* ~~Create a struct~~
  * At the top of `pro.s`.
* ~~Create a while loop~~
  * In `pro.s` under the `while` label.
* ~~Create a for loop~~
  * In `pro.s` under the `for` label.
* ~~Create an if/else statement~~
  * In `pro.s` under the `while` label.
* ~~Create an if/elseif/else statement~~
  * In `pro.s` under the `checkAge` label.
* ~~Create a function that returns some value~~
  * In `pro.s` under the `PromptAge` label.
* ~~Create a function that takes an argument by value~~
  * In `pro.s` under the `StoreAgeInStruct` label.
* ~~Create a function that takes an argument by reference~~
  * In `pro.s` under the `StoreAgeInStruct` label.
* ~~Cast from byte to short~~
  * In `cast.s` under the `CastByteToShort` label.
* ~~Cast from short to int~~
  * In `cast.s` under the `CastShortToInt` label.
* ~~Do simple math with bytes~~
  * In `cast.s` under the `ByteMath` label.
* ~~Do simple math with shorts~~
  * In `cast.s` under the `ShortMath` label.
* ~~Do simple math with long (64-bit) integers~~
  * In `longmath.s`.


#### B Tasks - Complete

* ~~Allocate heap memory using malloc~~
  * In `malloc.s`.
* ~~Create a function that takes more than 4 arguments~~
  * In `addSixNumbers.s` and `utilities.s` under the `addSixNumbers` label.
* ~~Create a function with floating point arguments~~
  * In `https://github.com/joshbackstein/cuddly-spoon/blob/master/pixelConvert.s` under the `getLuminance` label.
* ~~Use a system call to output data to the console~~
  * In `utilities.s` under the `printString` label.
* ~~Use a system call to get input from the console~~
  * In `https://github.com/joshbackstein/cuddly-spoon/blob/master/cs.s` under the `GetFilename` label.
* ~~Write a simple program using only Thumb2 instructions~~
  * In `thumb.s`.
* ~~Create a while loop using Thumb2 instructions~~
  * In `thumb.s`.
* ~~Create a for loop using Thumb2 instructions~~
  * In `thumb.s`.
* ~~Create an if/else statement using Thumb2 instructions~~
  * In `thumb.s`.
* ~~Cast from int to long~~
  * In `intToLong.s`.
* ~~Create and traverse an array~~
  * In `array.s`.
* ~~Write the following utility functions (without C libs)~~
  * ~~Return whether an int is a power of 2 or not~~
    * In `powerOfTwo.s` and `utilities.s` under the `powerOfTwo` label.
  * ~~Use a system call to output text to console~~
    * In `utilities.s` under the `printString` label.
  * ~~Use a system call to output an integer to console~~
    * In `utilities.s` under the `printUInt` label.


#### A Tasks - Incomplete

* ~~Allocate heap memory using the brk system call~~
  * In `utilities.s` under the `brk` label.
* ~~Allocate heap memory using the mmap system call~~
  * In `https://github.com/joshbackstein/cuddly-spoon/blob/master/cs.s` under the `MapFileToMemory` label.
* ~~Use system calls to output data to a file~~
  * In `https://github.com/joshbackstein/cuddly-spoon/blob/master/cs.s` under the `WriteChangesToFile` label.
* ~~Use system calls to get input from a file~~
  * In `https://github.com/joshbackstein/cuddly-spoon/blob/master/cs.s` under the `MapFileToMemory` label.
* Create a simple object using a struct and a set of functions
* Create an object type that inherits from the first
* Solve the vector code optimization problem
* Optimize the power of 2 test function
* Create a select block
* Do something with GPIO pins (LED for example)
* Boot Pi into your own kernel that does something
