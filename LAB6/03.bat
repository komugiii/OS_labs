sc stop dnscache
timeout /t 5
sc query > query2.txt
call 04.bat
sc start dnscache