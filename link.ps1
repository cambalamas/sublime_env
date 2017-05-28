### Sublime settings.

#### 1. Clone my sublime_env repo.
	git clone https://github.com/cambalamas/sublime_env

#### 2. Paths from the repo.
	$g_sublU = ".\sublime_env\Packages\User"
	$g_sublD = ".\sublime_env\Packages\Default"

#### 3. Paths on your machine (verify before...)
	$h_sublU = "$env:userprofile\AppData\Roaming\Sublime Text 3\Packages\User"
	$h_sublD = "$env:userprofile\AppData\Roaming\Sublime Text 3\Packages\Default"

#### 4. Check to remove before link the config files.
	foreach ( $file in (ls $g_sublU).name ) {
	    if ( Test-Path "$h_sublU\$file" ) { Remove-Item -r $h_sublU\$file }
	    New-Item -Path $h_sublU\$file -ItemType SymbolicLink -Value $g_sublU\$file
	}
	
	foreach ( $file in (ls $g_sublD).name ) {
	    if ( Test-Path "$h_sublD\$file" ) { Remove-Item -r $h_sublD\$file }
	    New-Item -Path $h_sublD\$file -ItemType SymbolicLink -Value $g_sublD\$file
	}
