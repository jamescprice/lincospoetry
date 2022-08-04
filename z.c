#include <conio.h>
#include <math.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <c64/charwin.h>
#include <c64/kernalio.h>
#include <c64/vic.h>
#include <gfx/vector3d.h>
#include <stdio.h>
#include "scanner.h"    /*needed for input*/
#include "parser.h"

#define Screen  ((byte * ) 0xc800)
int k;
int arraycols, arrayrows,sumhere;
int arraycolsb, arrayrowsb;

int i,j, xpos, ypos;
int listlength;
int z;
char c;
char inputstring[25];
char tmpstring[25];
char tempstring[25];

char charstring[25];
char spaces[41];
CharWin * win;

struct CharWin cwin;
struct CharWin inputwin;
struct CharWin msgwin;
struct CharWin outputwin;



byte data[] = { 
#embed "apl.bin" 
}; 
char  oxpos = 0;
int isneg = 0;
char nl[3];  
char newl = 13;
int position = 0;


void checkScroll(CharWin * win)
{
        if (win->cy == win->wy)
        {
                win->cy--;
                cwin_scroll_up(win, 1);
                cwin_fill_rect(win, 0, win->wy - 1, win->wx, 1, ' ', 1);
        }
}

void printLn(CharWin * win)
{
        win->cy++;
        win->cx = 0;
        checkScroll(win);
}

void print(CharWin * win, const char * str, char color)
{
        char len = strlen(str);
        if (win->cx + len > 40)
                printLn(win);

        cwin_put_string(win, str, color);
        checkScroll(win);
}




void corral(){
  for (i = 0; i < 120; i++) Screen[i] = i;

//  for (i = 120; i < 160; i++) Screen[i] = 35;  //box character
  *(char *) 0xd021 = 0x06;  //border color
  for (i = 0; i < 120; i++) { ( * (char * )(0xd800 + i)) = 1; }
// color boxes for palette
  //for (i = 0; i < 40; i++) { ( * (char * )(0xd878 + i)) = i; } 
}

