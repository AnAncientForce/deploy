$sep = "--------------------------------------------------"
$poi_s = "--------------------------------------------------)"
$poi_e = "(--------------------------------------------------"

$main_letter = "D"
$main_dir = "${main_letter}:\Library\scripts\deploy"



function success {
    Write-Host "$poi_s Completed Successfully $poi_e"
}

function failure {
    Write-Host "$poi_s Errors Occurred $poi_e"
}

function youtube {
    param (
        [string]$type,
        [string]$video
    )
    $path = "C:/Users/Y/Downloads"
    switch ($type) {
        "video" {
            yt-dlp -f mp4 -o "Z:\Discord Media\%(title)s.%(ext)s" $video
        }
        "playlist" {
            yt-dlp -f 'bestvideo[ext=mp4]' --output "$path/%(playlist_title)s/%(title)s.%(ext)s" $video
        }
        "playlist-audio" {
            yt-dlp -f bestaudio/best --extract-audio --audio-format mp3 --output "$path/%(playlist_title)s/%(title)s.%(ext)s" $video
        }
        "playlist-silent" {
            yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" --extract-audio --audio-quality 0 -o "$path/%(playlist_title)s/%(title)s.%(ext)s" $video
        }
        "playlist-thumbnail" {
            yt-dlp -f bestaudio/best --extract-audio --audio-format mp3 --embed-thumbnail --output "$path/%(playlist_title)s/%(title)s.%(ext)s" $video
        }
        "channel-playlist-thumbnail" {
            yt-dlp -f bestaudio/best --extract-audio --audio-format mp3 --embed-thumbnail --output "$path/%(uploader)s/playlists/%(playlist)s/%(title)s.%(ext)s" -v $video
        }
        default {
            Write-Host "Invalid type"
            failure
        }
    }
    success
}

function god {
    Write-Host "$poi_s God Mode $poi_e"
    Start-Process explorer.exe -ArgumentList "shell:::{ED7BA470-8E54-465E-825C-99712043E01C}"
    success
}

function RWE {
    Write-Host "$poi_s Restart Windows Explorer $poi_e"
    # Stop-Process -Name TranslucentTB -Force -ErrorAction SilentlyContinue
    Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
    Start-Process explorer.exe
    # Start-Sleep -Seconds 5
    # Start-Process "$env:userprofile\AppData\Local\Microsoft\WindowsApps\ttb.exe"
    success
}

#function ML {
#    Write-Host "$poi_s Make Symbolic Links $poi_e"
#    Start-Process -FilePath "$PSScriptRoot\ML.bat" -Wait
#    success
#}

