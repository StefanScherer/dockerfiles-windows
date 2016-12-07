Configuration DemoWebSeite
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

# create .mof file
DemoWebSeite -OutputPath c:\code
