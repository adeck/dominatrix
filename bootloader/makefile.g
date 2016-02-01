
.RECIPEPREFIX=>

EXEC=bootloader
ASRC=main
AS=as
LD=ld
LDFLAGS=--oformat binary -Ttext=0x7C00

all: $(ASRC).s
>   @rm 2>&1 $(EXEC) $(ASRC).o || true
>   $(AS) $(ASRC).s -o $(ASRC).o
>   $(LD) $(LDFLAGS) -o $(EXEC) $(ASRC).o

clean:
>   @rm 2>&1 $(EXEC) $(ASRC).o || true

