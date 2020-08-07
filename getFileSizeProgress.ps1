function Get-HugeDirStats($directory,$CompanyFolder,$FolderName) {
    
    function GetSizeInMb($stats){
     $stats.Size_2015 = $stats.Size_2015/1MB
     $stats.Size_2016 = $stats.Size_2016/1MB
     $stats.Size_2017 = $stats.Size_2017/1MB
     $stats.Size_2018 = $stats.Size_2018/1MB
     $stats.Size_2019 = $stats.Size_2019/1MB
     $stats.Size_2020 = $stats.Size_2020/1MB
    }

    function Calculate($dir, $stats)
    {
    $stats.Path = $directory
    $files = [system.io.Directory]::GetFiles($dir)
    $filesCount = $files.Count
    $operation = 0
    Write-Host $filesCount

        foreach ($f in $files)
        {

        $fileinfo = (New-Object io.FileInfo $f) 
        #check for 2015
        if(($fileinfo.CreationTimeUtc -ge '01/01/2015') -AND ($fileinfo.CreationTimeUtc -le '12/31/2015'))
        {        
            $stats.Count_2015++
            $stats.Size_2015 += $fileinfo.Length
        }

        #check for 2016
        elseif(($fileinfo.CreationTimeUtc -ge '01/01/2016') -AND ($fileinfo.CreationTimeUtc -le '12/31/2016'))
        {        
            $stats.Count_2016++
            $stats.Size_2016 += $fileinfo.Length
        }
          #check for 2017
        elseif(($fileinfo.CreationTimeUtc -ge '01/01/2017') -AND ($fileinfo.CreationTimeUtc -le '12/31/2017'))
        {        
            $stats.Count_2017++
            $stats.Size_2017 += $fileinfo.Length
        }
          #check for 2018
        elseif(($fileinfo.CreationTimeUtc -ge '01/01/2018') -AND ($fileinfo.CreationTimeUtc -le '12/31/2018'))
        {        
            $stats.Count_2018++
            $stats.Size_2018 += $fileinfo.Length
        }
          #check for 2019
        elseif(($fileinfo.CreationTimeUtc -ge '01/01/2019') -AND ($fileinfo.CreationTimeUtc -le '12/31/2019'))
        {        
            $stats.Count_2019++
            $stats.Size_2019 += $fileinfo.Length
        }
          #check for 2020
        elseif(($fileinfo.CreationTimeUtc -ge '01/01/2020') -AND ($fileinfo.CreationTimeUtc -le '12/31/2020'))
        {        
            $stats.Count_2020++
            $stats.Size_2020 += $fileinfo.Length
        }
        else{
         $stats.Count_UnMatched++
         $statsSize_Unmatched += $fileinfo.Length
        }

        }
      GetSizeInMb $stats

     # $operation++
     # Write-Progress -Activity 'Copying data' -Status 'Progress' -PercentComplete ($operation/$filesCount*100)

     # Start-Sleep -s 30

    }
    $statistics = New-Object PsObject -Property @{Path = '';Count_2015 = 0;Count_2016 = 0;Count_2017 = 0;Count_2018 = 0;Count_2019 = 0;Count_2020 = 0;Count_UnMatched = 0; Size_2015 = [long]0;Size_2016 = [long]0;Size_2017 = [long]0;Size_2018 = [long]0;Size_2019 = [long]0;Size_2020 = [long]0; Size_Unmatched = [long]0}
    Calculate $directory $statistics

    #Write-Host $statistics
    Write-Host "==========================================================="
    Write-Host ($statistics | Format-List | Out-String)
    Write-Host "==========================================================="

    $statistics | export-csv -notypeinformation -delimiter ',' -path D:\PowerShellScript\Reports\$CompanyFolder'_'$FolderName.csv

}

for ( $i = 0; $i -lt $args.count; $i++ ) {
[string]$SourcePathStand = [string]::Format('D:\DesignerImages\UserPhoto\{0}\Customize\Standard\',$args[$i])
Get-HugeDirStats $SourcePathStand $args[$i] "Standard"
[string]$SourcePathThumb = [string]::Format('D:\DesignerImages\UserPhoto\{0}\Customize\Thumbnail\',$args[$i])
#Get-HugeDirStats $SourcePathThumb $args[$i] "Thumbnail"


}


