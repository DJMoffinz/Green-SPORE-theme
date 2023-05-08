$workingDir = (Get-Location)
$rootDirectory = Join-Path -Path $workingDir -ChildPath 'Theme\'

$outputFile = "pack.ddf"

#$themeName = (Get-Content Theme\Theme.ini | Select -Skip 1 | Select -Last 1).Substring(12)
$themeName = 'balls'

echo '.OPTION EXPLICIT' > $outputFile
echo ".Set CabinetNameTemplate=`"$themeName.themepack`"" >> $outputFile
echo ".Set DiskDirectory1=`"$workingDir`"" >> $outputFile
echo '.Set MaxDiskSize=0' >> $outputFile
echo '.Set Cabinet=on' >> $outputFile
echo '.Set Compress=on' >> $outputFile
echo '.Set CompressionType=LZX' >> $outputFile
echo '.Set CompressionMemory=21' >> $outputFile

Get-ChildItem -Path $rootDirectory -Recurse  | ForEach-Object {
    $fullPath = $_.FullName
    $relativePath = $_.FullName.Replace($rootDirectory, "")
    if ($relativePath -eq "Theme.ini") {
        $relativePath = "$themeName.theme"
    }
    $line = "`"$fullPath`" `"$relativePath`""
    $line | Out-File $outputFile -Append
}

cmd makecab.exe /f pack.ddf