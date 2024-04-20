# 6502 Disassembly of Tecmo Super Bowl for the NES
An exhaustive disassembly of the NES game Tecmo Super Bowl into a byte-for-byte re-build of the original game. Every last instruction and memory location has been reverse engineered, labeled and commented, including my best guesses at what the unused code does.

# History
First off, credit to jtsout from tecmobowl.org for converting the raw hex file into a disassembly. Thanks to the work of him and others a few things were labeled and known (player data locations and string locations).
I took that vast uncommented/unlabeled disassembly and over a number of years got it to 100% commented and labeled around 2018.

With this knowledge, I have made several tools, and numerous hacks that alter the core gameplay, including 2 point conversions and blockers that move forward and backward. 

As of 2024, many of these innovations are used in the majority of online league/tournament play. 

There were a few opportunities to potentially remake the game that fell through. Given my lack of time to modify this further, as well as other reasons, I felt that now would be a good time to release this. There are more in-depth documents I could create that explain how everything works but I just wanted to get the information out at this point.

# Information
See the DOCS folder for many informational and useful files. Here are some of the more important ones:

Rom_map.xlsx is a good starting point as it explains where things are in the rom at a high level.

BUGS_UNUSED_AND_HIDDEN_ITEMS - Explains some of the hidden and unused items in the game as well as bugs in the game

zero_page_variables.asm - Memory labels for zero page in the NES memory (0x00-0xFF)

ram_variables.asm - Memory labels for the remaining RAM in the NES memory (0x100-0x7FF)

sram_variables.asm - Memory labels for the Save Memory in the NES memory (0x6000-0x7FFF)

# Building

Building the game is relatively simple. Download the repository. From the tools folder copy asm6f_32.exe and place it into the same folder as masterbuild.asm. You will also need a master copy of the original ROM. This goes into the same folder as masterbuild.asm as well. It needs to be named TSB.nes.

Click on asm6.bat to open DOS command prompt in the same folder as master_build.asm and type:

asm6f_32.exe master_build.asm -L

This will do the build and give you a complete listing of the game.

# CodeStyle

Unfortunately, I didn't make good choices with regards to code style when I originally embarked on disassembling the game, so there is no clear convention to differentiate Variables, Labels, Macros, and Constants.

# Viewing the code (NOTEPAD++)

I try to use notepad++ styler to help indicate certain things to make up for the poor style. I used YELLOW for macros and GREEN for memory locations. The 6502_tecmo_lang.xml in the DOCS folder can be imported into notepad++. This will make the code a lot easier to read, as well as allow you to fold the code as well. I achieved code folding by duplicating a lot of label names, but at the time I didn't see any other way of achieving it. Given how many lines of assembly there are, folding is extremely useful
Things to search for *** = interesting comment BUG = bug in gameplay

# Thanks
Thanks to Shinichiro Tomie and Akihiko Shimoji for creating such an amazing game that has brought me so much joy. I have made many online and real life friends because of this game.
This disassembly would likely never have come to fruition without  inspiration and help from others. Thanks to Matt Knobbe for creating the Tecmo Super Bowl repository (https://tecmobowl.org/) which gave people a place to share their love and information about the game.
Thanks to jstout for his (initially) very raw and largely uncommented disassembly. He also created some seminal hacks for Tecmo Super Bowl.
Thanks to all the people at nesdev and the nesdev wiki for all the information about the  architecture of, and programming for the NES.