function ML {
    $c_drive = "C"
    $letter = "D"
    $user = $env:USERNAME
    Write-Host "$poi_s Make Symbolic Links $poi_e"
    # AppData
    # Local
    # Roaming
    # Library
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\source\repos"                                                              -Target "${letter}:\Library\dev\repos"

    # AUTOMATIC1111
    New-Item -ItemType Junction -Path "${letter}:\Library\AI\stable-diffusion-webui\models\Stable-diffusion"                               -Target "${letter}:\Library\AI\stable-diffusion\models"
    New-Item -ItemType Junction -Path "${letter}:\Library\AI\stable-diffusion-webui\models\Lora"                                           -Target "Z:\stable-diffusion\lora"
    New-Item -ItemType Junction -Path "${letter}:\Library\AI\stable-diffusion-webui\embeddings"                                            -Target "${letter}:\Library\AI\stable-diffusion\embeddings"
    New-Item -ItemType Junction -Path "${letter}:\Library\AI\stable-diffusion-webui\outputs"                                               -Target "Z:\Pictures\Stable Diffusion\AUTOMATIC1111"

    # EasyDiffusion
    New-Item -ItemType Junction -Path "${letter}:\Library\AI\EasyDiffusion\models\stable-diffusion"                                        -Target "${letter}:\Library\AI\stable-diffusion\models"
    New-Item -ItemType Junction -Path "${letter}:\Library\AI\EasyDiffusion\models\lora"                                                    -Target "Z:\stable-diffusion\lora"
    New-Item -ItemType Junction -Path "${letter}:\Library\AI\EasyDiffusion\models\embeddings"                                              -Target "${letter}:\Library\AI\stable-diffusion\embeddings"

    # ComfyUI
    New-Item -ItemType Junction -Path "${letter}:\Library\git\new_ComfyUI_windows_portable_nvidia_cu121_or_cpu\ComfyUI_windows_portable\ComfyUI\models\checkpoints" -Target "${letter}:\Library\AI\stable-diffusion\models"
    New-Item -ItemType Junction -Path "${letter}:\Library\git\new_ComfyUI_windows_portable_nvidia_cu121_or_cpu\ComfyUI_windows_portable\ComfyUI\models\loras"       -Target "Z:\stable-diffusion\lora"
    New-Item -ItemType Junction -Path "${letter}:\Library\git\new_ComfyUI_windows_portable_nvidia_cu121_or_cpu\ComfyUI_windows_portable\ComfyUI\models\embeddings"  -Target "${letter}:\Library\AI\stable-diffusion\embeddings"
    New-Item -ItemType Junction -Path "${letter}:\Library\git\new_ComfyUI_windows_portable_nvidia_cu121_or_cpu\ComfyUI_windows_portable\ComfyUI\output"             -Target "Z:\Pictures\Stable Diffusion\ComfyUI"

    # Z:\
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\Mozilla"                                                    -Target "Z:\AppData\Roaming\Mozilla"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\Standard Notes"                                             -Target "Z:\AppData\Roaming\Standard Notes"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\Mega Limited"                                                 -Target "Z:\AppData\Local\Mega Limited"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\Google"                                                       -Target "Z:\AppData\Local\Google"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\Roblox\LocalStorage"                                          -Target "Z:\AppData\Local\Roblox\LocalStorage"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\Discord"                                                      -Target "Z:\AppData\Local\Discord"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\Spotify"                                                      -Target "Z:\AppData\Local\Spotify"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\YouTube Music"                                              -Target "Z:\AppData\Roaming\YouTube Music"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\revolt-desktop"                                             -Target "Z:\AppData\Roaming\revolt-desktop"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\Documents\KoeiTecmo"                                                        -Target "Z:\AppData\KoeiTecmo"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\Documents\ShareX"                                                           -Target "Z:\AppData\ShareX"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\Pictures\Roblox"                                                            -Target "Z:\Pictures\Roblox"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\Pictures\BlueStacks"                                                        -Target "Z:\Pictures\BlueStacks"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\Videos\Roblox"                                                              -Target "Z:\Videos\Roblox"

    # share
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\HoYoverse"                                                    -Target "${letter}:\Library\share\AppData\Local\HoYoverse"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\ukmm"                                                         -Target "${letter}:\Library\share\AppData\Local\ukmm"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\Chromium"                                                     -Target "${letter}:\Library\share\AppData\Local\Chromium"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\librewolf"                                                    -Target "${letter}:\Library\share\AppData\Local\librewolf"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"  -Target "${letter}:\Library\share\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\librewolf"                                                  -Target "${letter}:\Library\share\AppData\Roaming\librewolf"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\Code"                                                       -Target "${letter}:\Library\share\AppData\Roaming\Code"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\Dolphin Emulator"                                           -Target "${letter}:\Library\share\AppData\Roaming\Dolphin Emulator"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\VeraCrypt"                                                  -Target "${letter}:\Library\share\AppData\Roaming\VeraCrypt"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\MusicBee"                                                   -Target "${letter}:\Library\share\AppData\Roaming\MusicBee"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\obs-studio"                                                 -Target "${letter}:\Library\share\AppData\Roaming\obs-studio"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\AppData\Roaming\yuzu"                                                       -Target "${letter}:\Library\share\AppData\Roaming\yuzu"
    New-Item -ItemType Junction -Path "${c_drive}:\ProgramData\BlueStacks_nxt"                                                               -Target "${letter}:\Library\share\ProgramData\BlueStacks_nxt"
    New-Item -ItemType Junction -Path "${c_drive}:\ProgramData\Blackmagic Design"                                                            -Target "${letter}:\Library\share\ProgramData\Blackmagic Design"
    New-Item -ItemType Junction -Path "${c_drive}:\Users\${user}\.vscode"                                                                    -Target "${letter}:\Library\share\User\.vscode"


    success
}

function test {
    Write-Host $sep
}

function tweaks {
    Write-Host "$poi_s System Tweaks $poi_e"
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File '$PSScriptRoot\admin.ps1' -Command '& {tweaks}'" -Verb RunAs -Wait
    success
}

function update {
    Write-Host "$poi_s Update $poi_e"
    # Start-Process -FilePath "$PSScriptRoot\update.bat" -Wait
    get_packages
    success
}

function get_packages {
    $jsonPath = Join-Path $PSScriptRoot "data.json"

    Write-Host "Automatic fallback is in action; If a package cannot be obtained via winget, a choco install will be attempted."

    if (Test-Path $jsonPath) {
        $packages = Get-Content $jsonPath | ConvertFrom-Json

        Write-Host "Checking winget packages:"
        foreach ($package in $packages.packages) {
            if ($package.winget -eq "") {
                Write-Host "No winget package is available for $($package.winget), now checking choco..."

                if ($package.choco -eq "") {
                    Write-Host "No choco package fwas found for $($package.choco)"
                    Write-Host "[!] No packages were found, skipped."
                }
                else {
                    Write-Host "Now installing: $($package.choco)"
                    choco install $($package.choco)
                }
            }
            else {
                Write-Host "Now installing: $($package.winget)"
                if ($packages.ask) {
                    if ($package.ask -eq $true) {
                        $proceed = Read-Host "Proceed with install? (y/n)"
                        if ($proceed -eq 'y') {
                            winget install --id=$($package.winget) -e
                        }
                        else {
                            Write-Host "Skipped: $($package.winget)"
                        }
                    }
                }
                else {
                    winget install --id=$($package.winget) -e
                }
            }
        }
    }
    else {
        Write-Host "data.json not found in the script's directory."
    }

}

