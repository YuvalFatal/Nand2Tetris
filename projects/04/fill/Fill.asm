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
	@pixel
	M=0
(LOOP)
	@KBD
	D=M
	@LOOP2
	D;JGT
	@SCREEN
	D=A
	@index
	M=D
	@pixel
	M=0
	@LOOP
	0;JMP
(LOOP2)
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
	@SCREEN
	A=D
	M=-1
	@index
	M=0
	@LOOP2
	0;JMP