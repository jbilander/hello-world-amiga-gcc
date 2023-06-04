#include <proto/exec.h>
#include <proto/dos.h>

int main(int argc, char *argv[])
{
      struct ExecBase *SysBase;
      struct Library *DOSBase;

      SysBase = *(struct ExecBase **)4UL;
      DOSBase = OpenLibrary((CONST_STRPTR) "dos.library", 0);

      if (DOSBase)
      {
            Write(Output(), "Hello world!\n", 13);
            CloseLibrary(DOSBase);
      }

      return 0;
}