function admin_update {
    Start-Process -FilePath "$PSScriptRoot\admin-update.bat" -Wait
}

function maintenance {
    Write-Host "$poi_s Maintenance $poi_e"
    get_packages
    tweaks
    Write-Host "[!] Please accept the User Account Control Prompt"
    Start-Process -FilePath "OOSU10.exe" -ArgumentList "ooshutup10.cfg" -Wait
    ctt
    success
}

function setup {
    Write-Host "$poi_s Automatic Setup $poi_e"
    ML
    update
    maintenance
    Start-Sleep -Seconds 3
    RWE
    success
}

function autostart {
    Write-Host "$poi_s Autostart $poi_e"
    Start-Process -FilePath "$PSScriptRoot\autostart.bat" -Wait
    success
}

function ctt {
    Write-Host "$poi_s CTT $poi_e"
    Invoke-RestMethod https://christitus.com/win | Invoke-Expression
}


function sensor {
    Write-Host "$poi_s Sensor $poi_e"
    Start-Process -FilePath "$PSScriptRoot\sensor.bat"
    success
}


function shutdown {
    Write-Host "$poi_s Termination process is starting $poi_e"

    $jsonPath = Join-Path $PSScriptRoot "data.json"

    if (Test-Path $jsonPath) {
        $data = Get-Content $jsonPath | ConvertFrom-Json
        foreach ($process in $data.processes) {
            if ($process -eq "") {
                Write-Host "? no process data ?"
            }
            else {
                Stop-Process -Name $process -Force -ErrorAction SilentlyContinue
            }
        }
    }
    else {
        Write-Host "data.json not found in the script's directory."
    }

    RWE
    dismount
    Write-Host $sep

    $userInput = Read-Host "Shutdown? (y/n): "
    if ($userInput -eq "y") {
        Write-Host "Shutting down..."
        Stop-Computer -Force
    }
    
    exit
    success
}

function dismount {
    Write-Host "Attempting to dismount...`n[!] Please accept any confirmation dialogues`n"
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.SendKeys]::SendWait("^(+D)")
}


while ($true) {
    Write-Host "$poi_s functions $poi_e`n"
    Write-Host "x      = exit              (Exits the script)"
    Write-Host "test   = Test              (Test Function)"
    Write-Host "re     = RWS               (Restart Windows Explorer)"
    Write-Host "ml     = Make Links        (Make Symbolic Links)"
    Write-Host "upd    = Update            (Updates all applications via winget)"
    Write-Host "mat    = Maintenance       (Recommended to perform regularly)"
    Write-Host "set    = Automatic Setup   (Run once per install)"
    Write-Host "aut    = Autostart         (Runs autostart file)"
    Write-Host "shu    = Shutdown          (Closes all processes and shuts down the system)"
    Write-Host "ctt    = CTT               (Runs the CTT script)"
    Write-Host "god    = God Mode          (Windows God Mode)"
    Write-Host "sen    = Dispatch Sensor   (Motion Sensor)"
    Write-Host "twe    = System Tweaks     (System Tweaks)"
    Write-Host "pac    = Get Packages      (via winget or choco)"
    Write-Host "yt     = YouTube Download  (video | playlist | playlist-audio | playlist-silent | playlist-thumbnail | channel-playlist-silent)"

    $choice = Read-Host "`n$poi_s What would you like to do?"
    $words = $choice.Trim().Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
    $remainingWords = $words[1..($words.Length - 1)]

    switch ($words[0]) {
        "re" { RWE }
        "ml" { ML }
        "test" { test }
        "upd" { update }
        "mat" { maintenance }
        "set" { setup }
        "aut" { autostart }
        "shu" { shutdown }
        "ctt" { ctt }
        "god" { god }
        "sen" { sensor }
        "twe" { tweaks }
        "pac" { get_packages }
        "dis" { dismount }
        "yt" {
            if ($remainingWords.Count -ge 2) {
                $type = $remainingWords[0]
                $video = $remainingWords[1]
                youtube $type $video
            }
            else {
                Write-Host "Insufficient parameters for 'yt' option"
            }
        }
        "x" { Write-Host "Exiting script." ; exit }
        default { Write-Host "Invalid choice" }
    }
}