#Requires -Module Poshspec

Describe 'Services' {    
    Service Dnscache Status { Should Be Running }
    Service bits Status { Should Not Exist }
}

Describe 'Files' {
    File C:\License.txt { Should Exist }
#    File C:\inetpub\wwwroot\iisstart.htm { Should Contain 'text-align:center' }
}

Describe 'Packages' {
    File 'C:\Program Files\WindowsPowerShell\Modules\Poshspec\2.2.1\Private\Invoke-PoshspecExpression.ps1' { Should Exist }
#    Package 'poshspec' { Should be '2.2.1' }
}

Describe 'Registry' {
    Registry HKLM:\SOFTWARE\Microsoft\Rpc\ClientProtocols { Should Exist }
    Registry HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\ "SyncDomainWithMembership" { Should Be 1  }
    Registry 'HKLM:\SOFTWARE\Callahan Auto\' { Should Not Exist }
}

#Describe 'Http' {
#    TcpPort localhost 80 PingSucceeded { Should Be $true }
#    TcpPort localhost 80 TcpTestSucceeded { Should Be $true }
#    Http http://localhost StatusCode { Should Be 200 }
#    Http http://localhost RawContent { Should Match 'X-Powered-By: ASP.NET' }
#    Http http://localhost RawContent { Should Not Match 'X-Powered-By: Cobal' }
#}
