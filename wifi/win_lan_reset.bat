echo off

ECHO Starting

netsh winsock reset
netsh int ip reset


set /p temp="Hit enter to end"