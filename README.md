# mro
stack-based macro processor extensible with guile

The mro program processes macros and substitutes values.  It can also execute Guile Scheme code and use the values it returns in the text.

The macro program is based on a stack structure.  It has very few commands and is less than 300 lines of code.

All of the program's commands are single characters.  These characters can be changed by providing options to the `make' command. It has the following commands (all of the characters can be changed from these :

- # is the default PUSH command.  It sets the buffer that the text is written to be the next level up.  For example, in the text

` the quick brown fox # runs `

"the quick brown fox" is written out and " runs" is written to the next buffer up

- @ takes the

