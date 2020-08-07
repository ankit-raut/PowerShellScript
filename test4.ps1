function Get-HugeDirStats($directory) {

Function IsBetweenDates([Datetime]$start,[Datetime]$end)
{
	$d = get-date
	$s = get-date "$($start.Month)/$($start.Day)/$($d.Year)"
	$e = get-date "$($end.Month)/$($end.Day)/$($d.Year)"
	if (($d -ge $s) -and ($d -le $e))
	{
		return $true
	}
	else
	{
		return $false
	}
}

    function Calculate($dir, $stats)
    {
    $stats.Path = $directory
        $currentDate = Get-Date 
        Write-Host $currentDate

        foreach ($f in [system.io.Directory]::EnumerateFiles($dir))
        {
        $fileinfo = (New-Object io.FileInfo $f) 
        #check for 2015 to 2016
        $startDate = Get-Date "01/01/2020"
        $endDate = Get-Date "01/30/2020"

        if(($fileinfo.CreationTimeUtc -ge $startDate) -AND ($fileinfo.CreationTimeUtc -le $endDate))
        {        
            $stats.Count_2019++
            $stats.Size_2019 += $fileinfo.Length
        }

        elseif($fileinfo.CreationTime -ge "01/16/2020" -and $fileinfo.CreationTime -le "01/30/2020")
        {        
            $stats.Count_2020++
            $stats.Size_2020 += $fileinfo.Length
        }
        else{
         $stats.Size_2018 += $fileinfo.Length
        }

        }
        #$stats.SizeInKb = $stats.Size/1024
        #$stats.SizeInMb = $stats.SizeInKb/1024
    }
    $statistics = New-Object PsObject -Property @{Path = '';Count_2015 = 0;Count_2016 = 0;Count_2017 = 0;Count_2018 = 0;Count_2019 = 0;Count_2020 = 0; Size_2015 = [long]0;Size_2016 = [long]0;Size_2017 = [long]0;Size_2018 = [long]0;Size_2019 = [long]0;Size_2020 = [long]0; SizeInMb = [long]0}
    Calculate $directory $statistics
    Write-Host $statistics
    Write-Host "true"
}

for ( $i = 0; $i -lt $args.count; $i++ ) {
[string]$SourcePathStand = [string]::Format('D:\DesignerImages\UserPhoto\{0}\Customize\Standard\',$args[$i])
[string]$SourcePathThumb = [string]::Format('D:\DesignerImages\UserPhoto\{0}\Customize\Thumbnail\',$args[$i])


}


