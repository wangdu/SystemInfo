SystemInfo
==========

A simple ColdFusion (CFM) utility API providing a lot of native information of the system.

This utility provides informations such as 
- OS Name
- CPU Frequency
- Process ID
- Number of CPU cores
- Physical Memory (Free & Total)
- Swap Memory (Free & Total)

Usage :
    sysInfo = new SystemInfo();
    sysInfo.getCpuFrequency();
    sysInfo.getPhysicalMemory();


