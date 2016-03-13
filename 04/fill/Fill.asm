// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@i
M = 0

@8192
D=A
@n
M = D // define screen loop number

@SCREEN
D=A
@addr
M=D


@KBD
D=M
@CLEAN_SCREEN
D;JEQ

(BLACK_SCREEN)
@screen
M=-1

@LOOP
0;JMP

(CLEAN_SCREEN)
@screen
M=0

@LOOP
0;JMP

(LOOP)
@i
D=M
@n
D=D-M
@END
D;JEQ

@screen
D=M

@addr
A=M
M=D

@addr
M=M+1 // increase address

@i
M=M+1 // i++

@LOOP
0;JMP


(END)
@R0
0;JMP
