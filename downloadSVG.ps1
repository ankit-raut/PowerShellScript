
function GetImagePathFromSvg($SvgPath) {
    [xml]$SvgDetails = Get-Content $SvgPath

    foreach($imageNode in $SvgDetails.GetElementsByTagName("image")){
        Write-Host "Href : " $imageNode.Attribute("href")      
        Write-Host "Effect Url : " $imageNode.artifi-id 
        }   
    foreach($imageNode in $SvgDetails.GetElementsByTagName("text")){
        Write-Host "text-src : " $imageNode.text-src      
        }    
}

GetImagePathFromSvg "D:\DesignerImages\UserPhoto\4BD7B1CD-1FA1-4CCD-8A61-7FBD271195C1\Customize\SVG\bd351b69-e91e-4726-82e9-9a04c8b605ad.svg"
Write-Host "Testing"