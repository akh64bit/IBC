@echo off
setlocal enableextensions enabledelayedexpansion


::=============================================================================+
::                                                                             +
::   Starts Interactive Brokers' Trader Workstation (TWS).                     +
::                                                                             +
::   If you run it without any arguments it will display a new window showing  +
::   useful information and then start TWS. If you supply /INLINE as the first +
::   argument, the information will be displayed in the current command prompt +
::   window. (If you are using Task Scheduler to run this, you MUST supply the +
::   /INLINE argument to ensure correct operation.)                            +
::                                                                             +
::   The following lines, beginning with 'set', are the only ones you may      +
::   need to change, and you probably only need to change the first one.       +
::                                                                             +
::   The notes below give further information on why you might need to         +
::   change them.                                                              +
::                                                                             +
::=============================================================================+


set TWS_MAJOR_VRSN=963
set CONFIG=%HOMEDRIVE%%HOMEPATH%\Documents\IBC\config.ini
set TRADING_MODE=
set IBC_PATH=%SYSTEMDRIVE%\IBC
set TWS_PATH=%SYSTEMDRIVE%\Jts
set LOG_PATH=%IBC_PATH%\Logs
set TWSUSERID=
set TWSPASSWORD=
set JAVA_PATH=
set HIDE=


::              PLEASE DON'T CHANGE ANYTHING BELOW THIS LINE !!
::==============================================================================

::   Notes:
::

::   TWS_MAJOR_VRSN
::
::     Specifies the major version number of TWS to be run. If you are 
::     unsure of which version number to use, run TWS manually from the 
::     icon on the desktop, then click Help > About Trader Workstation. In the 
::     displayed information you'll see a line similar to this:
::
::       Build 954.2a, Oct 30, 2015 4:07:54 PM
::
::     Here the major version number is 954. Do not include the rest of the 
::     version number in this setting.


::   CONFIG
::
::     This is the location and filename of the IBC configuration file.
::     This file should be in a folder in your personal filestore, so that
::     other users of your computer can't access it. This folder and its 
::     contents should also be encrypted so that even users with administrator 
::     privileges can't see the contents. Note that you can use the HOMEDRIVE and
::     HOMEPATH environment variables to address the root of your personal 
::     filestore (they are set automatically by Windows).


::   TRADING_MODE
::
::     TWS 955 introduced a new Trading Mode combo box on its login dialog. 
::     This indicates whether the live account or the paper trading account 
::     corresponding to the supplied credentials is to be used. The values 
::     allowed here are 'live' and 'paper' (not case-sensitive). For earlier 
::     versions of TWS, setting this has no effect. If no value is specified 
::     here, the value is taken from the TradingMode setting in the 
::     configuration file. If no value is specified there either, the value 
::     'live' is assumed.


::   IBC_PATH
::
::     The folder containing the IBC files. 


::   TWS_PATH
::
::     The folder where TWS is installed. The TWS installer always installs to 
::     C:\Jts. Note that even if you have installed from a Gateway download
::     rather than a TWS download, you should still use this default setting.
::     It is possible to move the TWS installation to a different folder, but
::     there are virtually no good reasons for doing so.


::   LOG_PATH
::
::     Specifies the folder where diagnostic information is to be logged while 
::     this command file is running. This information is very valuable when 
::     troubleshooting problems, so it is advisable to always have this set to
::     a valid location, especially when setting up IBC. You must
::     have write access to the specified folder.
::
::     Once everything runs properly, you can prevent further logging by 
::     removing the value as show below (but this is not recommended): 
::
::     set LOG_PATH=


::   TWSUSERID
::   TWSPASSWORD
::
::     If your TWS user id and password are not included in your IBC 
::     configuration file, you can set them here. However you are strongly 
::     advised not to set them here because this file is not normally in a 
::     protected location.


::   JAVA_PATH
::
::     IB's installer for TWS/Gateway includes a hidden version of Java which 
::     IB have used to develop and test that particular version. This means that
::     it is not necessary to separately install Java. If there is a separate
::     Java installation, that does not matter: it won't be used by IBC 
::     or TWS/Gateway unless you set the path to it here. You should not do this 
::     without a very good reason.


::   HIDE
::
::     If set to YES or TRUE, the diagnostic window that contains information 
::     about the running TWS, and where to find the log file, will be minimized 
::     to the taskbar. If not set, or set to any other value, the window will be 
::     displayed. Values are not case-sensitive so for example yEs and yes will 
::     be interpeted as YES. (Note that when the /INLINE argument is supplied,
::     this setting has no effect.)


::   End of Notes:
::==============================================================================

set APP=TWS
set TITLE=IBC (%APP% %TWS_MAJOR_VRSN%)
if /I "%HIDE%" == "YES" (
    set MIN=/Min
) else if /I "%HIDE%" == "TRUE" (
    set MIN=/Min
) else (
    set MIN=
)

if /I "%~1" == "/INLINE" (
	"%IBC_PATH%\Scripts\DisplayBannerAndLaunch.bat"
) else (
	start "%TITLE%" %MIN% "%IBC_PATH%\Scripts\DisplayBannerAndLaunch.bat"
)
