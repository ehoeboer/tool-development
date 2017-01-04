# Version Control #

The Version Control project is a tool that can be run from the Uniface IDE's additional menu. 
It synchronises your repository database with the file system so that your source code can be versioned with your preferred version control tools (such as git).
It exports changes since the last sync to your export source code folder, and imports and files with a newer timestamp, and uses a VC_STATUS table to record last import and export times.
https://github.com/uniface/Development-Tooling/tree/master/uniface-version-control

## Dependencies ##
Version Control has been written and tested with:

 * Uniface 9.6.07
 * SQLite
 * Meta Tools (0.1-9.6)  - https://github.com/uniface/Development-Tooling/tree/master/uniface-meta-tools

## Setup ##

 * Download the latest zip from the downloads page
 * Unzip the download into your local Uniface packages directory. This is where you'll keep all your Uniface tooling. These instructions assume this folder is C:\\UnifacePackages\\
 * You should now have a folder called VersionControl in C:\\UnifacePackages\\, inside this folder is a number of UAR files and other folders. After configuration, it can be used in your projects

## Configure your projects to use Version Control ##

 * Configure the .asn for your repository to include the packaged resources, e.g.
	[RESOURCES]
	.\\resources
	C:\\UnifacePackages\\VersionControl\\VersionControl.uar
	C:\\UnifacePackages\\VersionControl\\MetaTools.uar
	
 * Configure logicals to tell the tool where source is stored and how to behave.  Note that the contents of this md file contains double backslashes instead of single backslashes for markup reasons - you can copy these out of the idf.asn provided in the tool development environment & modify if you prefer.
	[LOGICALS]
	;The file to export source files to (in this case a relative path from the working folder)
	SOURCE_DIR              src
	;Run sync automatically when opening tool
	AUTO_SYNC               1
	;Include signatures in the component export files
	INCLUDE_COMPONENT_SIGS  0
	;When enabled a number of performance optimisations are disabled
	FULL_SYNC_DEFAULT       0
	;Include library definition in library object exports
	INCLUDE_LIB             0
	;Enable exporting of signatures that only have a Uniface implementation
	EXPORT_UF_SIG           0

	;Source Export Paths
	FORM_PATH            components\\frm\\<object>.cmx
	USP_PATH             components\\usp\\<object>.cmx
	DSP_PATH             components\\dsp\\<object>.cmx
	REPORT_PATH          components\\rpt\\<object>.cmx
	SVC_PATH             components\\svc\\<object>.cmx
	SESSION_SVC_PATH     components\\ssv\\<object>.cmx
	ENT_SVC_PATH         components\\esv\\<object>.cmx

	MODEL_PATH           models\\<object>.amx
	SIGNATURE_PATH       signatures\\<object>.sgx
	STARTUP_SHELL_PATH   startupshells\\<object>.shx

	CONSTANT_PATH        library\\constants\\<lib>.cnx
	DEVICE_PATH          library\\device table\\<lib>\\<object>.ktx
	FORMAT_PATH          library\\format\\<lib>\\<object>.fmx
	GLOBAL_PROC_PATH     library\\proc\\<lib>\\<object>.prx
	GLYPH_PATH           library\\glyph\\<lib>\\<lang>\\<object>.glx
	INCLUDE_PATH         library\\include\\<lib>\\<object>.ipx
	LIBRARY_DEF_PATH     library\\<object>.lbx
	MENU_PATH            library\\menu\\<lib>\\<lang>\\<object>.mnx
	MESSAGE_PATH         library\\message\\<lib>\\<lang>\\<object>.msx
	PANEL_PATH           library\\panel\\<lib>\\<object>.pnx
	TRANSLATION_PATH     library\\translation table\\<lib>\\<object>.dtx
	VARIABLES_PATH       library\\variables\\<lib>\\<object>.vrx

	ENT_INTERFACE_PATH   templates\\entity\\interface\\<object>.eix
	FIELD_TEMPLATE_PATH  templates\\field\\template\\<object>.ftx
	FLD_INTERFACE_PATH   templates\\field\\interface\\<object>.fix
	FLD_LAYOUT_PATH      templates\\field\\layout\\<object>.flx
	FLD_SYNTAX_PATH      templates\\field\\syntax\\<object>.fsx
 * Configure a folder to contain the exported source code as per the SRC_DIR logical, with suitable write permissions
	e.g. src
 * Run the appropriate SQL script on your database to create the VC_STATUS table, which is used to track import and export times for each component.
 * Import the additional menu (if you don't already have one), and filesync menu from the supplied "imports" in the zip. 
 * Recompile the menu (e.g. /men)
 * Restart the IDE
 * Use the Additional Menu to go to "Project", and if auto-sync is configured, it will export all code into individual export files under your "src" folder.
	
## Usage ##

## Contributing to the project ##


## Contributors ##

* James Rodger
* David Akerman
