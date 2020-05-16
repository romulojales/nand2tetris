// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


// Repeat R0 times the operation (R2 = R1 + R2);
  @R2
  M=0
  @R1
  A=M
(LOOP)

  @R0
  MD=M-1
  @END
  D;JLT
  @R2
  M=A+M
  @LOOP
  0;JMP
(END)
  @END
  0;JMP
