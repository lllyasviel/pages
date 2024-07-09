@echo off
setlocal enabledelayedexpansion

for %%f in (*.mp4) do (
    set "filename=%%~nf"
    set "extension=%%~xf"
    
    if "!filename:_x264=!" == "%%~nf" (
        if not exist "%%~nf_x264%%~xf" (
            echo Processing %%f
            ffmpeg -i "%%f" -c:v libx264 -crf 1 "%%~nf_x264%%~xf"
        ) else (
            echo Skipping %%f, _x264 version already exists
        )
    ) else (
        echo Skipping %%f, already an _x264 file
    )
)

endlocal
echo Done
pause
