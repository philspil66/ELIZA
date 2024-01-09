CLS

DIM change$(25),changeto$(25), findresp$(42),respaddr(42)

FOR count=1 TO 25
  READ change$(count), changeto$(count)
NEXT count

FOR count=1 TO 42
  READ findresp$(count), respaddr(count)
NEXT count

PRINT "Hello.  What's up?";

newline: addstr$=""

tryagain: in$=INKEY$
IF in$="" THEN tryagain

IF ASC(in$)>90 THEN in$=CHR$(ASC(in$)-32)
IF in$=CHR$(13) THEN imdone
IF in$=CHR$(8) THEN
  IF LEN(addstr$)<1 THEN tryagain
  PRINT in$;
  addstr$=LEFT$(addstr$,LEN(addstr$)-1)
  GOTO tryagain  
END IF

addstr$=addstr$+in$
PRINT in$;
GOTO tryagain

imdone: PRINT 
IF addstr$="" THEN
  PRINT "What seems to be the problem?"
  GOTO newline
END IF

IF addstr$=before$ THEN
  PRINT "You are being repetitious!"
  GOTO newline
END IF

temp$=addstr$
before$=addstr$

addstr$=" "+LEFT$(addstr$,LEN(addstr$)-1)+" "

FOR count=1 TO 25
  search=INSTR(addstr$,change$(count))
  IF search>0 THEN addstr$=LEFT$(addstr$, search-1)+changeto$(count)+MID$(addstr$,search+LEN(change$(count)))
NEXT count

FOR count=1 TO 42
  search=INSTR(addstr$,findresp$(count))
  IF search>0 THEN
    temp$=MID$(addstr$, search+LEN(findresp$(count)))
    IF temp$<>"" THEN temp$=LEFT$(temp$,LEN(temp$)-1)
    GOTO parse
  END IF
NEXT count

PRINT "Hmmm....Interesting, could you explain a little bit better?"
GOTO newline

parse:
FOR search=1 TO LEN(temp$)
  filler$=MID$(temp$,search,1)
  IF filler$="@" OR filler$="*" THEN temp$=LEFT$(temp$,search-1)+MID$(temp$,search+1)
NEXT search

'Youll have to forgive me for the next 43 lines of code

IF respaddr(count)=1 THEN PRINT "Computers are great, and I like them!":GOTO newline
IF respaddr(count)=2 THEN PRINT "Names, WHO needs names?":GOTO newline
IF respaddr(count)=3 THEN PRINT "In what way?":GOTO newline
IF respaddr(count)=4 THEN PRINT "Do you often think about"+temp$+"?":GOTO newline
IF respaddr(count)=5 THEN PRINT "Did you really think I would forget"+temp$+"?":GOTO newline
IF respaddr(count)=6 THEN PRINT "Really, "+temp$+"?":GOTO newline
IF respaddr(count)=7 THEN PRINT "How does that dream make you feel?":GOTO newline
IF respaddr(count)=8 THEN PRINT "Do you think that its likely that if"+temp$+PRINT ":goto newline
IF respaddr(count)=9 THEN PRINT "Really, "+findresp$(count)+"?":GOTO newline
IF respaddr(count)=10 THEN PRINT "What if you were "+temp$+"?":GOTO newline
IF respaddr(count)=11 THEN PRINT "Were you really?":GOTO newline
IF respaddr(count)=12 THEN PRINT "Would you like to believe I was "+temp$+"?":GOTO newline
IF respaddr(count)=13 THEN PRINT "Tell me more about your family.":GOTO newline
IF respaddr(count)=14 THEN PRINT "Why is it that your "+temp$+"?":GOTO newline
IF respaddr(count)=15 THEN PRINT "Can you think of a specific example?":GOTO newline
IF respaddr(count)=16 THEN PRINT "Why are you interested in whether I am"+temp$+" or not?":GOTO newline
IF respaddr(count)=17 THEN PRINT "Did you think they might not be"+temp$+"?":GOTO newline
IF respaddr(count)=18 THEN PRINT "Do you believe you are "+temp$+"?":GOTO newline
IF respaddr(count)=19 THEN PRINT "Is that the real reason?":GOTO newline
IF respaddr(count)=20 THEN PRINT "You believe I can "+temp$+", don't you?":GOTO newline
IF respaddr(count)=21 THEN PRINT "Whether you can "+temp$+" depends on you more than me.":GOTO newline
IF respaddr(count)=22 THEN PRINT "You seem quite sure!":GOTO newline
IF respaddr(count)=23 THEN PRINT "Sorry, Im a pure bred American!":GOTO newline
IF respaddr(count)=24 THEN PRINT "How do you do?":GOTO newline
IF respaddr(count)=25 THEN PRINT "Why do you ask?":GOTO newline
IF respaddr(count)=26 THEN PRINT "What makes you think I am "+temp$+"?":GOTO newline
IF respaddr(count)=27 THEN PRINT "Im actually quite boring, lets talk about you.":GOTO newline
IF respaddr(count)=28 THEN PRINT "Are you sure?":GOTO newline
IF respaddr(count)=29 THEN PRINT "Why are you concerned over my"+temp$+"?":GOTO newline
IF respaddr(count)=30 THEN PRINT "Aren't we just a bit negative today?":GOTO newline
IF respaddr(count)=31 THEN PRINT "Apology accepted!":GOTO newline
IF respaddr(count)=32 THEN PRINT "Do you believe I don't "+temp$+"?":GOTO newline
IF respaddr(count)=33 THEN PRINT "Do you think you should be able to "+temp$+"?":GOTO newline
IF respaddr(count)=34 THEN PRINT "What would it mean to you if you got "+temp$+"?":GOTO newline
IF respaddr(count)=35 THEN GOSUB parse2:GOSUB parse3:PRINT "Im sorry to hear you are "+temp$+"?":GOTO newline
IF respaddr(count)=36 THEN GOSUB parse2:GOSUB parse3:PRINT "How have I helped you be "+temp$+"?":GOTO newline  
IF respaddr(count)=37 THEN PRINT "Do you really think so?":GOTO newline
IF respaddr(count)=38 THEN PRINT "Its because you are"+temp$+" that you came to me?":GOTO newline
IF respaddr(count)=39 THEN PRINT "How do you know you can't"+temp$+"?":GOTO newline
IF respaddr(count)=40 THEN PRINT "Don't you really "+temp$+"?":GOTO newline
IF respaddr(count)=41 THEN PRINT "Tell me more about such feelings.":GOTO newline
IF respaddr(count)=42 THEN PRINT "How is he doing these days?":GOTO newline
IF respaddr(count)=43 THEN PRINT "Did you know I dated her once?":GOTO newline

