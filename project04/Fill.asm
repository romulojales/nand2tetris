// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
// Put your code here.
  @8191
  D=A
  @R2 // Save in R2 the size of the video memory. to control the loop
  M=D
(LOOPKBR)
  @R1
  M=-1 // Make it black
  @KBD
  D=M
  @PRINT
  D;JNE
  @R1  // if a key is pressed , make it white
  M=0
(PRINT)
  @R1
  D=M   // get the value to print.
  @SCREEN
  M=D  // print the very first block
  D=A
  @R0
  M=D // saves the position of the screen in R0 to iterate it later.
(LOOP) //loop to print all screen
  @R2
  MD=M-1  // R2 -= 1
  @ENDPRINT
  D;JLT
  @R1
  D=M
  @R0
  M=M+1 // go to the next position
  A=M
  M=D
  @LOOP
  0;JMP
(ENDPRINT)
  @8191
  D=A // reset the loop
  @R2 // Save in R2 the size of the video memory. to control the loop
  M=D
  @LOOPKBR
  0;JMP
