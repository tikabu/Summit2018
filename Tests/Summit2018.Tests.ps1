$ModuleManifestName = 'Summit2018.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\Summit2018\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}

