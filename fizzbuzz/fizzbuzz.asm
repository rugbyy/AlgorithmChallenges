;wrote this start to finish in one sitting
;certainly needs to be refactored later
;still learning asm at this point
;one obvious thing that needs to be changed for optimizations sake is the div instruction
;code can probably be tightened up quite a bit elseware as well

INCLUDE Irvine32.inc

.data
fizz BYTE "Fizz", 0dh, 0ah, 0
buzz BYTE "Buzz", 0dh, 0ah, 0
fb BYTE "FizzBuzz", 0dh, 0ah, 0
modThreeBool BYTE 0     ;stores whether or not the num was divisible by 3, set in modthree proc

.code
main proc
	mov ecx,15          ;amount of numbers to test, if set to 15, will test from 1 to 15
	mov si,1            ;this is the number to start testing from
FizzBuzzLoop:
	cmp ecx,0           ;tests if the counter is 0, exits loop if true
	je LoopEnd
	call ModThree       ;function that tests if si mod 3 == 0, sets modThreeBool to 1 if == 0
	call ModFive        ;does the same as above for 5 instead of 3, also calls the appropriate print command depending on results
	inc si              ;increases the number we're testing by 1
	mov modThreeBool, 0 ;test modThreeBool back to 0 for the test in the next iteration
	Loop FizzBuzzLoop   ;goes back to the top of the loop
LoopEnd:
	ret 
main endp

WriteFizz proc
	lea edx, fizz       ;stores address of fizz variable in edx
	call WriteString    ;writes the fizz variable to the screen
	ret
WriteFizz endp

WriteBuzz proc
	lea edx, buzz       ;these next to functions do the same as the above function
	call WriteString
	ret
WriteBuzz endp

WriteFizzBuzz proc
	lea edx, fb
	call WriteString
	ret
WriteFizzBuzz endp

ModThree proc
	pushad              ;save our registers
	mov edx, 0          ;without setting edx to 0 we get an integer overflow, not sure if needed every time, but doesnt seem to hurt
	mov bx, 3           ;this is the number we are dividing by
	mov ax, si          ;stores the number we are dividing into ax
	div bx              ;divides ax by bx
	cmp dx, 0           ;check if 3 divided evenly into si. the remainder is stored in dx
	je SetTrue          ;if it divided evenly, jump to this label
	popad               ;restore reg's
	ret
SetTrue:
	mov modThreeBool, 1 ;since it divided evenly set modThreeBool to true
	popad
	ret
ModThree endp

ModFive proc
	pushad
	mov edx, 0         ;same as ModThree
	mov bx, 5          ;
	mov ax, si         ;
	div bx	           ;
	cmp dx, 0          ;
	je SetTrue         ;same as ModThree end
	cmp modThreeBool, 1;check if the number was divisible by 3
	je OnlyThreeSet    ;if the jump to settrue was skipped, and dx != 0, then the number was divisible by 3 only, so we jump and print it out
	mov eax,esi        ;we have to move the number we divided into eax to be printed out
	call WriteInt      ;print the int to the screen
	call Crlf          ;print new line
	popad
	ret
SetTrue :              ;we reach this label if the number was evenly divisible by 5
	cmp modThreeBool, 1;check if the number was divisible by 3 as well
	je FiveAndThreeSet ;this jump is taken if the number was divisible by both 3 and 5
	call WriteBuzz     ;we call through to here if the number was only divisible by 5
	popad
	ret
FiveAndThreeSet:       ;we reach this label if the number is divisible by both 3 and 5
	call WriteFizzBuzz
	popad
	ret
OnlyThreeSet:          ;we reach this label if the number is divisible only by 3
	call WriteFizz
	popad
	ret
ModFive endp

end