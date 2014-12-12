
#include <stdio.h>

int main()
{
  /* Writes the last two bytes of the boot sector with the bootable
   *  magic number
   */
  //fprintf(stdout, "\x55\xAA");
  FILE *drive;
  fseek(drive = fopen("/dev/sdb", "w"), 510, 0);
  fprintf(drive, "\x55\xAA");
  fclose(drive);
  return 0;
}