PRINT "You should NOT have gotten this message!! PROGRAM ERROR."
END

parse2: IF MID$(findresp$(count),4,1)="@" THEN temp$=RIGHT$(findresp$(count),LEN(findresp$(count))-9) 
RETURN

parse3: IF MID$(findresp$(count),7,1)="*" THEN temp$=RIGHT$(findresp$(count),LEN(findresp$(count))-7) 
RETURN

'Replacement data

DATA " MOM "," MOTHER "," DAD "," FATHER ","KIDS "," CHILDREN "
DATA " DREAMS "," DREAM "," KID "," CHILD "," HOUSE "," HOME* "
DATA " I "," YOU@ "," YOU "," I "," ME "," YOU "," ONE "," 1 "
DATA " MY "," YOUR*", "TWO "," 2 "," THREE "," 3 "
DATA " YOUR "," MY "," MYSELF "," YOURSELF* "," TOO "," ALSO "
DATA " YOURSELF "," MYSELF "," HURT "," HARM "," HOME "," HOUSE*"
DATA " I'M "," YOU'RE* "," YOU'RE "," I'M "," AM "," ARE@ "
DATA " WERE "," WAS "," EASY "," SIMPLE "," DIFFICULT "," HARD "

'Keyword data

DATA "COMPUTER",1,"MACHINE",1," NAME ",2,"ALIKE",3," LIKE ",3," SAME ",3
DATA "YOU@ REMEMBER",4,"DO I REMEMBER",5,"YOU@ DREAMED",6
DATA "DREAM ",7," IF ",8,"EVERYBODY",9,"EVERYONE",9,"NOBODY",9,"NO ONE",9
DATA "WAS YOU@",10,"YOU@ WAS",11,"WAS I",12,"YOUR* MOTHER",13
DATA "YOUR FATHER",13,"YOUR* HUSBAND",13,"YOUR* CHILDREN",13,"YOUR*",14
DATA "YOUR* SISTER",13,"YOUR* BROTHER",13,"YOUR* WIFE",13,"ALWAYS",15
DATA "ARE I",16,"ARE@ YOU@",18," HOW ",25,"BECAUSE",19,"CAN I",20
DATA "CAN YOU@",21,"CERTAINLY",22,"DEUTSCH",23,"ESPANOL",23,"FRANCAIS",23
DATA "HELLO",24,"I REMIND YOU OF",3,"I ARE",26,"I'M",26,"ITALIANO",23
DATA "MAYBE",28," MY ",29," NO ",30,"PERHAPS",28,"SORRY",31,"WHAT ",25
DATA "WHEN ",25,"WHY DON'T I",32,"WHY CAN'T YOU@",33,"YES",22
DATA "YOU@ WANT",34,"YOU@ NEED",34," ARE ",17," I ",27,"YOU@ ARE@ SAD",35
DATA "YOU'RE* SAD",35,"YOU@ ARE@ UNHAPPY",35,"YOU'RE* UNHAPPY",35
DATA "YOU@ ARE@ UNHAPPY",35,"YOU'RE* UNHAPPY",35
DATA "YOU@ ARE@ DEPRESSED",35,"YOU'RE* DEPRESSED",35
DATA "YOU@ ARE@ SICK",35,"YOU'RE* SICK",35
DATA "YOU@ ARE@ HAPPY",36,"YOU'RE* HAPPY",36
DATA "YOU@ ARE@ ELATED",36,"YOU'RE* ELATED",36
DATA "YOU@ ARE@ GLAD",36,"YOU'RE* GLAD",36
DATA "YOU@ ARE@ BETTER",36,"YOU'RE* BETTER",36
DATA "YOU@ FEEL YOU@",37,"YOU@ THINK YOU@",37
DATA "YOU@ BELIEVE YOU@",37,"YOU@ WISH YOU@",37
DATA " YOU@ ARE@",38,"YOU'RE*",38,"YOU@ CAN'T",39
DATA "YOU@ CANNOT",39,"YOU@ DON'T",40,"YOU@ FEEL",41
DATA " HE ",42," SHE ",43
