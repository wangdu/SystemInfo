<cfscript>
    // Create System Info object.
    sys = new SystemInfo();

    writeOutput("<br>OS Name : " & sys.getOSName());

    // Get CPU Frequency
    freq = sys.getCpuFrequency();
    writeOutput("<br>Frequency : " & freq);

    // Get Process ID of the current process
    pid = sys.getCurrentPid();
    writeOutput("<br>PID : " & pid);

    // Get number of CPU cores
    cores = sys.getNumberOfCPUCores();
    writeOutput("<br>CPU :" & cores);

    // Get uptime
    uptime = sys.getUptimeInSeconds();
    hour = int(uptime/3600);
    minutes = (uptime/60) mod 60;
    seconds = uptime mod 60;
    writeOutput("<br>Uptime : " & hour & ":" & minutes & ":" & seconds);

	// Get Physical memory
    cfdump(var="#sys.getPhysicalMemory()#", label="Physical memory");

    // Get Swap Space
    cfdump(var="#sys.getSwapSpace()#", label="Swap Space");

</cfscript>
