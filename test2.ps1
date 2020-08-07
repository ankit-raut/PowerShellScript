
for ( $i = 0; $i -lt $args.count; $i++ ) {
[string]$SourcePathStand = [string]::Format('D:\DesignerImages\UserPhoto\{0}\Customize\Standard\',$args[$i])
[string]$SourcePathThumb = [string]::Format('D:\DesignerImages\UserPhoto\{0}\Customize\Thumbnail\',$args[$i])
[string]$CsvPathStand = [string]::Format('D:\PowerShellScript\{0}_Standard.csv',$args[$i])
[string]$CsvPathThumb = [string]::Format('D:\PowerShellScript\{0}_Thumbnail.csv',$args[$i])
Get-ChildItem $SourcePathStand -recurse -include @("*.jpeg*","*.jpg","*.png") | select-object FullName,CreationTime, LastWriteTime, Length | export-csv -notypeinformation -delimiter ',' -path $CsvPathStand
Get-ChildItem $SourcePathThumb -recurse -include @("*.jpeg*","*.jpg","*.png") | select-object FullName,CreationTime, LastWriteTime, Length | export-csv -notypeinformation -delimiter ',' -path $CsvPathThumb
}

