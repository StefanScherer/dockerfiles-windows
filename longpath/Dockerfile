# escape=`
FROM mcr.microsoft.com/windows/servercore-insider

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY .  .

RUN mkdir C:\target

# Test tar.exe to extract archives with long paths
RUN tar xzf C:\longpath.zip -C C:\target

# Test tar.exe to create archives with long paths
RUN tar czf C:\test.tar.gz target ; `
    $output = $(tar tzvf test.tar.gz) ; `
    if (!($output -match 'subfolders-7\/README.md')) { Write-Error 'Long pathes do not work with tar!' } else { Write-Output 'Long pathes work with tar, yes!!' }


# RUN Add-Type -AssemblyName System.IO.Compression.FileSystem ; `
#     [System.IO.Compression.ZipFile]::ExtractToDirectory('C:\longpath.zip', 'C:\target')
#
# Exception calling "ExtractToDirectory" with "2" argument(s): "Could not find a 
# part of the path 'C:\target\a-very-long-foldername-with-deep-nested-subfolders-
# 1\a-very-long-foldername-with-deep-nested-subfolders-2\a-very-long-foldername-w
# ith-deep-nested-subfolders-3\a-very-long-foldername-with-deep-nested-subfolders
# -4\a-very-long-foldername-with-deep-nested-subfolders-5\'."
# At line:1 char:134
# + ... ileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory('C:\l ...
# +                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#     + CategoryInfo          : NotSpecified: (:) [], ParentContainsErrorRecordE 
#    xception
#     + FullyQualifiedErrorId : DirectoryNotFoundException


# RUN Expand-Archive C:\longpath.zip -DestinationPath C:\target
# 
# Remove-Item : Cannot find path 
# 'C:\target\a-very-long-foldername-with-deep-nested-subfolders-1\README.md' 
# because it does not exist.
# At C:\Windows\system32\WindowsPowerShell\v1.0\Modules\Microsoft.PowerShell.Arch
# ive\Microsoft.PowerShell.Archive.psm1:410 char:46
# + ...                 $expandedItems | % { Remove-Item $_ -Force -Recurse }
# +                                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#     + CategoryInfo          : ObjectNotFound: (C:\target\a-ver...ers-1\README. 
#    md:String) [Remove-Item], ItemNotFoundException
#     + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.Remov 
#    eItemCommand
