# Zips up the ExampleContentLibMod directory but skip the .gitkeep files, notably keeping empty directories

$SourceDir = "$PSScriptRoot\ExampleContentLibMod"
$DestinationZip = "$PSScriptRoot\ExampleContentLibMod.zip"

$sourceFullPath = Resolve-Path -Path $SourceDir -ErrorAction Stop
$destinationFullPath = Resolve-Path -Path (Split-Path -Path $DestinationZip -Parent) -ErrorAction SilentlyContinue

if (-not $sourceFullPath) {
    Write-Error "Source directory '$SourceDir' does not exist."
    exit 1
}

if (-not $destinationFullPath) {
    $destinationFullPath = Split-Path -Path $DestinationZip -Parent
    if (-not (Test-Path -Path $destinationFullPath)) {
        New-Item -ItemType Directory -Path $destinationFullPath | Out-Null
    }
}

$files = Get-ChildItem -Path $SourceDir -Recurse -File | Where-Object { $_.Name -ne '.gitkeep' }
$directories = Get-ChildItem -Path $SourceDir -Recurse -Directory

if (-not $files -and -not $directories) {
    Write-Error "No files or directories found to add to the zip archive."
    exit 1
}

if (Test-Path -Path $DestinationZip) {
    Write-Host "Removing existing $DestinationZip"
    Remove-Item -Path $DestinationZip -Force
}

Add-Type -AssemblyName System.IO.Compression.FileSystem | Out-Null

$zipFile = [System.IO.Compression.ZipFile]::Open($DestinationZip, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    $createdEntries = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($file in $files) {
        $relativePath = $file.FullName.Substring($sourceFullPath.ProviderPath.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
        $entryPath = $relativePath -replace [regex]::Escape([System.IO.Path]::DirectorySeparatorChar), '/'
        Write-Host "Adding file: $entryPath"

        $createdEntries.Add($entryPath) | Out-Null
        $entry = $zipFile.CreateEntry($entryPath, [System.IO.Compression.CompressionLevel]::Optimal)
        $entryStream = $entry.Open()
        try {
            $fileStream = [System.IO.File]::OpenRead($file.FullName)
            try {
                $fileStream.CopyTo($entryStream)
            }
            finally {
                $fileStream.Dispose()
            }
        }
        finally {
            $entryStream.Dispose()
        }
    }

    foreach ($dir in $directories) {
        $relativePath = $dir.FullName.Substring($sourceFullPath.ProviderPath.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
        if ([string]::IsNullOrEmpty($relativePath)) {
            continue
        }

        $entryPath = ($relativePath -replace [regex]::Escape([System.IO.Path]::DirectorySeparatorChar), '/') + '/'
        if (-not $createdEntries.Contains($entryPath)) {
            Write-Host "Adding directory: $entryPath"
            $zipFile.CreateEntry($entryPath) | Out-Null
            $createdEntries.Add($entryPath) | Out-Null
        }
    }
}
finally {
    $zipFile.Dispose()
}

Write-Host "Created zip: $DestinationZip"
