function Get-HugeDirStats($directory) {
    function go($dir, $stats)
    {
        foreach ($f in [system.io.Directory]::EnumerateFiles($dir))
        {
            $stats.Count++
            $stats.Size += (New-Object io.FileInfo $f).Length
        }
        foreach ($d in [system.io.directory]::EnumerateDirectories($dir))
        {
            go $d $stats
        }
        $stats.SizeInKb = $stats.Size/1024
        $stats.SizeInMb = $stats.SizeInKb/1024
    }
    $statistics = New-Object PsObject -Property @{Count = 0; Size = [long]0 ; SizeInKb = [long]0 ; SizeInMb = [long]0}
    go $directory $statistics

  Write-Host $statistics
}