// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

	@SCREEN
	D=A
	@index
	M=D
(LOOP)
	@KBD
	D=M
	@BLACK
	D;JGT
	@SCREEN
	D=A
	@index
	M=D
	@SCREEN
	D=M
	@WHITE
	D;JLT
	@LOOP
	0;JMP
(BLACK)
	@KBD
	D=M
	@LOOP
	D;JEQ
	@index
	D=M
	@KBD
	D=D-A
	@LOOP
	D;JEQ
	@index
	D=M
	A=D
	M=-1
	@index
	M=M+1
	@BLACK
	0;JMP
(WHITE)
	@KBD
	D=M
	@LOOP
	D;JGT
	@index
	D=M
	@KBD
	D=D-A
	@LOOP
	D;JEQ
	@index
	D=M
	A=D
	M=0
	@index
	M=M+1
	@WHITE
	0;JMP