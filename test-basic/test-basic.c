#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
  sleep(10);
  printf("Program slept for 10 seconds. Going back to sleep....\n");
  printf("............\n");
  sleep(5);
  printf("Program finished.\n");

  return 0;
}
