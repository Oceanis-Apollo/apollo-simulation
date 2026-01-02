@ echo off 

setlocal EnableDelayedExpansion

set "prj_dir=%~dp0.."

if [%1]==[] goto usage
if not exist %1\ (
    echo %1\ does not exist
    goto usage
)
if not exist "%~1%\orbiter.exe" (
    echo %1\ is not orbiter root
    goto usage
)
set "orbiter_root=%~1"

for %%f in (
    Config\AMSO\Moon.cfg
    Config\Moon\Base\AMSO\Taurus_Littrow.cfg
    Config\IMFD5.cfg
    XRSound\XRSound.cfg
) do (
    set "src_file=%prj_dir%\%%~f"
    set "dst_file=%orbiter_root%\%%~f"
    set "org_file=!dst_file!.org"
    rem echo "!src_file!"
    rem echo "!dst_file!"
    rem echo "!org_file!"
    if not exist "!org_file!" (
        echo backup "!dst_file!" to "!org_file!"
        copy /y "!dst_file!" "!org_file!"
    )
    echo copy "!src_file!" to "!dst_file!"
    copy /y "!src_file!" "!dst_file!"
)

goto eof

:usage
@echo Usage: %0 ^<Orbiter root path^>
exit /B 1

:eof