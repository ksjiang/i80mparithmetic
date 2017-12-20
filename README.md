# Intel 8085 MultiPrecision Arithmetic
## A Collection of i8085 functions to add, subtract, multiply, and divide multiprecision numbers stored in memory

The Intel 8080 and 8085 are 8-bit microprocessors with instruction sets that operate primarily on 8-bit register and memory data. Furthermore, its instruction set lacks multiplication and division operations. These arithmetic operations are essential for many tasks the processor may encounter. This small library includes functions that may be called from another procedure and will return results in memory. The documentation below describes what registers will be affected, how arguments are to be submitted to the function, and how the function will return results. Only the addition routine is described, but the calling procedure is identical for all. The CY flag is also set differently: carry-out of the n-byte result field for addition, negative for subtraction, and division-by-zero for division.


### MPADD (\*res, \*add1, \*add2, n)

**Category:** Arithmetic

**Description:** Adds two unsigned numbers of size n each stored in addresses add1 and add2. Writes result to address res. Returns nothing.

**Registers Destroyed:** ALL, but procedure saves and restores

  **Flags:** CY: Carry-out of result field.

**RAM Used:** Stack. Will write to \*res as appropriate.

**Remarks:** n should be one byte long. This is to say the maximum size of the inputs is 255. Little-endian, as always.

**Example:** Adds 4-byte ints at locations 1000H and 2000H, stores result at 3000H

```
MVI A, 04H  ; size is 4 bytes
PUSH PSW
LXI B, 1000H
PUSH B
LXI B, 2000H
PUSH B
LXI B, 3000H
PUSH B
CALL mpadd
```
