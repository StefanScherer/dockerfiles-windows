FROM stefanscherer/ruby-windows:2.5.0.1

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR /code
COPY . /code

RUN bundle config --local path vendor/bundle ; \
    bundle install

VOLUME C:/spec
RUN set-itemproperty -path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' -Name 'S:' -Value '\??\C:\spec' -Type String

CMD ["bundle.bat", "exec", "rspec", "--color", "--format", "documentation", "S:/*_spec.rb"]
