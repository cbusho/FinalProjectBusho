FinalProjectBusho
=================

## Introduction
I created a program that uses the GPIO pins JB on the FPGA to send a serial signal to a CAN Bus on a vehicle to change its
operation. The program outputs this signal at a 250KHz frequency.

## Implementation
I created the module and then connected it to the CAN Bus on my car. It is a very simple module that outputs a serial sequence
of bits.

  -This code is how I output my signal.
  
``` VHDL
process(count_reg, jb_sig, reset)
	begin
		if reset = '1' then
			JB(0) <= '1';
		elsif count_reg = 22 then
			JB(0) <= jb_sig(22);
		elsif count_reg = 21 then
			JB(0) <= jb_sig(21);
		elsif count_reg = 20 then
			JB(0) <= jb_sig(20);
		elsif count_reg = 19 then
			JB(0) <= jb_sig(19);
		elsif count_reg = 18 then
			JB(0) <= jb_sig(18);
		elsif count_reg = 17 then
			JB(0) <= jb_sig(17);
		elsif count_reg = 16 then
			JB(0) <= jb_sig(16);
		elsif count_reg = 15 then
			JB(0) <= jb_sig(15);
		elsif count_reg = 14 then
			JB(0) <= jb_sig(14);
		elsif count_reg = 13 then
			JB(0) <= jb_sig(13);
		elsif count_reg = 12 then
			JB(0) <= jb_sig(12);
		elsif count_reg = 11 then
			JB(0) <= jb_sig(11);
		elsif count_reg = 10 then
			JB(0) <= jb_sig(10);
		elsif count_reg = 9 then
			JB(0) <= jb_sig(9);
		elsif count_reg = 8 then
			JB(0) <= jb_sig(8);
		elsif count_reg = 7 then
			JB(0) <= jb_sig(7);
		elsif count_reg = 6 then
			JB(0) <= jb_sig(6);
		elsif count_reg = 5 then
			JB(0) <= jb_sig(5);
		elsif count_reg = 4 then
			JB(0) <= jb_sig(4);	
		elsif count_reg = 3 then
			JB(0) <= jb_sig(3);	
		elsif count_reg = 2 then
			JB(0) <= jb_sig(2);	
		elsif count_reg = 1 then
			JB(0) <= jb_sig(1);	
		elsif count_reg = 0 then
			JB(0) <= jb_sig(0);				
		else
			JB(0) <= '1';
		end if;
	end process;
```

## Test/Debug
I looked at my output signal on the digital logic analyzer. After my first test, the car's fuel guage was going down to zero,
like it was supposed to. Because of this I thought my delay for receiving code was potentially throwing of the functionality
just slightly. I also thought I could change the PID code to allow me to change the speedometer and tachometer. When these 
follow up programs were not working, I thought perhaps my clock frequency was not correct. The standard is either 250 or 500
KHz. I changed my frequency, but the program still did not work. At this point, I realized I was not sending the correct serial
sequence of bits, and that I was confused on the Data frame in the CAN Bus message. At this point I did not have enough time
to acquire a tool that would allow me to read in can bus messages from my car. The myDAQ's sampling frequency was too slow, and
I had no other tools.

##Conclusion
Make sure you understand the signal and all of its parts before you start working on the project. This will allow you to know
that you are wrong and not your code.

##Link to CAN Bus video
http://youtu.be/NANZcKU31q4

