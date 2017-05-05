Configuration DemoWebSite
{
  Node $(hostname)
  {
    WindowsFeature IIS
    {
      Name = "Web-Server"
      Ensure = "Present"
    }
  }
}

DemoWebSite -OutputPath .\demo
Start-DscConfiguration -Wait -Verbose -Path .\demo -Force
Remove-Item .\demo -Force -Recurse
