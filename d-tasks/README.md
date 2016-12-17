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
  * In root folder in `utilities.s` under the `printString` label.
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
