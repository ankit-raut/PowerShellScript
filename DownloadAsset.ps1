
function DownloadFile($URL) {

    $DestinationPath = $URL

    $designerImages = "D:\DesignerImages\"
    $adminImages = "D:\Images\"

    $DestinationPath  = $DestinationPath -replace "http:", "https:" 

    $DestinationPath  = $DestinationPath -replace "https://stagedesignerimages.artifi.net/", $designerImages 
    $DestinationPath  = $DestinationPath -replace "https://stageimages.artifi.net/", $adminImages 

    $DestinationPath  = $DestinationPath -replace "https://integrationdesignerimages.artifi.net/", $designerImages 
    $DestinationPath  = $DestinationPath -replace "https://integrationimages.artifi.net/", $adminImages 

    $DestinationPath  = $DestinationPath -replace "https://designerimages.artifi.net/", $designerImages 
    $DestinationPath  = $DestinationPath -replace "https://images.artifi.net/", $adminImages 
    
    $DestinationPath  = $DestinationPath -replace "/","\"

    $FolderPath = Split-Path -Path $DestinationPath
    If(!(test-path $FolderPath))
    {
    New-Item -ItemType Directory -Force -Path $FolderPath
    }

    $wc = New-Object System.Net.WebClient
    $wc.DownloadFile($URL, $DestinationPath)

    if (Test-Path $DestinationPath -PathType leaf) {
        Write-Host "File Saved => " $DestinationPath 
    }
    else {
        Write-Host "File Not Saved"
    }

}
for ( $i = 0; $i -lt $args.count; $i++ ) {
        #Solution 1 - WebClient
        DownloadFile $args[$i]
}
