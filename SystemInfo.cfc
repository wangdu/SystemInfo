/**
 * Utility API to get all the native information. It uses JavaSysMon library shipped with ColdFusion 10 & 11.
 * In case you are running an older version of ColdFusion server, you can download the library from 
 * https://github.com/jezhumble/javasysmon
 * 
 */
Component SystemInfo
{
    property sysmon;
    
    public function init()
    {
        sysmon = CreateObject("java", "com.jezhumble.javasysmon.JavaSysMon");
        return this;
    }
    
    /**
     * Returns the OS Name
     */
    public string function getOSName()
    {
        return sysmon.osName();
    }
 
    /**
     * Returns the CPU frequency in Ghz
     */
    public numeric function getCpuFrequency()
    {
        return sysmon.cpuFrequencyInHz()/1000000000;
    }
    
    /**
     * Returns the ID of the current process
     */
    public numeric function getCurrentPid()
    {
        return sysmon.currentPid();
    }
    
    /**
     * Kills the process with given pid.
     * @pid process id
     */
    public function killProcess(pid) 
    {
        sysmon.killProcess(pid); 
    }
    
    /**
     * Returns the number of CPU cores
     */
    public numeric function getNumberOfCPUCores()
    {
        return sysmon.numCpus();
    }
    
    /**
     * Returns Uptime of the machine in seconds
     */
    public numeric function getUptimeInSeconds()
    {
        return sysmon.uptimeInSeconds();
    }
    
    /**
     * Returns a struct with details on physical memory. 
     * Struct contains two keys - "free" & "total". The memory value would be in MB
     */
    public struct function getPhysicalMemory()
    {
        var stats = sysmon.physical();
        var free = stats.getFreeBytes()/(1024*1024);
        var total = stats.getTotalBytes()/(1024*1024);
        return {"free":free, "total":total};
    }
    
    /**
     * Returns a struct with details on Swap space. 
     * Struct contains two keys - "free" & "total". The memory value would be in MB
     */    
    public struct function getSwapSpace()
    {
        var swap = sysmon.swap();
        var free = swap.getFreeBytes()/(1024*1024);
        var total = swap.getTotalBytes()/(1024*1024);        
        return {"free" : free, "total" : total};
    }
    
}
