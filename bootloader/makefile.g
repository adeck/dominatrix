
.RECIPEPREFIX=>

EXEC=bin/trix.bootloader
ASRCS_LIST=main.s
ASRCS=$(addprefix src/,$(ASRCS_LIST))
OBJS=$(addprefix bin/,$(ASRCS_LIST:%.s=%.o))
AS=as
LD=ld
LDFLAGS=--oformat binary -Ttext=0x7C00

all: $(ASRCS)
>   @mkdir 2>/dev/null bin
>   @rm 2>/dev/null $(EXEC) $(OBJS) || true
>   $(AS) $(ASRCS) -o $(OBJS)
>   $(LD) $(LDFLAGS) -o $(EXEC) $(OBJS)

clean:
>   @rm 2>/dev/null $(EXEC) $(OBJS) || true

