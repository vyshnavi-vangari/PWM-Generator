#include <stdio.h>
#include <wiringPi.h>
#include <string.h>
#include <stdlib.h>


#define	p1	1
#define	p2	3
#define	p3	4
#define	p4  24

int main ()
{
  
  wiringPiSetup () ;
  pinMode (p1, OUTPUT) ;
  pinMode (p2, OUTPUT) ;
  pinMode (p3, OUTPUT) ;
  pinMode (p4, OUTPUT) ;
  
  
  digitalWrite(p1,1);
  digitalWrite(p2,1);
  digitalWrite(p3,0);
  digitalWrite(p4,0);
   
   return 0;
  
}
