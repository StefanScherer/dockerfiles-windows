FROM mcr.microsoft.com/windows/servercore:10.0.14393.2007

RUN powershell -command wget -useb -outfile testcase.js https://bugs.chromium.org/p/project-zero/issues/attachment?aid=283405

CMD [ "powershell", "-command", "cat", "testcase.js"  ]
