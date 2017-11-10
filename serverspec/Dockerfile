FROM microsoft/windowsservercore:10.0.14393.1770

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV chocolateyUseWindowsCompression=false

RUN iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex ; \
    choco feature disable --name showDownloadProgress ; \
    choco install -y ruby

# http://guides.rubygems.org/ssl-certificate-update/#installing-using-update-packages
RUN Invoke-WebRequest -Uri https://rubygems.org/downloads/rubygems-update-2.6.7.gem -OutFile C:\rubygems-update-2.6.7.gem ; \
    gem install --local C:\rubygems-update-2.6.7.gem ; \
    update_rubygems --no-ri --no-rdoc ; \
    gem uninstall rubygems-update -x ; \
    gem install bundler

WORKDIR /code
COPY . /code

RUN bundle config --local path vendor/bundle ; \
    bundle install

VOLUME C:/spec
RUN set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'S:' -Value '\??\C:\spec' -Type String

CMD ["bundle.bat", "exec", "rspec", "--color", "--format", "documentation", "S:/*_spec.rb"]
