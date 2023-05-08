$workingDir = (Get-Location)
$rootDirectory = Join-Path -Path $workingDir -ChildPath 'Theme\'

$outputFile = "pack.ddf"

$themeName = 'balls'

echo '.OPTION EXPLICIT' > $outputFile
echo ".Set CabinetNameTemplate=`"$themeName.themepack`"" >> $outputFile
echo ".Set DiskDirectory1=`"$workingDir`"" >> $outputFile
echo '.Set MaxDiskSize=0' >> $outputFile
echo '.Set Cabinet=on' >> $outputFile
echo '.Set Compress=on' >> $outputFile
echo '.Set CompressionType=LZX' >> $outputFile
echo '.Set CompressionMemory=21' >> $outputFile