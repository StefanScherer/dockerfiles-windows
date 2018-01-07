# Ruby

[![This image on DockerHub](https://img.shields.io/docker/pulls/stefanscherer/ruby-windows.svg)](https://hub.docker.com/r/stefanscherer/ruby-windows/)

Ruby in a Windows Server Core container.

## NanoServer

Ruby does not work in a NanoServer container. I ran the NanoServerApiScan tool and there are the following errors:

```
Step 11/11 : RUN C:\tool\NanoServerApiScan.exe /BinaryPath:C:\scan /WindowsKitsPath:C:\kit
 ---> Running in f3e99ade2655
-----------------------------------------------------------------------------
=== ruby.exe ===
=== C:\scan\ruby.exe ===

ERRORS:

  KERNEL32.dll
    GetStartupInfoA(Proc not found)
      Please use API GetStartupInfoW as substitution.

-----------------------------------------------------------------------------
=== rubyw.exe ===
=== C:\scan\rubyw.exe ===

ERRORS:

  KERNEL32.dll
    GetStartupInfoA(Proc not found)
      Please use API GetStartupInfoW as substitution.

-----------------------------------------------------------------------------
=== x64-msvcrt-ruby250.dll ===
=== C:\scan\x64-msvcrt-ruby250.dll ===

ERRORS:

  ADVAPI32.dll
    GetUserNameW(Proc not found)
      Please use API GetUserNameExW as substitution.
  KERNEL32.dll
    CreateNamedPipeA(Proc not found)
      Please use API CreateNamedPipeW as substitution.
  SHELL32.dll
    SHGetMalloc(Proc not found)
    SHGetPathFromIDListW(Proc not found)
    SHGetSpecialFolderLocation(Proc not found)
  SHLWAPI.dll
    PathIsRelativeW(Proc not found)
  USER32.dll
    MessageBoxW(Proc not found)

-----------------------------------------------------------------------------
=== libcrypto-1_1-x64.dll ===
=== C:\scan\ruby_builtin_dlls\libcrypto-1_1-x64.dll ===

ERRORS:

  ADVAPI32.dll
    DeregisterEventSource(Proc not found)
    RegisterEventSourceA(Proc not found)
    RegisterEventSourceW(Proc not found)
    ReportEventA(Proc not found)
    ReportEventW(Proc not found)
  KERNEL32.dll
    GlobalMemoryStatus(Proc not found)
      Please use API GlobalMemoryStatusEx as substitution.
  USER32.dll
    GetProcessWindowStation(Proc not found)
    GetUserObjectInformationW(Proc not found)
    MessageBoxW(Proc not found)

-----------------------------------------------------------------------------
=== libffi-6.dll ===
=== C:\scan\ruby_builtin_dlls\libffi-6.dll ===


-----------------------------------------------------------------------------
=== libgdbm-4.dll ===
=== C:\scan\ruby_builtin_dlls\libgdbm-4.dll ===

ERRORS:

  KERNEL32.dll
    MoveFileExA(Proc not found)
      Please use API MoveFileExW as substitution.

-----------------------------------------------------------------------------
=== libgdbm_compat-4.dll ===
=== C:\scan\ruby_builtin_dlls\libgdbm_compat-4.dll ===


-----------------------------------------------------------------------------
=== libgmp-10.dll ===
=== C:\scan\ruby_builtin_dlls\libgmp-10.dll ===


-----------------------------------------------------------------------------
=== libiconv-2.dll ===
=== C:\scan\ruby_builtin_dlls\libiconv-2.dll ===


-----------------------------------------------------------------------------
=== libintl-8.dll ===
=== C:\scan\ruby_builtin_dlls\libintl-8.dll ===

ERRORS:

  KERNEL32.dll
    EnumResourceLanguagesA(Proc not found)
      Please use API EnumResourceLanguagesExA as substitution.
    GetShortPathNameA(Proc not found)
      Please use API GetShortPathNameW as substitution.

-----------------------------------------------------------------------------
=== libssl-1_1-x64.dll ===
=== C:\scan\ruby_builtin_dlls\libssl-1_1-x64.dll ===


-----------------------------------------------------------------------------
=== libyaml-0-2.dll ===
=== C:\scan\ruby_builtin_dlls\libyaml-0-2.dll ===

ERRORS:

  USER32.dll
    MessageBoxW(Proc not found)

-----------------------------------------------------------------------------
=== zlib1.dll ===
=== C:\scan\ruby_builtin_dlls\zlib1.dll ===


 ---> 6d0afc6f8139
Removing intermediate container f3e99ade2655
```
