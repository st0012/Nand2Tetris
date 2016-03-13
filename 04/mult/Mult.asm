// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// for (i=0, i<R1, i++) do
//   r = r + R0
// end
// R2 = r

@i
M = 0 // define i

@r
M = 0 // define r

(LOOP)
@i
D=M

@R0
D=D-M

@STORE
D;JEQ // jump to store result if i > R0

@R1
D=M
@r
M=D+M // result = result + R1

@i
M=M+1 // i++

@LOOP
0;JMP

(STORE)
@r
D=M
@R2
M=D // R2 = final r

(END)
@END
0;JMP








