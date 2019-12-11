# Download and extract 64bit packages
"Downloading golang"
Invoke-WebRequest https://dl.google.com/go/go1.13.5.windows-amd64.zip -OutFile golang.zip
"Downloading liteide"
Invoke-WebRequest https://github.com/visualfc/liteide/releases/download/x36.2/liteidex36.2.windows-qt5.9.5.zip -OutFile liteide.zip
"Downloading Git"
Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.24.0.windows.2/PortableGit-2.24.0.2-64-bit.7z.exe -OutFile GitPortable.exe
# no EasyMercurial for now, since it doesn't have a zip download
"Downloading diffutils"
Invoke-WebRequest 'https://sourceforge.net/projects/gnuwin32/files/diffutils/2.8.7-1/diffutils-2.8.7-1-bin.zip'  -UserAgent "" -OutFile diffutils.zip
"Downloading diffutils dependencies"
Invoke-WebRequest 'https://sourceforge.net/projects/gnuwin32/files/diffutils/2.8.7-1/diffutils-2.8.7-1-dep.zip'  -UserAgent "" -OutFile diffutils-dep.zip

Expand-Archive golang.zip .
Expand-Archive liteide.zip .
.\GitPortable.exe -o".\git\" -y
Expand-Archive diffutils.zip .\diff\
Expand-Archive diffutils-dep.zip .\diff\

cd .\workspace\
"golang.org/x/tools/cmd/godoc"+"`n"+"github.com/go-delve/delve/cmd/dlv"+"`n"+"golang.org/x/lint/golint"+"`n"+"github.com/nsf/gocode"+"`n"+"github.com/rogpeppe/godef" | Out-File -FilePath .\GetPackages.txt -Encoding ascii
.\_GetInstall.cmd

# TODO: Delete download files afterwards