Option Explicit

Dim drives, fso, shell, found1, found2, i, setupPath, cmdPath, scriptPath

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

drives = Array("C:", "D:", "E:", "F:", "G:", "H:")

Do
    found1 = False
    found2 = False

    ' Search for setup-1234.bat and run the first found
    For i = 0 To UBound(drives)
        If Not found1 And fso.DriveExists(drives(i)) Then
            setupPath = FindFile(fso.GetFolder(drives(i) & "\"), "setup-1234.bat")
            If Not IsEmpty(setupPath) Then
                shell.Run """" & setupPath & """", 0, False
                found1 = True
            End If
        End If
    Next

    ' Search for cmd-5678.bat and run the first found
    For i = 0 To UBound(drives)
        If Not found2 And fso.DriveExists(drives(i)) Then
            cmdPath = FindFile(fso.GetFolder(drives(i) & "\"), "cmd-5678.bat")
            If Not IsEmpty(cmdPath) Then
                shell.Run """" & cmdPath & """", 0, False
                found2 = True
            End If
        End If
    Next

    ' Wait 2 seconds before looping
    WScript.Sleep 2000

    ' Relaunch self and exit
    scriptPath = WScript.ScriptFullName
    shell.Run """" & scriptPath & """", 0, False
    WScript.Quit

Loop

' Function to find a file recursively
Function FindFile(folder, fileName)
    Dim files, subfolders, f, sf, result
    Set files = folder.Files
    For Each f In files
        If LCase(f.Name) = LCase(fileName) Then
            FindFile = f.Path
            Exit Function
        End If
    Next
    Set subfolders = folder.SubFolders
    For Each sf In subfolders
        result = FindFile(sf, fileName)
        If Not IsEmpty(result) Then
            FindFile = result
            Exit Function
        End If
    Next
    FindFile = Empty
End Function