int main(void) {
struct VectorV *vec = (struct VectorV*) malloc(sizeof(struct VectorV));

//  char inputstring[25];
 // char tmpstring[25];
strcpy(spaces, "                                        ");
nl[0] = 13;
nl[1] = 10;
nl[2] = 0;

  int notassignment = 0;
  struct node * foundLink;
  struct node * foundLink2;
  size_t size;
  int val,len;

  int storeindex = 0;
  int linenotdone = 1;
  char storechar = 0;
  xpos = 0;
  ypos = 0;
  memcpy((char * ) 0xe000, data, 1024); //APL charset loads into $e000
  *(char * ) 648 = 0xc8; // POKE 648,40;
  vic_setbank(3); // nice high-level way to move the sundry charset
  vic.memptr = 0x28; // settings into place in oscar64!
  for (i = 0; i < 1024; i++) Screen[i] = 32;
//create output charwin
//draw output bench  border on line 7
   cwin_init(&outputwin, (char *)0xc800, 0, 10, 40, 15);
   cwin_clear(&outputwin);
//   cwin_fill(&outputwin, 15, 5);

   cwin_init(&inputwin, (char *)0xc800, 0, 4, 40, 2);
   cwin_clear(&inputwin);
   cwin_fill(&inputwin, 32, 5);


   cwin_init(&msgwin, (char *)0xc800, 0, 7, 40, 2);
   cwin_clear(&msgwin);


///

///
//nope *(char*)0xcc = 0;
  while (1) {
    corral();

    linenotdone = 1;
    c = 1; //dummy not 0 value
    for (i=0; i<25; i++) {
    tmpstring[i] = 0;
    inputstring[i]=0;
    } //clean up for next run

    while (linenotdone) {
      while (c != 13) { ////exit chargetting loop if return key hit

        //cgetc
//
//;$00C6	Number of characters in keyboard buffer
//;$00CC	Flag	Flash cursor 0 = yes, otherwise no
//;$00CD	for cursor flashing, default 20, decreased every jiffy
//;$00CE        Character at cursor position
//;$00CF        Flag	Cursor flash phase 0 = visible, >0 invisible
        __asm {
          loc1ebd: LDA $C6      //Number of characters in keyboard buffer
          loc1ebf: BNE loc1ed8  //if  chars in buffer jump to charsinbuffer
          loc1ec1: LDA $CC      //Flash cursor 0 = yes, otherwise no
          PHA
          LDA #$01
          JSR loc1ede
          loc1eca: LDA $C6      //# of chars waiting in buffer
          loc1ecc: BEQ loc1eca
          LDX #$00
          PLA
          BNE loc1ed4
          INX
          loc1ed4: TXA
          JSR loc1ede
          loc1ed8: JSR $e5b4
          sta $c878           //stores to $c878   line 4 first car
          LDX #$00
//          RTS
          JMP done
          loc1ede: TAX
          BNE loc1eff
          LDA $CC                //Flash cursor 0 = yes, otherwise no
          BNE loc1efe            //its flashing go to RTS
          LDA #$01               // not flashing
          STA $CC                // turn off cursor
          LDA $CF                //get cursor phase
          BEQ loc1efa           
          LDY $D3
          LDA($D1), Y
          EOR #$80
          STA($D1), Y
          LDA $0287              //color under the cursor
          STA($F3), Y
          loc1efa: LDA #$00
          STA $CF                //0 into $cf makes cursor visible
          loc1efe: // RTS
          jmp done
          loc1eff: LDA #$00
          STA $CC
//          RTS
          done:
        }
        c = * (char * ) 0xc878;   // the magic location stored char into c
        * (char * ) 0xc878   = 32;  //then blank  magic location
        //printf("C IS %c %d ", c, c);
        if (c == 157) {
          xpos--;
          xpos--;
          if (xpos < 0) {
            xpos = 39;
          }

          gotoxy(xpos, ypos);
        } else if (c == 29) {
          xpos++;
          if (xpos > 39) {
            xpos = 0;
          }

          gotoxy(xpos, ypos);
        } else if (c == 17) {
          ypos++;
          if (ypos > 3) {
            ypos = 0;
          }
          gotoxy(xpos, ypos);


        } else if (c == 145) {
          ypos--;
          if (ypos < 0) {
            ypos = 2;
          }
          gotoxy(xpos, ypos);

        } else if (c == 35) {
              inputstring[storeindex] = 0;
              storeindex--;

        } else if ( ((c >= 48) && (c <= 57))  ||
                    ((c >= 65) && (c <= 90))  ||
                    ((c == 32)             )  ||
                    ((c>45)  )    //any key but some break it
                  )
          {
          inputstring[storeindex++] = c;
          //terminate it with null
          inputstring[storeindex + 1] = 0;
          gotoxy(0, 5);
          printf("%s", inputstring);
//   cwin_clear(&msgwin);
//   cwin_putat_string(&msgwin, 0, 0, inputstring,3);





        } else if (c == 13) {
          ypos = 0;
          xpos = 0;
          __asm {
            lda $ce
            sta $c8f3
          }
          storechar = * (char * ) 0xc8f3;
* (char * ) 0xc8f3 = 32;  //blank it
          if (storechar == 0) {
            linenotdone = 0;
            gotoxy(12, 12);
//            printf("GOT NULL PARSE THIS %s \n", inputstring);
  cwin_clear(&inputwin);
   cwin_fill(&inputwin, 32, 5);

  cwin_putat_string(&inputwin, 0, 0, inputstring,13);
    break;
          }

          *(char * )(1400 + storeindex) = storechar;
          if ((storechar >= 1) && (storechar <= 31)) //char, add 64
          {
            storechar += 64;
          } else if ((storechar >= 64) && (storechar <= 94)) //char, add 64
          {
            storechar += 32;
          } else if ((storechar >= 95) && (storechar <= 119)) //char, add 64
          {
            storechar += 64;
          }

          inputstring[storeindex++] = storechar;
          //terminate it with null
          inputstring[storeindex + 1] = 0;
          gotoxy(0, 5);
          printf("%s", inputstring);
          gotoxy(xpos, ypos);
        }
        c = 1; //reset from 13
      } 
    } 
    storeindex = 0;
 
//    __asm {
//      lda $ce
//      sta $c8f1
//        }


////

for (z=0; z< strlen(inputstring); z++) { 
switch (inputstring[z]) {
    case 61: { //cheat to use = as <-
     printf("EQUALS  ",inputstring[1]);

       break;
    }

    case 91: { //cheat to use = as <-
     printf("SECOND ",inputstring[1]);

       break;
    }
    case 92: { //cheat to use = as <-
     printf("UNDETERMINED ",inputstring[1]);

       break;
    }

case 65:  {
     printf("A");
       break;
    }

case 66:  {
     printf("B");
       break;
    }

case 67:  {
     printf("C");
       break;
    }

case 68:  {
     printf("D");
       break;
    }

case 69:  {
     printf("E");
       break;
    }
case 70:  { printf("F"); break; }

case 71:  { printf("G"); break; }
case 72:  { printf("H"); break; }
case 73:  { printf("I"); break; }
case 74:  { printf("J"); break; }
case 75:  { printf("K"); break; }
case 76:  { printf("L"); break; }
case 77:  { printf("M"); break; }
case 78:  { printf("N"); break; }
case 79:  { printf("O"); break; }
case 80:  { printf("P"); break; }

case 81:  { printf("Q"); break; }
case 82:  { printf("R"); break; }
case 83:  { printf("S"); break; }
case 84:  { printf("T"); break; }
case 85:  { printf("U"); break; }
case 86:  { printf("V"); break; }
case 87:  { printf("W"); break; }
case 88:  { printf("X"); break; }
case 89:  { printf("Y"); break; }
case 90:  { printf("Z"); break; }
    case 93: { //cheat to use = as <-
     printf("YEAR ",inputstring[1]);

       break;
    }

    case 95: { //cheat to use = as <-
     printf("UNION ",inputstring[1]);

       break;
    }

   case 33: { //cheat to use = as <-
     printf("NEGATION ",inputstring[1]);

       break;
    }
   case 35: { //cheat to use = as <-
     printf("MATH ",inputstring[1]);

       break;
    }

   case 36: { //cheat to use = as <-
     printf("DELTA ",inputstring[1]);

       break;
    }
   case 39: { //cheat to use = as <-
     printf("RADIUS ",inputstring[1]);

       break;
    }

   case 62: { //cheat to use = as <-
     printf("HYDROGEN ",inputstring[1]);
       break;

    }

   case 63: { //cheat to use = as <-
     printf("HELIUM ",inputstring[1]);
       break;

    }

   case 96: { //cheat to use = as <-
     printf("CARBON ",inputstring[1]);
       break;

    }


   case 97: { //cheat to use = as <-
     printf("NITROGEN ",inputstring[1]);
       break;
    }


   case 98: { //cheat to use = as <-
     printf("%OXYGENd ",inputstring[1]);
       break;
    }

   case 99: { //cheat to use = as <-
     printf("ALUMINIUM ",inputstring[1]);
       break;
    }

   case 100: { //cheat to use = as <-
     printf("SILICIUM ",inputstring[1]);
       break;
    }

   case 101: { //cheat to use = as <-
     printf("IRON ",inputstring[1]);
       break;
    }

   case 102: { //cheat to use = as <-
     printf("SODIUM ",inputstring[1]);
       break;
    }

   case 103: { //cheat to use = as <-
     printf("CHLORINE ",inputstring[1]);
       break;
    }

   case 104: { //cheat to use = as <-
     printf("ARGON ",inputstring[1]);
       break;
    }
   case 105: { //cheat to use = as <-
     printf("GOLD ",inputstring[1]);
       break;
    }
   case 106: { //cheat to use = as <-
     printf("SILVER ",inputstring[1]);
       break;
    }
   case 107: { //cheat to use = as <-
     printf("SULFUR ",inputstring[1]);
       break;
    }
   case 108: { //cheat to use = as <-
     printf("URANIUM ",inputstring[1]);
       break;
    }
   case 109: { //cheat to use = as <-
     printf("ZINC ",inputstring[1]);
       break;
    }
   case 110: { //cheat to use = as <-
     printf("TIME ",inputstring[1]);
       break;
    }
   case 111: { //cheat to use = as <-
     printf("FORCE ",inputstring[1]);
       break;
    }
   case 112: { //cheat to use = as <-
     printf("ENERGY ",inputstring[1]);
       break;
    }
   case 113: { //cheat to use = as <-
     printf("PRESSURE ",inputstring[1]);
       break;
    }

   case 114: { //cheat to use = as <-
     printf("POWER ",inputstring[1]);
       break;
    }

   case 115: { //cheat to use = as <-
     printf("DISTANCE ",inputstring[1]);
       break;
    }
   case 116: { //cheat to use = as <-
     printf("CHARGE ",inputstring[1]);
       break;
    }
   case 117: { //cheat to use = as <-
     printf("DISTANCE ",inputstring[1]);
       break;
    }
   case 118: { //cheat to use = as <-
     printf("PHYSICS ",inputstring[1]);
       break;
    }
   case 119: { //cheat to use = as <-
     printf("PHOTON ",inputstring[1]);
       break;
    }
   case 120: { //cheat to use = as <-
     printf("TEMPERATURE ",inputstring[1]);
       break;
    }
   

   case 122: { //cheat to use = as <-
     printf("CELL ",inputstring[1]);
       break;
    }
   case 123: { //cheat to use = as <-
     printf("BIOLOGY ",inputstring[1]);
       break;
    }

   case 124: { //cheat to use = as <-
     printf("MALE ",inputstring[1]);
       break;
    }
  case 125: { //cheat to use = as <-
     printf("FEMALE ",inputstring[1]);
       break;
    }

  case 126: { //cheat to use = as <-
     printf("PI ",inputstring[1]);
       break;
    }



////done to here

  case 223: { //cheat to use = as <-
     printf("PEOPLE ",inputstring[1]);
       break;
    }
    case 159: { //cheat to use = as <-
     printf("PEOPLE ",inputstring[1]);

       break;
    }
    case 161: { //cheat to use = as <-
     printf("JUPITER ",inputstring[1]);

       break;
    }
    case 162: { //cheat to use = as <-
     printf("EARTH ",inputstring[1]);

       break;
    }
    case 163: { //cheat to use = as <-
     printf("MOON ",inputstring[1]);

       break;
    }

    case 164: { //cheat to use = as <-
     printf("SUN ",inputstring[1]);

       break;
    }
    case 165: { //cheat to use = as <-
     printf("MARS ",inputstring[1]);

       break;
    }
    case 166: { //cheat to use = as <-
     printf("MERCURY ",inputstring[1]);

       break;
    }
    case 167: { //cheat to use = as <-
     printf("NEPTUNE ",inputstring[1]);

       break;
    }
    case 168: { //cheat to use = as <-
     printf("PLUTO ",inputstring[1]);

       break;
    }
    case 169: { //cheat to use = as <-
     printf("SATURN ",inputstring[1]);

       break;
    }


    case 170: { //cheat to use = as <-
     printf("UNIVERSE ",inputstring[1]);

       break;
    }
///add others, planets, vars

    case 171: { //cheat to use = as <-
     printf("URANUS ",inputstring[1]);

       break;
    }
    case 172: { //cheat to use = as <-
     printf("VENUS ",inputstring[1]);

       break;
    }
    case 173: { //cheat to use = as <-
     printf("ETC ",inputstring[1]);

       break;
    }
    case 174: { //cheat to use = as <-
     printf("QUESTION ",inputstring[1]);

       break;
    }
    case 175: { //cheat to use = as <-
     printf("LAND ",inputstring[1]);

       break;
    }
    case 176: { //cheat to use = as <-
     printf("OCEAN ",inputstring[1]);

       break;
    }
    case 177: { //cheat to use = as <-
     printf("SKY ",inputstring[1]);

       break;
    }
    case 178: { //cheat to use = as <-
     printf("TARGET ",inputstring[1]);

       break;
    }
    case 179: { //cheat to use = as <-
     printf("AGE ",inputstring[1]);

       break;
    }
    case 180: { //cheat to use = as <-
     printf("VAR A ",inputstring[1]);

       break;
    }
    case 181: { //cheat to use = as <-
     printf("VAR B ",inputstring[1]);

       break;
    }
    case 182: { //cheat to use = as <-
     printf("VAR C  ",inputstring[1]);

       break;
    }


    default: {
      notassignment = 1;
putchar(inputstring[i]);
     printf("%c",inputstring[i]);
     }
    } /////////switch
} //loop through input string 


/*
for (i=34; i<64; i++){
 printf("%c", i);
}
 printf("\n");
for (i=192; i<224; i++){
 printf("%c", i);
}
 printf("\n");


for (i=161; i<183; i++){
 printf("%c", i);
}
*/


  } //while 1
}  // main
