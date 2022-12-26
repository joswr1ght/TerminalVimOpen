on run {input, parameters}

    set filename to POSIX path of input

    set cmd to "clear && 'vim' '" & filename & "' && exit"

    if application "iTerm" is running then
        tell application "iTerm"
            set newWindow to (create window with default profile)
            tell current session of newWindow
                write text cmd
            end tell
        end tell
    else
        activate application "iTerm"
        tell application "iTerm"
            repeat until (exists current window)
                delay 0.1
            end repeat
            set newWindow to current window
            tell current session of newWindow
                write text cmd
            end tell
        end tell
    end if

end run
