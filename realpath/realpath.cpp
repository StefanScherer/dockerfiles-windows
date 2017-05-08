#include <windows.h>
#include <tchar.h>
#include <stdio.h>

#define BUFSIZE MAX_PATH

void __cdecl _tmain(int argc, TCHAR *argv[])
{
    TCHAR Path[BUFSIZE];
    HANDLE hFile;
    DWORD dwRet;

    if( argc != 2 )
    {
        printf("ERROR:\tIncorrect number of arguments\n\n");
        _tprintf(TEXT("%s <file_name>\n"), argv[0]);
        return;
    }

    _tprintf(TEXT("Opening %s\n"), argv[1]);
    hFile = CreateFile(argv[1],                    // file to open
                       GENERIC_READ,               // open for reading
                       FILE_SHARE_READ,            // share for reading
                       NULL,                       // default security
                       OPEN_EXISTING,              // existing file only
                       FILE_FLAG_BACKUP_SEMANTICS, // open also directories
                       NULL);                      // no attr. template

    if( hFile == INVALID_HANDLE_VALUE)
    {
        printf("Could not open file (error %d\n)", GetLastError());
        return;
    }

    dwRet = GetFinalPathNameByHandle( hFile, Path, BUFSIZE, VOLUME_NAME_DOS );
    if(dwRet < BUFSIZE)
    {
        if (dwRet)
        {
            _tprintf(TEXT("\nThe final path is: %s\n"), Path);
        }
        else
        {
            printf("Could not get final path (error %d)\n", GetLastError());
        }
    }
    else printf("\nThe required buffer size is %d.\n", dwRet);

    CloseHandle(hFile);
}
