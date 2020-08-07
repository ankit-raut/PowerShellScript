$localPath = 'D:\PowerShellScript\Reports1'

if(Test-Path $localPath){
Write-Host 'Path Present'
}
else {
Write-Host 'Not Present'
$directyname = [system.io.Path]::GetDirectoryName($localPath)

Write-Host $directyname

[system.io.Directory]::CreateDirectory($directyname)
if(Test-Path $localPath){
Write-Host 'Path Created'
}
else {
Write-Host 'Not Present'
}
}