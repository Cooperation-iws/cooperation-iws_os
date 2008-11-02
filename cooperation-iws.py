#!/usr/bin/env python
#
# Cooperation-iws -- http://cooperation-iws.gensys-net.eu
#    Copyright (c) 2008  Cooperation-iws Team <oliv@gensys-net.eu>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

import sys
import os
import time
import shutil
import optparse
import locale
import gettext
import re
import commands
import urllib
sys.path.append(os.getcwd() + '/lib/')
# import Reconstructor modules
from Reconstructor.PackageHelper import PackageHelper

try:
     import pygtk
     pygtk.require("2.0")
except Exception, detail:
    print detail
    pass
try:
    import gtk
    import gtk.glade
    import gobject
    import pango
except Exception, detail:
    print detail
    sys.exit(1)


class Reconstructor:

    """Reconstructor - Creates custom ubuntu cds..."""
    def __init__(self):
        # vars
        self.gladefile = os.getcwd() + '/glade/gui.glade'
        self.iconFile = os.getcwd() + '/glade/app.png'
        self.logoFile = os.getcwd() + '/glade/ciws_logo.png'
        self.terminalIconFile = os.getcwd() + '/glade/terminal.png'
        self.firefoxIconFile = os.getcwd() + '/glade/firefox.png'
        self.postInstallIconFile = os.getcwd() + '/glade/clicknrun.png'
        self.updateIconFile = os.getcwd() + '/glade/update.png'


	self.hosting = "http://cooperation.gensys.free.fr/v0.3"
	self.mirrorFree = "http://cooperation.gensys.free.fr/mirroir/v0.5"
	self.mirrorBerlios1 = "http://download.berlios.de/ciws"
	self.mirrorBerlios2 = "http://download2.berlios.de/ciws"
	self.appName = "Cooperation-iws"
        self.codeName = " \"\" "
        self.devInProgress = False
        self.updateId = "325"
        self.donateUrl = "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=ejhazlett%40gmail%2ecom&item_name=Reconstructor%20Donation&item_number=R_DONATE_001&no_shipping=2&no_note=1&tax=0&currency_code=USD&lc=US&bn=PP%2dDonationsBF&charset=UTF%2d8"
        #self.devRevision = time.strftime("%y%m%d", time.gmtime())
        self.devRevision = "080928"
        self.appVersion = "0.5.2"
        self.cdUbuntuVersion = ''
        self.altCdUbuntuVersion = ''
        self.altCdUbuntuArch = ''
        self.altCdUbuntuDist = ''
        self.ubuntuCodename = ''
        self.dapperVersion = '6.06'
        self.edgyVersion = '6.10'
        self.feistyVersion = '7.04'
        self.gutsyVersion = '7.10'
        self.hardyVersion = '8.04'
        self.moduleDir = os.getcwd() + '/modules/'
	self.scriptDir = os.getcwd() + '/scripts/'
	self.ciwsRootDir = os.getcwd()
        self.mountDir = '/media/cdrom'
        self.tmpDir = "tmp"
        self.altRemasterDir = "remaster_alt"
        self.altInitrdRoot = "initrd_alt"
        self.altRemasterRepo = "remaster_alt_repo"
        self.tmpPackageDir = "tmp_packages"
        # Alternate GPG Key vars
        self.altGpgKeyName = "Alternate Installation Automatic Signing Key"
        self.altGpgKeyComment = "Reconstructor Automatic Signing Key"
        #self.altGpgKeyEmail = "reconstructor@aperantis.com"
        #self.altGpgKeyPhrase = "titan"
        #self.altGpgKey = self.altGpgKeyName + " (" + self.altGpgKeyComment + ") <" + self.altGpgKeyEmail + ">"
        # type of disc (live/alt)
        self.discType = ""
        self.altBaseTypeStandard = 0
        self.altBaseTypeServer = 1
        self.altBaseTypeDesktop = 2
        self.customDir = ""
        self.createRemasterDir = False
        self.createCustomRoot = False
        self.createInitrdRoot = False
        self.createAltRemasterDir = False
        self.createAltInitrdRoot = False
        self.isoFilename = ""
        self.buildLiveCdFilename = ''
        self.setupComplete = False
        self.manualInstall = False
        self.watch = gtk.gdk.Cursor(gtk.gdk.WATCH)
        self.working = None
        self.workingDlg = None
        self.runningDebug = False
        self.interactiveEdit = False
        self.pageWelcome = 0
	self.pageInstallType = 1        
	self.pageLiveSetup = 2
        self.pageDebianLiveSetup = 5
        self.pageLiveCustomize = 3
        #self.pageLiveCustomizeGnome = 1
        self.pageLiveCustomizeOptimization = 1
        self.pageLiveBuild = 4
        self.pageUsbSetup = 9
        self.pageAltCustomize = 6
        self.pageAltBuild = 7
        self.pageFinish = 8
        self.gdmBackgroundColor = None
        self.enableExperimental = False
        self.gnomeBinPath = '/usr/bin/gnome-session'
        self.f = sys.stdout
        self.webUrl = "http://cooperation-iws.gensys-net.eu"
        self.updateInfo = "http://cooperation-iws.gensys-net.eu/update/info"
        self.updateFile = "http://cooperation-iws.gensys-net.eu/update/update.tar.gz"
        self.treeModel = None
        self.treeView = None

        self.modEngineKey = 'RMOD_ENGINE'
        self.modCategoryKey = 'RMOD_CATEGORY'
        self.modSubCategoryKey = 'RMOD_SUBCATEGORY'
        self.modNameKey = 'RMOD_NAME'
        self.modAuthorKey = 'RMOD_AUTHOR'
        self.modDescriptionKey = 'RMOD_DESCRIPTION'
        self.modVersionKey = 'RMOD_VERSION'
        self.modRunInChrootKey = 'RMOD_RUN_IN_CHROOT'
        self.modUpdateUrlKey = 'RMOD_UPDATE_URL'
        self.modReqApache='RMOD_REQ_APACHE'
	self.modReqXnest='RMOD_REQ_XNEST'
	self.modules =  {}

        self.regexUbuntuVersion = '^DISTRIB_RELEASE=([0-9.]+)\n'
        self.regexModEngine = '^RMOD_ENGINE=([A-Za-z0-9.\s\w]+)\n'
        self.regexModCategory = '^RMOD_CATEGORY=([A-Za-z0-9\'\"\w]+)\s'
        self.regexModSubCategory = '^RMOD_SUBCATEGORY=([A-Za-z0-9\'\"\w]+)\s'
        self.regexModName = '^RMOD_NAME=([A-Za-z0-9.\-\&\,\*\/\(\)\'\"\s\w]+)\n'
        self.regexModAuthor = '^RMOD_AUTHOR=([A-Za-z0-9.\(\)\'\":\s\w]+)\n'
        self.regexModDescription = '^RMOD_DESCRIPTION=([A-Za-z0-9.\-\&\*\_\,\/\\(\)\'\"\s\w]+)\n'
        self.regexModVersion = '^RMOD_VERSION=([A-Za-z0-9.\s\w]+)\s'
        self.regexModRunInChroot = '^RMOD_RUN_IN_CHROOT=([A-Za-z0-9\w]+)\s'
	self.regexModReqApache = '^RMOD_REQ_APACHE=([A-Za-z0-9\w]+)\s'        
	self.regexModReqXnest = '^RMOD_REQ_XNEST=([A-Za-z0-9\w]+)\s'        
	self.regexModUpdateUrl = '^RMOD_UPDATE_URL=([A-Za-z0-9:.\-\&\*\_\,\/\\(\)\'\"\s\w]+)\n'
        self.regexUbuntuAltCdVersion = '^[a-zA-Z0-9-.]*\s+([0-9.]+)\s+'
        self.regexUbuntuAltCdInfo = '([\w-]+)\s+(\d+.\d+)\s+\D+Release\s(\w+)\s+'
        self.regexUbuntuAltPackages = '^Package:\s+(\S*)\n'

        self.iterCategoryAdministration = None
        self.iterCategoryEducation = None
        self.iterCategorySoftware = None
        self.iterCategoryServer = None
        self.iterCategoryClient = None
        self.iterCategoryOs = None
        self.iterCategoryMultimedia = None
        self.iterCategoryPlugins = None
        self.iterCategoryProductivity = None
        self.iterCategoryNetworking = None
        self.iterCategoryVirtualization = None
        self.iterCategoryMisc = None
        self.moduleColumnCategory = 0
        self.moduleColumnExecute = 1
        self.moduleColumnName = 3
        self.moduleColumnVersion = 4
        self.moduleColumnAuthor = 5
        self.moduleColumnDescription = 6
        self.moduleColumnRunInChroot = 7
        self.moduleColumnUpdateUrl = 8
        self.moduleColumnPath = 9
        self.moduleColumnReqApache = 10
        self.execModulesEnabled = False
        self.bootModulesEnabled = False
        # time command for timing operations
        self.timeCmd = commands.getoutput('which time') + ' -f \"\nBuild Time: %E  CPU: %P\n\"'
	self.reqXnest = False
        # startup daemon list for speedup
        #self.startupDaemons = ('ppp', 'hplip', 'cupsys', 'festival', 'laptop-mode', 'nvidia-kernel', 'rsync', 'bluez-utils', 'mdadm')
        # shutdown scripts - without the 'K' for looping -- see  https://wiki.ubuntu.com/Teardown  for explanation
        self.shutdownScripts = ('11anacron', '11atd', '19cupsys', '20acpi-support', '20apmd', '20bittorrent', '20dbus', '20festival', '20hotkey-setup', '20makedev', '20nvidia-kernel', '20powernowd', '20rsync', '20ssh', '21acpid', '21hplip', '74bluez-utils', '88pcmcia', '88pcmciautils', '89klogd', '90syslogd')
	self.ReqApache = "B"

        APPDOMAIN='reconstructor'
        LANGDIR='lang'
        # locale
        locale.setlocale(locale.LC_ALL, '')
        gettext.bindtextdomain(APPDOMAIN, LANGDIR)
        gtk.glade.bindtextdomain(APPDOMAIN, LANGDIR)
        gtk.glade.textdomain(APPDOMAIN)
        gettext.textdomain(APPDOMAIN)
        gettext.install(APPDOMAIN, LANGDIR, unicode=1)

        # setup glade widget tree
        self.wTree = gtk.glade.XML(self.gladefile, domain='reconstructor')


        # check for user
        if os.getuid() != 0 :
            self.wTree.get_widget("windowMain").hide()

        # create signal dictionary and connect
        dic = { "on_buttonNext_clicked" : self.on_buttonNext_clicked,
            "on_buttonBack_clicked" : self.on_buttonBack_clicked,
            "on_buttonBrowseWorkingDir_clicked" : self.on_buttonBrowseWorkingDir_clicked,
            "on_buttonBrowseWorkingDir_clicked2" : self.on_buttonBrowseWorkingDir_clicked2,
            "on_buttonBrowseIsoFilename_clicked" : self.on_buttonBrowseIsoFilename_clicked,
            "on_buttonBrowseIsoFilename_clicked2" : self.on_buttonBrowseIsoFilename_clicked2,
            "on_checkbuttonBuildIso_toggled" : self.on_checkbuttonBuildIso_toggled,
	    "on_buttonBrowseLiveCdFilename_clicked" : self.on_buttonBrowseLiveCdFilename_clicked,
            "on_buttonSoftwareCalculateIsoSize_clicked" : self.on_buttonSoftwareCalculateIsoSize_clicked,
            "on_buttonSoftwareDetectUsb_clicked" : self.on_buttonSoftwareDetectUsb_clicked,
            "on_buttonSoftwareDetectUsb_clicked2" : self.on_buttonSoftwareDetectUsb_clicked2,
            "on_buttonSoftwareApply_clicked" : self.on_buttonSoftwareApply_clicked,
            "on_buttonInteractiveEditLaunch_clicked" : self.on_buttonInteractiveEditLaunch_clicked,
            "on_buttonInteractiveClear_clicked" : self.on_buttonInteractiveClear_clicked,
            "on_buttonCustomizeLaunchTerminal_clicked" : self.on_buttonCustomizeLaunchTerminal_clicked,
            "on_buttonCustomizeLaunchFirefox_clicked" : self.on_buttonCustomizeLaunchFirefox_clicked,
            "on_buttonCustomizeLaunchPostInstall_clicked" : self.on_buttonCustomizeLaunchPostInstall_clicked,
            "on_buttonBurnIso_clicked" : self.on_buttonBurnIso_clicked,
            "on_buttonModulesAddModule_clicked" : self.on_buttonModulesAddModule_clicked,
            "on_buttonBrowseDebianLiveDir_clicked" : self.on_buttonBrowseDebianLiveDir_clicked,
            "on_windowMain_delete_event" : gtk.main_quit,
            "on_windowMain_destroy" : self.exitApp }
        self.wTree.signal_autoconnect(dic)



	# print copyright
        print " "
        print self.appName + " -- (c) Cooperation-iws Team, 2008"
        print "       Version: " + self.appVersion
        print "        http://cooperation-iws.gensys-net.eu"
        print " "
	
        # add command option parser
        parser = optparse.OptionParser()
        parser.add_option("-d", "--debug",
                    action="store_true", dest="debug", default=False,
                    help="run as debug")
        parser.add_option("-v", "--version",
                    action="store_true", dest="version", default=False,
                    help="show version and exit")
        parser.add_option("-e", "--experimental",
                    action="store_true", dest="experimental", default=False,
                    help="enable experimental features")
        parser.add_option("-u", "--update",
                    action="store_true", dest="update", default=False,
                    help="automatically update to latest version")
	parser.add_option("-c", "--commandline",
                    action="store_true", dest="commandline", default=False,
                    help="command line option")
	parser.add_option("-l", "--listmodules",
                    action="store_true", dest="listmodules", default=False,
                    help="list all modules")
	parser.add_option( "--directory",
                    dest="directory", default="" ,
                    help="Install directory")
	parser.add_option( "--createdirectories", action="store_true",
                    dest="createdirectories", default=False ,
                    help="Create install directory")
	parser.add_option( "--isofile", 
                    dest="isofile", default="" ,
                    help="Initial Cd image")
	parser.add_option( "--modulesfile", 
                    dest="modulesfile", default="" ,
                    help="Modules list file")
	parser.add_option( "--artwork", 
                    dest="artwork", default="" ,
                    help="Kind of Artwork")
	parser.add_option( "--cms", 
                    dest="cms", default="Wordpress" ,
                    help="Kind of CMS")
	parser.add_option( "--aufs", action="store_true",
                    dest="aufs", default=False ,
                    help="Use aufs")
	parser.add_option( "--webappmirror", 
                    dest="webappmirror", default="http://download.berlios.de/ciws" ,
                    help="Web applictions mirror url")
	parser.add_option( "--debmirror", 
                    dest="debmirror", default="ftp://ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/" ,
                    help="Debian packages mirror url")
	parser.add_option( "--custom", action="store_false",
                    dest="custom", default=False ,
                    help="Custom install")
	parser.add_option( "--username", 
                    dest="username", default="" ,
                    help="User Name")
	parser.add_option( "--userfullname", 
                    dest="userfullname", default="" ,
                    help="User Full Name")
	parser.add_option( "--password", 
                    dest="password", default="" ,
                    help="User Admin Password")
	parser.add_option( "--host", 
                    dest="host", default="ciws-host" ,
                    help="Host Name")
	parser.add_option( "--keyblang", 
                    dest="keyblang", default="" ,
                    help="Keyboard Language")
	parser.add_option( "--ostype", 
                    dest="ostype", default="Server" ,
                    help="Os Type (Server or Client)")
	parser.add_option( "--disautologin", action="store_true",
                    dest="disautologin", default=False ,
                    help="Use aufs")
	
        (options, args) = parser.parse_args()

        if options.debug == True:
            self.runningDebug = True
            self.wTree.get_widget("notebookWizard").set_show_tabs(True)
            print _('INFO: Running Debug...')
        else:
            # hide tabs
            self.wTree.get_widget("notebookWizard").set_show_tabs(False)
        if options.version == True:
            print " "
            print self.appName + " -- (c) Reconstructor Team, 2006-2008"
            print "       Version: " + self.appVersion + " rev. " + self.updateId
            print "        http://reconstructor.aperantis.com"
            print " "
            #gtk.main_quit()
            sys.exit(0)
        if options.experimental == True:
            print _('INFO: Enabling Experimental Features...')
            self.enableExperimental = True
        if options.update == True:
            print _('INFO: Updating...')
            self.update()
	if options.commandline == True:
            print _('INFO: Text only version...')
            self.commandLine = True
	    
	    if options.listmodules == True:
		self.listModules()
		exit(0)
	    self.customDir = options.directory
	    if options.createdirectories == True:
		self.createRemasterDir = True
           	self.createCustomRoot = True
	    self.isoFilename = options.isofile     
	    if options.modulesfile == "":
		print _("You need to specify a Modules list file")
		exit(0)
	    self.moduleFilename = options.modulesfile  
	    self.comboboxCiwsArtwork = options.artwork       
  	    self.comboboxCiwsCms = options.cms
	    self.checkbuttonAufs = options.aufs
	    self.checkbuttonLocalMirror = True
	    self.entryLocalMirror = options.webappmirror
	    self.comboboxWebAppMirrors = ""
	    self.radiobuttonDefaultInstall = True
	    self.user = options.username
	    self.password = options.password
	    self.userFull = options.userfullname
	    self.host = options.host
	    self.checkbuttonDisableAutologin = options.disautologin
	    self.debMirror = options.debmirror
            self.keyLang = options.keyblang
	    self.ciwsOsType = options.ostype
	else:
	    self.commandLine = False



	if os.path.exists(self.mountDir) == False:
		    print _('INFO: Creating mount directory...')
		    os.makedirs(self.mountDir)

        self.commandLineGui()


	if self.commandLine == False: 
		# set icons & logo
		self.wTree.get_widget("windowMain").set_icon_from_file(self.iconFile)
		self.wTree.get_widget("imageLogo").set_from_file(self.logoFile)
		self.wTree.get_widget("imageLogo2").set_from_file(self.logoFile)
		self.wTree.get_widget("imageLogo3").set_from_file(self.logoFile)
		imgTerminal = gtk.Image()
		imgTerminal.set_from_file(self.terminalIconFile)
		self.wTree.get_widget("buttonCustomizeLaunchTerminal").set_image(imgTerminal)
		imgFirefox = gtk.Image()
		imgFirefox.set_from_file(self.firefoxIconFile)
		self.wTree.get_widget("buttonCustomizeLaunchFirefox").set_image(imgFirefox)
		imgPostInstall = gtk.Image()
		imgPostInstall.set_from_file(self.postInstallIconFile)
		self.wTree.get_widget("buttonCustomizeLaunchPostInstall").set_image(imgPostInstall)
		       
		imgUpdate = gtk.Image()
		imgUpdate.set_from_file(self.updateIconFile)
		#self.wTree.get_widget("buttonCheckUpdates").set_image(imgUpdate)
		imgModUpdate = gtk.Image()
		imgModUpdate.set_from_file(self.updateIconFile)
		#self.wTree.get_widget("buttonModulesUpdateModule").set_image(imgModUpdate)

		# check for existing mount dir
		

		# set app title
		if self.devInProgress:
		    self.wTree.get_widget("windowMain").set_title(self.appName + self.codeName + "  Build " + self.devRevision)
		else:
		    self.wTree.get_widget("windowMain").set_title(self.appName)

		# check dependencies
		self.checkDependencies()

		# set version
		self.wTree.get_widget("labelVersion").set_text('version ' + self.appVersion)

		# hide back button initially
		self.wTree.get_widget("buttonBack").hide()
		# set default working directory path
		self.wTree.get_widget("entryWorkingDir").set_text(os.path.join(os.environ['HOME'], "reconstructor"))
		self.wTree.get_widget("entryWorkingDir2").set_text(os.path.join(os.environ['HOME'], "reconstructor"))
		self.wTree.get_widget("entryDebianLiveWorkingDir").set_text(os.path.join(os.environ['HOME'], "reconstructor"))
		# set default iso filenames
		
		self.wTree.get_widget("entryAltBuildIsoFilename").set_text(os.path.join(os.environ['HOME'], "ubuntu-custom-alt.iso"))
		# set default descriptions
		cdDesc = _('Ubuntu Custom')
		self.wTree.get_widget("entryLiveCdDescription").set_text(cdDesc)
		self.wTree.get_widget("entryBuildAltCdDescription").set_text(cdDesc)
		# set default cd architectures
		self.wTree.get_widget("comboboxLiveCdArch").set_active(0)
		self.wTree.get_widget("comboboxAltBuildArch").set_active(0)
		   # set default Debian Live architecture
		self.wTree.get_widget("comboboxDebianLiveType").set_active(3)
		self.wTree.get_widget("comboboxDebianLiveReleaseType").set_active(1)
		self.wTree.get_widget("comboboxDebianLiveMirrors").set_active(0)
		self.wTree.get_widget("comboboxUbuntuMirrors").set_active(0)
		self.wTree.get_widget("comboboxDebianLiveMirrors1").set_active(0)
		self.wTree.get_widget("comboboxLiveCDKeybLang").set_active(0)
		self.wTree.get_widget("comboboxLiveCDKeybLang1").set_active(0)
		self.wTree.get_widget("comboboxWebAppMirrors").set_active(1)
		self.wTree.get_widget("comboboxCiwsOs").set_active(0)
		self.wTree.get_widget("comboboxCiwsArtwork").set_active(0)  
		self.wTree.get_widget("comboboxCiwsCms").set_active(1)  
	       
    
    def commandLineGui(self):
	self.checkDependencies()
	self.saveSetupInfo()
 	if self.checkCustomDir() == True:
                if self.checkSetup() == True:
                    if self.checkWorkingDir() == True:
           		self.setupWorkingDirectory()
		self.checkLiveCdVersion()
		self.cmdLoadModules()
		os.popen("cp "+self.moduleFilename + " " + os.path.join(self.customDir, "chroot") + "/tmp/app_params")
		os.popen("chmod +x " + os.path.join(self.customDir, "chroot") + "/tmp/app_params")
		os.popen("echo \"A\" > "+ os.path.join(self.customDir, "chroot") + "/tmp/silent")
		self.setLiveCdInfo(username=self.user, userFullname=self.userFull, userPassword=self.password, hostname=self.host)
		print _('Proceeding to customization...')		
		self.customize()
		self.launchPostInstall()
		self.launchTerminal()
		self.endInstall()
		self.installType = "Cd"
		self.LiveCdDescription="Cooperation-iws Live CD"
		self.LiveCdArch = "x86"
		self.buildIso=True		
		self.buildSquashRoot = True
		self.buildUsb = False
		self.buildLiveCdFilename = os.path.join(self.customDir, "cooperation-iws-custom.iso")
		self.LiveCdDescription = "cooperation-iws-custom"
		self.LiveCdRemovePrograms = True
		self.hfsMap = os.getcwd() + "/lib/hfs.map"
		
		self.build()
		
	
	exit(0)


    # Check for Application Dependencies
    def checkDependencies(self):
        print _('Checking dependencies...')
        dependList = ''
        wgetlist = ''
        if commands.getoutput('which mksquashfs') == '':
            print _('squashfs-tools NOT FOUND (needed for Root FS extraction)')
            dependList += 'squashfs-tools\n'
        if commands.getoutput('which chroot') == '':
            print _('chroot NOT FOUND (needed for Root FS customization)')
            dependList += 'chroot\n'
        if commands.getoutput('which mkisofs') == '':
            print _('mkisofs NOT FOUND (needed for ISO generation)')
            dependList += 'mkisofs\n'
        if commands.getoutput('which gcc') == '':
            print _('gcc NOT FOUND (needed for Usplash generation and VMWare/Qemu installation)')
            dependList += 'gcc\n'
        if commands.getoutput('which make') == '':
            print _('make NOT FOUND (needed for VMWare/Qemu installation)')
            dependList += 'make\n'
        if commands.getoutput('which rsync') == '':
            print _('rsync NOT FOUND (needed for Remastering ISO)')
            dependList += 'rsync\n'
	if commands.getoutput('which syslinux') == '':
            print _('syslinux NOT FOUND (needed for Remastering ISO)')
            dependList += 'syslinux\n'
	if commands.getoutput('which mtools') == '':
            print _('mtools NOT FOUND (needed for Remastering ISO)')
            dependList += 'mtools\n'
        # dapper usplash dependency
        if os.path.exists('/usr/include/bogl') == False:
            print _('libbogl-dev NOT FOUND (needed for Dapper Usplash Generation)')
            dependList += 'libbogl-dev\n'
        # edgy usplash dependency
        if commands.getoutput('which pngtousplash') == '':
            print _('libusplash-dev NOT FOUND (needed for Usplash Generation)')
            dependList += 'libusplash-dev\n'
        # gpg
        if commands.getoutput('which gpg') == '':
            print _('gpg NOT FOUND (needed for Alternate Key Signing)')
            dependList += 'gpg\n'
        # dpkg-buildpackage
        if commands.getoutput('which dpkg-buildpackage') == '':
            print _('dpkg-dev NOT FOUND (needed for Alternate Key Package Building)')
            dependList += 'dpkg-dev\n'
        # fakeroot
        if commands.getoutput('which fakeroot') == '':
            print _('fakeroot NOT FOUND (needed for Alternate Key Package Building)')
            dependList += 'fakeroot\n'
        # apt-ftparchive
        if commands.getoutput('which apt-ftparchive') == '':
            print _('apt-utils NOT FOUND (needed for Extra Repository Generation)')
            dependList += 'apt-utils\n'
	if commands.getoutput('which liveusb') == '':
            print _('liveusb NOT FOUND (needed for liveusb Generation)')
            wgetlist = 'liveusb\n'
        if dependList != '' or wgetlist != '':
            print _('\nThe following dependencies are not met: ')
            print dependList
            print _('Please install the dependencies.')
            if self.commandLine == False: 
		    # show warning dialog
		    
		    warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
		    warnDlg.set_icon_from_file(self.iconFile)
		    warnDlg.vbox.set_spacing(10)
		    labelSpc = gtk.Label(" ")
		    warnDlg.vbox.pack_start(labelSpc)
		    labelSpc.show()
		    lblText = _('  <b>Reconstructor may not work correctly.</b>\nThe following dependencies are not met: ')
		    lbl = gtk.Label(lblText)
		    lbl.set_use_markup(True)
		    if dependList != '' :           
			lblInfo = gtk.Label(dependList)
		    	lblFixText = _('Install the dependencies and restart reconstructor?')
		    if wgetlist != '':
			lblInfo = gtk.Label(wgetlist)
		    	lblFixText = _('You need to install livusb manually, some functionnality may not work, continue?')
		    lblFix = gtk.Label(lblFixText)
		    warnDlg.vbox.pack_start(lbl)
		    warnDlg.vbox.pack_start(lblInfo)
		    warnDlg.vbox.pack_start(lblFix)
		    lbl.show()
		    lblInfo.show()
		    lblFix.show()
		    #warnDlg.show()
		    response = warnDlg.run()
		    if response == gtk.RESPONSE_OK and dependList != '' :
		        warnDlg.destroy()
		        # use apt to install
		        #print 'apt-get install -y ' + dependList.replace('\n', ' ')
		        installTxt = _('Installing dependencies: ')
		        print installTxt + dependList.replace('\n', ' ')
		        os.popen('apt-get install -y ' + dependList.replace('\n', ' '))
			#sys.exit(0)
		    else:
		        warnDlg.destroy()
	    else:
		    installTxt = _('Installing dependencies: ')
		    print installTxt + dependList.replace('\n', ' ')
		    os.popen('apt-get install -y ' + dependList.replace('\n', ' '))
        else:
            print _('Ok.')


    # load live cd ubuntu version
    def loadCdVersion(self):
        if self.customDir != '':
            # reset version
            self.cdUbuntuVersion = 'unknown'
            # build regex
            r = re.compile(self.regexUbuntuVersion, re.IGNORECASE)
            f = file(os.path.join(self.customDir, "chroot/etc/lsb-release"), 'r')
            for l in f:
                if r.match(l) != None:
                    self.cdUbuntuVersion = r.match(l).group(1)
            f.close()

            print 'Ubuntu Version: ' + self.cdUbuntuVersion
            self.wTree.get_widget("labelCustomizeUbuntuLiveVersion").set_text(self.wTree.get_widget("labelCustomizeUbuntuLiveVersion").get_text() + " " + self.cdUbuntuVersion)
            
        return

    
    def showDownloadProgress(self, transferCount, blockSize, totalSize):
        #f.write('------------ Download Progress ------------')
        self.f.flush()
        if (transferCount * blockSize) < totalSize:
            self.f.write(str((transferCount * blockSize) / 1000) + 'KB of ' + str(totalSize / 1000) + 'KB\n')
        else:
            # HACK: report the same size to avoid confusion by rounding
            self.f.write(str(totalSize / 1000) + 'KB of ' + str(totalSize / 1000) + 'KB\n')
        #f.write('-------------------------------------------')




    # Finds all available desktop environments and enables/disables options as needed
    def loadAvailableDesktops(self):
        try:
            # find gnome
            if os.path.exists(os.path.join(self.customDir, "chroot" + self.gnomeBinPath)):
                print _('Found Gnome Desktop Environment...')
                self.wTree.get_widget("notebookCustomize").get_nth_page(self.pageLiveCustomizeGnome).show()
                # get current gdm background color
                self.loadGdmBackgroundColor()
                # load comboboxes for customization
                self.loadGdmThemes()
                self.loadGnomeThemes()
            else:
                # gnome not found
                self.wTree.get_widget("notebookCustomize").get_nth_page(self.pageLiveCustomizeGnome).hide()
        except Exception, detail:
            print detail

    # Handle Module Properties
    def getModuleProperties(self, moduleName):
	if self.commandLine == False:         
		print _('Loading module properties...')

        fMod = file(os.path.join(self.moduleDir, moduleName), 'r')

        properties = {}

        # search for mod properties
        modCategory = ''
        modSubCategory = ''
        modName = ''
        modVersion = ''
        modAuthor = ''
        modDescription = ''
        modRunInChroot = None
	modReqApache = None      
	modReqXnest = None      
	modUpdateUrl = ''

      # HACK: regex through module to get info
        reModCategory = re.compile(self.regexModCategory, re.IGNORECASE)
        reModSubCategory = re.compile(self.regexModSubCategory, re.IGNORECASE)
        reModName = re.compile(self.regexModName, re.IGNORECASE)
        reModVersion = re.compile(self.regexModVersion, re.IGNORECASE)
        reModAuthor = re.compile(self.regexModAuthor, re.IGNORECASE)
        reModDescription = re.compile(self.regexModDescription, re.IGNORECASE)
        reModRunInChroot = re.compile(self.regexModRunInChroot, re.IGNORECASE)
        reModReqApache = re.compile(self.regexModReqApache, re.IGNORECASE)
        reModReqXnest = re.compile(self.regexModReqXnest, re.IGNORECASE)
        reModUpdateUrl = re.compile(self.regexModUpdateUrl, re.IGNORECASE)

        for line in fMod:
            if reModCategory.match(line) != None:
                modCategory = reModCategory.match(line).group(1)
            if reModSubCategory.match(line) != None:
                modSubCategory = reModSubCategory.match(line).group(1)
            if reModName.match(line) != None:
                modName = reModName.match(line).group(1)
            if reModVersion.match(line) != None:
                modVersion = reModVersion.match(line).group(1)
            if reModAuthor.match(line) != None:
                modAuthor = reModAuthor.match(line).group(1)
            if reModDescription.match(line) != None:
                modDescription = reModDescription.match(line).group(1)
            if reModRunInChroot.match(line) != None:
                modRunInChroot = reModRunInChroot.match(line).group(1)
            if reModReqApache.match(line) != None:
                modReqApache = reModReqApache.match(line).group(1)
            if reModReqXnest.match(line) != None:
                modReqXnest = reModReqXnest.match(line).group(1)
            if reModUpdateUrl.match(line) != None:
                modUpdateUrl = reModUpdateUrl.match(line).group(1)
        fMod.close()
	
	
		

        # remove single and double quotes if any
        modCategory = modCategory.replace("'", "")
        modCategory = modCategory.replace('"', '')
        modSubCategory = modSubCategory.replace("'", "")
        modSubCategory = modSubCategory.replace('"', '')
        modName = modName.replace("'", "")
        modName = modName.replace('"', '')
        modAuthor = modAuthor.replace("'", "")
        modAuthor = modAuthor.replace('"', '')
        modDescription = modDescription.replace("'", "")
        modDescription = modDescription.replace('"', '')
        modUpdateUrl = modUpdateUrl.replace("'", "")
        modUpdateUrl = modUpdateUrl.replace('"', '')

        properties[self.modEngineKey] = 'None'
        properties[self.modCategoryKey] = modCategory
        properties[self.modSubCategoryKey] = modSubCategory
        properties[self.modNameKey] = modName
        properties[self.modAuthorKey] = modAuthor
        properties[self.modDescriptionKey] = modDescription
        properties[self.modRunInChrootKey] = modRunInChroot
        properties[self.modVersionKey] = modVersion
        properties[self.modUpdateUrlKey] = modUpdateUrl
	properties[self.modReqApache] = modReqApache
	properties[self.modReqXnest] = modReqXnest

        return properties

    # Loads modules
    def loadModules(self):
        print _('Loading modules...')
        # generate model for treeview
        # create treestore of (install(bool), modulename, version, author, description, runInChroot(hidden), filepath(hidden))
        self.treeModel = None
        self.treeModel = gtk.TreeStore(gobject.TYPE_STRING, gobject.TYPE_BOOLEAN, gobject.TYPE_BOOLEAN, gobject.TYPE_STRING, gobject.TYPE_STRING, gobject.TYPE_STRING, gobject.TYPE_STRING, gobject.TYPE_BOOLEAN, gobject.TYPE_STRING, gobject.TYPE_STRING, gobject.TYPE_BOOLEAN)
        # load categories self.treeModel
        # root categories
        self.iterCategorySoftware = self.treeModel.insert_before(None, None)
        self.treeModel.set_value(self.iterCategorySoftware, 0, 'Software')
       # Server
	self.iterCategoryServer = self.treeModel.insert_before(self.iterCategorySoftware, None)
        self.treeModel.set_value(self.iterCategoryServer, 0, 'Server')
        # Scripts
        self.iterCategoryOs = self.treeModel.insert_before(self.iterCategorySoftware, None)
        self.treeModel.set_value(self.iterCategoryOs, 0, 'OS')
        # Client
        self.iterCategoryClient = self.treeModel.insert_before(self.iterCategorySoftware, None)
        self.treeModel.set_value(self.iterCategoryClient, 0, 'Client')
        # miscellaneous
        self.iterCategoryMisc = self.treeModel.insert_before(self.iterCategorySoftware, None)
        self.treeModel.set_value(self.iterCategoryMisc, 0, 'Web_app')

        # load modules into the treestore
        for root, dirs, files in os.walk(self.moduleDir):
                for f in files:
                    r, ext = os.path.splitext(f)
                    if ext == '.rmod' or ext == '.smod' or ext == '.omod':
                        print 'Module: ' + f.replace('.?mod', '') + ' found...'

                        modPath = os.path.join(self.moduleDir, f)

                        # Refactoring! triplem
                        modProps = self.getModuleProperties(f)
                        modSubCategory = modProps[self.modSubCategoryKey]

                        if self.modules.has_key(modProps[self.modNameKey]):
                            print "The module is already present"

                        self.modules[modProps[self.modNameKey]] = modProps

                        # load into self.treeModel
                        #iter = self.treeModel.insert_before(iterCatOther, None)
                        
                        if modSubCategory == 'OS':
                            iter = self.treeModel.insert_before(self.iterCategoryOs, None)
			elif modSubCategory == 'Server':
			    iter = self.treeModel.insert_before(self.iterCategoryServer, None)
                      	elif modSubCategory == 'Client':
			    iter = self.treeModel.insert_before(self.iterCategoryClient, None)
                        else:
                            iter = self.treeModel.insert_before(self.iterCategoryMisc, None)

                        self.treeModel.set_value(iter, self.moduleColumnExecute, False)
                        self.treeModel.set_value(iter, self.moduleColumnName, modProps[self.modNameKey])
                        self.treeModel.set_value(iter, self.moduleColumnVersion, modProps[self.modVersionKey])
                        self.treeModel.set_value(iter, self.moduleColumnAuthor, modProps[self.modAuthorKey])
                        self.treeModel.set_value(iter, self.moduleColumnDescription, modProps[self.modDescriptionKey])
                        self.treeModel.set_value(iter, self.moduleColumnRunInChroot, bool(modProps[self.modRunInChrootKey]))
                        self.treeModel.set_value(iter, self.moduleColumnUpdateUrl, modProps[self.modUpdateUrlKey])
                        self.treeModel.set_value(iter, self.moduleColumnPath, modPath)
                       	self.treeModel.set_value(iter, self.moduleColumnReqApache, bool(modProps[self.modReqApache]))
                        #print modName, modVersion, modAuthor, modDescription, modUseXterm, modRunInChroot, modPath
                        # set default sort by category
                        self.treeModel.set_sort_column_id(self.moduleColumnName, gtk.SORT_ASCENDING)
                        # build treeview
                        view = self.treeView
                        view = gtk.TreeView(self.treeModel)
                        view.get_selection().set_mode(gtk.SELECTION_SINGLE)
                        view.set_property('search-column', self.moduleColumnName)
                        view.set_reorderable(False)
                        view.set_enable_search(True)
                        view.set_headers_clickable(True)
                        view.set_rules_hint(True)
                        view.connect("row-activated", self.on_treeitem_row_activated)
                        #view.set_model(model)
                        # category column
                        rendererCategory = gtk.CellRendererText()
                        categoryText = _('Category')
                        columnCategory = gtk.TreeViewColumn(categoryText, rendererCategory, text=self.moduleColumnCategory)
                        columnCategory.set_sort_column_id(self.moduleColumnCategory)
                        view.append_column(columnCategory)
                        # execute column
                        rendererExecute = gtk.CellRendererToggle()
                        rendererExecute.set_property('activatable', True)
                        rendererExecute.connect("toggled", self.on_treeitemExecute_toggled, self.treeModel)
                        executeText = _('Execute')
                        columnExecute = gtk.TreeViewColumn(executeText, rendererExecute, active=self.moduleColumnExecute)
                        view.append_column(columnExecute)
                        # module name column
                        rendererModName = gtk.CellRendererText()
                        modNameText = _('Module')
                        columnModName = gtk.TreeViewColumn(modNameText, rendererModName, text=self.moduleColumnName)
                        columnModName.set_resizable(True)
                        columnModName.set_sort_column_id(self.moduleColumnName)
                        view.append_column(columnModName)
                        # module version column
                        rendererModVersion = gtk.CellRendererText()
                        rendererModVersion.set_property('xalign', 0.5)
                        modVersionText = _(' Module Version')
                        columnModVersion = gtk.TreeViewColumn(modVersionText, rendererModVersion, text=self.moduleColumnVersion)
                        view.append_column(columnModVersion)
                        # module author column
                        rendererModAuthor = gtk.CellRendererText()
                        modAuthorText = _('Author')
                        columnModAuthor = gtk.TreeViewColumn(modAuthorText, rendererModAuthor, text=self.moduleColumnAuthor)
                        columnModAuthor.set_resizable(True)
                        columnModAuthor.set_sort_column_id(self.moduleColumnAuthor)
                        view.append_column(columnModAuthor)
                        # module description column
                        rendererModDescription = gtk.CellRendererText()
                        modDescriptionText = _('Description')
                        columnModDescription = gtk.TreeViewColumn(modDescriptionText, rendererModDescription, text=self.moduleColumnDescription)
                        columnModDescription.set_resizable(True)
                        view.append_column(columnModDescription)
                        # module run in chroot column
                        rendererModRunInChroot = gtk.CellRendererToggle()
                        modRunInChrootText = _('Run in Chroot')
                        columnModRunInChroot = gtk.TreeViewColumn(modRunInChrootText, rendererModRunInChroot, active=self.moduleColumnRunInChroot)
                        # show column if running debug
                        if self.runningDebug == True:
                            columnModRunInChroot.set_property('visible', True)
                        else:
                            columnModRunInChroot.set_property('visible', False)
                        view.append_column(columnModRunInChroot)
                        # module update url column
                        rendererModUpdateUrl = gtk.CellRendererText()
                        modUpdateUrlText = _('Update URL')
                        columnModUpdateUrl = gtk.TreeViewColumn(modUpdateUrlText, rendererModUpdateUrl, text=self.moduleColumnUpdateUrl)
                        # show column if running debug
                        if self.runningDebug == True:
                            columnModUpdateUrl.set_property('visible', True)
                        else:
                            columnModUpdateUrl.set_property('visible', False)
                        view.append_column(columnModUpdateUrl)
                        # module path column
                        rendererModPath = gtk.CellRendererText()
                        modPathText = _('Path')
                        columnModPath = gtk.TreeViewColumn(modPathText, rendererModPath, text=self.moduleColumnPath)
                        columnModPath.set_resizable(True)
                        # show column if running debug
                        if self.runningDebug == True:
                            columnModPath.set_property('visible', True)
                        else:
                            columnModPath.set_property('visible', False)
                        view.append_column(columnModPath)
			# module req Apache column
                        rendererModReqApache = gtk.CellRendererToggle()
                        modReqApacheText = _('Require Apache')
                        columnModReqApache = gtk.TreeViewColumn(modReqApacheText, rendererModReqApache, active=self.moduleColumnReqApache)
                        # show column if running debug
                        if self.runningDebug == True:
                            columnModReqApache.set_property('visible', True)
                        else:
                            columnModReqApache.set_property('visible', False)
                        view.append_column(columnModReqApache)
                                               

			self.wTree.get_widget("scrolledwindowModules").add(view)
                        view.show()
                        # expand Software section
                        view.expand_to_path('0')
                        self.setDefaultCursor() 

    def listModules(self):
	print _('Listing modules...')
        print " \033[1m Module Name \033[0m\n"
	print "Module file name | Description | Author | Version | Require Apache | Run in chroot"
                        
        # load modules into the treestore
        for root, dirs, files in os.walk(self.moduleDir):
		count = 1
                for f in files:
                    r, ext = os.path.splitext(f)
                    if ext == '.rmod' or ext == '.smod' or ext == '.omod':
                        #print 'Module: ' + f.replace('.?mod', '') + ' found...'

                        modPath = os.path.join(self.moduleDir, f)

                        # Refactoring! triplem
                        modProps = self.getModuleProperties(f)
                        modSubCategory = modProps[self.modSubCategoryKey]

                        if self.modules.has_key(modProps[self.modNameKey]):
                            print "The module is already present"

                        self.modules[modProps[self.modNameKey]] = modProps

                        # load into self.treeModel
                        #iter = self.treeModel.insert_before(iterCatOther, None)
			print "\033[1m "+ str(count) + "| "+ str(modProps[self.modNameKey]) + "\033[0m\n"
                        print str(os.path.basename(modPath))  + " | " +str(modProps[self.modDescriptionKey]) + " | "  +str(modProps[self.modAuthorKey]) + " | "+ str(modProps[self.modVersionKey]) + " | "  + str(bool(modProps[self.modReqApache]))+ " | " +str(bool(modProps[self.modRunInChrootKey]))+ "\n"
						
                       	count +=1
			
    def cmdLoadModules(self):
	print _('Listing choosen modules...\n')
        print " \033[1m Module Name \033[0m\n"
	print "Module file name | Description | Author | Version | Require Apache | Run in chroot\n"
        self.choosenModule = []            
        # load modules into the treestore
        for root, dirs, files in os.walk(self.moduleDir):
		count = 0
                for f in files:
                    r, ext = os.path.splitext(f)
                    if ext == '.rmod' or ext == '.smod' or ext == '.omod':
                        #print 'Module: ' + f.replace('.?mod', '') + ' found...'

                        modPath = os.path.join(self.moduleDir, f)

                        # Refactoring! triplem
                        modProps = self.getModuleProperties(f)
                        modSubCategory = modProps[self.modSubCategoryKey]

                        if self.modules.has_key(modProps[self.modNameKey]):
                            print "The module is already present"

                        self.modules[modProps[self.modNameKey]] = modProps

                        # load into self.treeModel
                        #iter = self.treeModel.insert_before(iterCatOther, None)
			if commands.getoutput("cat "+self.moduleFilename+" | grep \""+str(modProps[self.modNameKey])+"\"") != "" :
				
				moduleProperties = []
				moduleProperties.append(modProps[self.modNameKey]) 
				moduleProperties.append(modProps[self.modReqApache]) 
				moduleProperties.append(modPath) 
				moduleProperties.append(bool(modProps[self.modRunInChrootKey])) 
				self.choosenModule.append(moduleProperties)
				print "\033[1m "+ str(count) + "| "+ str(self.choosenModule[count][0]) + "\033[0m\n"
                        	print str(os.path.basename(modPath))  + " | " +str(modProps[self.modDescriptionKey]) + " | "  +str(modProps[self.modAuthorKey]) + " | "+ str(modProps[self.modVersionKey]) + " | "  + str(bool(modProps[self.modReqApache]))+ " | " +str(bool(modProps[self.modRunInChrootKey]))+ "\n"
				self.cmdCopyExecuteModule(moduleProperties)		
                       		count +=1
				self.execModulesEnabled =True
					
				if bool(modProps[self.modReqApache]) == True :       
					self.ReqApache = "A"
					fReqApache=open(os.path.join(self.customDir, "chroot/tmp/apache"), 'w')
			    		fReqApache.write(self.ReqApache)
			    		fReqApache.close()
				
			    	if bool(modProps[self.modReqXnest]) == True:      
					self.reqXnest = True
				
				if modPath != None:
				   	# check for execute
				  	
					#print modName, modRunInChroot
					if bool(modProps[self.modRunInChrootKey]) == True:
					    #print modName + ' - Running in chroot...'
					    os.popen('cp -R \"' + modPath + '\" \"' + os.path.join(self.customDir, "chroot/tmp/") + '\"')
					    os.popen('chmod a+x \"' + os.path.join(self.customDir, "chroot/tmp/") + os.path.basename(modPath) + '\"')

					else:
					    #print modName + ' - Running in custom directory...'
					    os.popen('cp -R \"' + modPath + '\" \"' + os.path.join(self.customDir, "scripts/") + '\"')
					    os.popen('chmod a+x \"' + os.path.join(self.customDir, "scripts/") + os.path.basename(modPath) + '\"')


    def addModule(self, modulePath, updating=False):
        try:
            # if not updating, copy to modules dir
            if updating == False:
                r, ext = os.path.splitext(modulePath)
                if ext == '.rmod' or ext == '.smod' or ext == '.smod':
                    installText = _('Installing Module: ')
                    print installText + os.path.basename(modulePath)
                    shutil.copy(modulePath, self.moduleDir)
                    os.popen('chmod -R 777 \"' + self.moduleDir + '\"')
                    # parse and add module to model

                    modPath = os.path.join(self.moduleDir, r)

                    # Refactoring! triplem
                    modProps = self.getModuleProperties(os.path.basename(modulePath))
                    modSubCategory = modProps[self.modSubCategoryKey]

                    if self.modules.has_key(modProps[self.modNameKey]):
                        print "The module is already present"

                    if modSubCategory == 'Administration':
                        iter = self.treeModel.insert_before(self.iterCategoryAdministration, None)
                    elif modSubCategory == 'Education':
                        iter = self.treeModel.insert_before(self.iterCategoryEducation, None)
                    elif modSubCategory == 'Servers':
                        iter = self.treeModel.insert_before(self.iterCategoryServers, None)
                    elif modSubCategory == 'Graphics':
                        iter = self.treeModel.insert_before(self.iterCategoryGraphics, None)
                    elif modSubCategory == 'Multimedia':
                        iter = self.treeModel.insert_before(self.iterCategoryMultimedia, None)
                    elif modSubCategory == 'Networking':
                        iter = self.treeModel.insert_before(self.iterCategoryNetworking, None)
                    elif modSubCategory == 'Plugins':
                        iter = self.treeModel.insert_before(self.iterCategoryPlugins, None)
                    elif modSubCategory == 'Productivity':
                        iter = self.treeModel.insert_before(self.iterCategoryProductivity, None)
                    elif modSubCategory == 'Virtualization':
                        iter = self.treeModel.insert_before(self.iterCategoryVirtualization, None)
                    else:
                        iter = self.treeModel.insert_before(self.iterCategoryMisc, None)

                    self.treeModel.set_value(iter, self.moduleColumnExecute, False)
                   
                    self.treeModel.set_value(iter, self.moduleColumnName, modProps[self.modNameKey])
                    self.treeModel.set_value(iter, self.moduleColumnVersion, modProps[self.modVersionKey])
                    self.treeModel.set_value(iter, self.moduleColumnAuthor, modProps[self.modAuthorKey])
                    self.treeModel.set_value(iter, self.moduleColumnDescription, modProps[self.modDescriptionKey])
                    self.treeModel.set_value(iter, self.moduleColumnRunInChroot, bool(modProps[self.modRunInChrootKey]))
                    self.treeModel.set_value(iter, self.moduleColumnUpdateUrl, modProps[self.modUpdateUrlKey])
                    self.treeModel.set_value(iter, self.moduleColumnPath, modPath)
		    self.treeModel.set_value(iter, self.moduleColumnReqApache, bool(modProps[self.modReqApache]))
                    
        except Exception, detail:
            errText = _('Error installing module: ')
            print errText, modulePath + ': ', detail

    def updateModule(self, moduleName, moduleVersion, moduleFullPath, moduleUpdateUrl, treeview):
        try:
            selection = treeview.get_selection()
            model, iter = selection.get_selected()

            # check for update url
            if moduleUpdateUrl == '':
                updTxt = _('Updating not available for module: ')
                print updTxt, moduleName
            # check for updates
            else:
                updTxt = _('Checking updates for module: ')
                print updTxt, moduleName + '...'
                urllib.urlretrieve(moduleUpdateUrl + os.path.basename(moduleFullPath), "/tmp/r-mod-update.tmp")
                if os.path.exists('/tmp/r-mod-update.tmp'):
                    f = open('/tmp/r-mod-update.tmp', 'r')

                    # Refactoring! triplem
                    newModProps = self.getModuleProperties('/tmp/r-mod-update.tmp')
                    newModSubCategory = newModProps[self.modSubCategoryKey]

                    # check for valid update
                    if newModProps[self.modNameKey] != '':
                        fModVer = float(moduleVersion)
                        fModNewVer = float(newModProps[self.modVersionKey])
                        #print ('Current Module Version: ' + str(fModVer) + ' -- Available: ' + str(fModNewVer))
                        if fModNewVer > fModVer:
                            # update module
                            verTxt = _('Found new version: ')
                            # prompt for installation
                            updateDlg = gtk.Dialog(title="Module Update", parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_NO, gtk.STOCK_YES, gtk.RESPONSE_OK))
                            updateDlg.set_icon_from_file(self.iconFile)
                            updateDlg.vbox.set_spacing(10)
                            labelSpc = gtk.Label(" ")
                            updateDlg.vbox.pack_start(labelSpc)
                            labelSpc.show()
                            # module name label
                            lblModName = gtk.Label('Reconstructor Module: ' + '<b>' + moduleName + '</b>')
                            lblModName.set_use_markup(True)
                            updateDlg.vbox.pack_start(lblModName)
                            lblModName.show()
                            # module author label
                            lblModAuthor = gtk.Label('Author: ' + newModProps[self.modAuthorKey])
                            lblModAuthor.set_use_markup(True)
                            updateDlg.vbox.pack_start(lblModAuthor)
                            lblModAuthor.show()
                            # module version label
                            lblNewVersionTxt = _('New version available: ')
                            lblNewVersion = gtk.Label(lblNewVersionTxt + '<b>' + newModProps[self.modVersionKey] + '</b>')
                            lblNewVersion.set_use_markup(True)
                            updateDlg.vbox.pack_start(lblNewVersion)
                            lblNewVersion.show()
                            #lblInfo = gtk.Label(updateInfo)
                            #lblInfo.set_use_markup(True)
                            #updateDlg.vbox.pack_start(lblInfo)
                            #lblInfo.show()
                            lblConfirm = gtk.Label('Update?')
                            updateDlg.vbox.pack_start(lblConfirm)
                            lblConfirm.show()

                            response = updateDlg.run()
                            if response == gtk.RESPONSE_OK:
                                updateDlg.destroy()
                                updateText = _('Updating...')
                                print updateText
                                # copy update to modules
                                os.popen('cp -Rf /tmp/r-mod-update.tmp ' + '\"' + os.path.join(self.moduleDir, os.path.basename(moduleFullPath)) + '"')
                                # remove old from treemodel
                                self.treeModel.remove(iter)
                                # add new version to treemodel
                                self.addModule(moduleFullPath, updating=True)
                                modUpdatedTxt = _('Module updated.')
                                print modUpdatedTxt
                            else:
                                print _('Module update cancelled.')
                                updateDlg.destroy()
                        else:
                            # latest version
                            print _('Module is at the latest version.')
                    else:
                        errUpdTxt = _('Could not find a valid update for module: ')
                        print errUpdTxt, moduleName
                else:
                    print 'Updating not available...'
            # cleanup
            if os.path.exists('/tmp/r-mod-update.tmp'):
                os.popen('rm -f /tmp/r-mod-update.tmp')
            # set default cursor
            self.setDefaultCursor()

        except Exception, detail:
            # cleanup
            #if os.path.exists('/tmp/r-mod-update.tmp'):
            #    os.popen('rm -f /tmp/r-mod-update.tmp')
            # set default cursor
            self.setDefaultCursor()
            errText = _('Error updating module: ')
            print errText, detail


    def updateSelectedModule(self):
        try:
            selection = self.treeView.get_selection()
            model, iter = selection.get_selected()
            modName = ''
            modVersion = ''
            modPath = None
            modUpdateUrl = ''
            if iter:
                path = model.get_path(iter)
                modName = model.get_value(iter, self.moduleColumnName)
                modVersion = model.get_value(iter, self.moduleColumnVersion)
                modPath = model.get_value(iter, self.moduleColumnPath)
                modUpdateUrl = model.get_value(iter, self.moduleColumnUpdateUrl)

            # check for valid module and update
            if modPath != None:
                mTxt = _('Checking updates for module: ')
                print mTxt, modName
                print modUpdateUrl + os.path.basename(modPath)
                urllib.urlretrieve(modUpdateUrl + os.path.basename(modPath), "/tmp/r-mod-update.tmp")
                if os.path.exists('/tmp/r-mod-update.tmp'):
                    f = open('/tmp/r-mod-update.tmp', 'r')
                    # parse module and get info
                    newModCategory = ''
                    newModSubCategory = ''
                    newModName = ''
                    newModVersion = ''
                    newModAuthor = ''
                    newModDescription = ''
                    newModRunInChroot = None
                    newModUpdateUrl = ''
                    newModPath = os.path.join(self.moduleDir, os.path.basename(modPath))
                    # HACK: regex through module to get info
                    reModCategory = re.compile(self.regexModCategory, re.IGNORECASE)
                    reModSubCategory = re.compile(self.regexModSubCategory, re.IGNORECASE)
                    reModName = re.compile(self.regexModName, re.IGNORECASE)
                    reModVersion = re.compile(self.regexModVersion, re.IGNORECASE)
                    reModAuthor = re.compile(self.regexModAuthor, re.IGNORECASE)
                    reModDescription = re.compile(self.regexModDescription, re.IGNORECASE)
                    reModRunInChroot = re.compile(self.regexModRunInChroot, re.IGNORECASE)
                    reModUpdateUrl = re.compile(self.regexModUpdateUrl, re.IGNORECASE)

                    for line in fMod:
                        if reModCategory.match(line) != None:
                            newModCategory = reModCategory.match(line).group(1)
                        if reModSubCategory.match(line) != None:
                            newModSubCategory = reModSubCategory.match(line).group(1)
                        if reModName.match(line) != None:
                            newModName = reModName.match(line).group(1)
                        if reModVersion.match(line) != None:
                            newModVersion = reModVersion.match(line).group(1)
                        if reModAuthor.match(line) != None:
                            newModAuthor = reModAuthor.match(line).group(1)
                        if reModDescription.match(line) != None:
                            newModDescription = reModDescription.match(line).group(1)
                        if reModRunInChroot.match(line) != None:
                            newModRunInChroot = reModRunInChroot.match(line).group(1)
                        if reModUpdateUrl.match(line) != None:
                            newModUpdateUrl = reModUpdateUrl.match(line).group(1)
                    f.close()
                    fModVer = float(modVersion)
                    fModNewVer = float(newModVersion)
                    print ('Current Module Version: ' + str(fModVer) + ' -- Available: ' + str(fModNewVer))
                    if fUpdate > fApp:
                        # update module
                        updateText = _('Updating Module: ')
                        print updateText, modName + '...'
                    else:
                        # latest version
                        print _('Module is at the latest version.\n')
                    # cleanup
                    if os.path.exists('/tmp/r-mod-update.tmp'):
                        os.popen('rm -f /tmp/r-mod-update.tmp')
                # set default cursor
                self.setDefaultCursor()

        except Exception, detail:
            errText = _('Error updating module: ')
            print errText, detail





    def on_treeitemExecute_toggled(self, cell, path_str, model):
            # get toggled iter
            iter = model.get_iter_from_string(path_str)
            toggle_item = cell.get_active()

            # change value
            toggle_item = not toggle_item

           
            # set new value
            model.set(iter, self.moduleColumnExecute, toggle_item)

            # toggle all child nodes
            if model.iter_n_children(iter) > 0:
                for i in range(model.iter_n_children(iter)):
                    childToggled = model.get_value(model.iter_nth_child(iter, i), self.moduleColumnExecute)
                    model.set(model.iter_nth_child(iter, i), self.moduleColumnExecute, toggle_item)

    

    def on_treeitem_row_activated(self, treeview, path, column):
        self.showModuleSource(treeview)

    def showModuleSource(self, treeview):
        try:
            selection = treeview.get_selection()
            model, iter = selection.get_selected()
            modName = ''
            modPath = None
            if iter:
                path = model.get_path(iter)
                modName = model.get_value(iter, self.moduleColumnName)
                modPath = model.get_value(iter, self.moduleColumnPath)

            if modPath:
                f = file(modPath, 'r')
                scr = f.read()
                f.close()
                # create dialog
                modDlg = gtk.Dialog(title="Module:  " + modName, parent=None, flags=0, buttons=(gtk.STOCK_CLOSE, gtk.RESPONSE_OK))

                modDlg.set_default_size(512, 512)
                modDlg.set_icon_from_file(self.iconFile)
                modDlg.vbox.set_spacing(10)
                labelSpc = gtk.Label(" ")
                modDlg.vbox.pack_start(labelSpc, False, False)
                labelSpc.show()
                # scrolled window for module text
                sw = gtk.ScrolledWindow()
                sw.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
                sw.set_shadow_type(gtk.SHADOW_IN)
                # text buffer for module
                tBuffer = gtk.TextBuffer()
                tBuffer.set_text(scr)
                textviewModule = gtk.TextView(tBuffer)
                textviewModule.set_editable(False)
                sw.add(textviewModule)
                modDlg.vbox.pack_start(sw, True, True)

                textviewModule.show()
                sw.show()
                #modDlg.show()
                response = modDlg.run()
                if response != None:
                    modDlg.destroy()


        except Exception, detail:
            print detail
            pass

    def copyExecuteModule(self, model, path, iter):
     
	modName = model.get_value(iter, self.moduleColumnName)
	modExecute = model.get_value(iter, self.moduleColumnExecute)
	modPath = model.get_value(iter, self.moduleColumnPath)
	modRunInChroot = model.get_value(iter, self.moduleColumnRunInChroot)
	modReqApache = model.get_value(iter, self.moduleColumnReqApache)

	# check for module and skip category
 	if modExecute == True:	
		if modReqApache == True:       
	        	self.ReqApache="A"
			fReqApache=open(os.path.join(self.customDir, "chroot/tmp/apache"), 'w')
	    		fReqApache.write(self.ReqApache)
	    		fReqApache.close()
	    
	if modPath != None:
	    # check for execute
	    if modExecute == True:
	        #print modName, modRunInChroot
	        if modRunInChroot == True:
	            #print modName + ' - Running in chroot...'
	            os.popen('cp -R \"' + modPath + '\" \"' + os.path.join(self.customDir, "chroot/tmp/") + '\"')
	            os.popen('chmod a+x \"' + os.path.join(self.customDir, "chroot/tmp/") + os.path.basename(modPath) + '\"')

	        else:
	            print modName + ' - Running in custom directory...'
	            os.popen('cp -R \"' + modPath + '\" \"' + os.path.join(self.customDir, "scripts/") + '\"')
	            os.popen('chmod a+x \"' + os.path.join(self.customDir, "scripts/") + os.path.basename(modPath) + '\"')

    def cmdCopyExecuteModule(self, model):
     
	modName = model[0]
	modExecute = True
	modPath = model[2]
	modRunInChroot = model[3]
	modReqApache = model[1]

	# check for module and skip category
 	if modExecute == True:	
		if modReqApache == True:       
	        	self.ReqApache="A"
			fReqApache=open(os.path.join(self.customDir, "chroot/tmp/apache"), 'w')
	    		fReqApache.write(self.ReqApache)
	    		fReqApache.close()
	    
	if modPath != None:
	    # check for execute
	    if modExecute == True:
	        #print modName, modRunInChroot
	        if modRunInChroot == True:
	            #print modName + ' - Running in chroot...'
	            os.popen('cp -R \"' + modPath + '\" \"' + os.path.join(self.customDir, "chroot/tmp/") + '\"')
	            os.popen('chmod a+x \"' + os.path.join(self.customDir, "chroot/tmp/") + os.path.basename(modPath) + '\"')

	        else:
	            print modName + ' - Running in custom directory...'
	            os.popen('cp -R \"' + modPath + '\" \"' + os.path.join(self.customDir, "scripts/") + '\"')
	            os.popen('chmod a+x \"' + os.path.join(self.customDir, "scripts/") + os.path.basename(modPath) + '\"')
	
   

    def checkExecModuleEnabled(self, model, path, iter):
        modExecute = model.get_value(iter, self.moduleColumnExecute)
        if modExecute == True:
            self.execModulesEnabled = True

   

    def clearRunOnBootModules(self):
        try:
            # remove all run on boot modules and scripts
            print _('Clearing all run on boot modules and scripts...')
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/skel/.gnomerc") + '\"')
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/usr/share/reconstructor/") + '\"')
        except Exception, detail:
            errText = _('Error clearing run on boot modules: ')
            print errText, detail

    def checkSetup(self):
        setup = False
        if self.createRemasterDir == True:
            setup = True
        elif self.createCustomRoot == True:
            setup = True
        else:
            # nothing to be done
            setup = False
        return setup

    def checkAltSetup(self):
        setup = False
        if self.createAltRemasterDir == True:
            setup = True
        elif self.createAltInitrdRoot == True:
            setup = True
        else:
            # nothing to be done
            setup = False
        return setup

    def checkCustomDir(self):
        if self.customDir == "":
            return False
        else:
            if os.path.exists(self.customDir) == False:
                os.makedirs(self.customDir)
            return True

    def setPage(self, pageNum):
        self.wTree.get_widget("notebookWizard").set_current_page(pageNum)

    def setBusyCursor(self):
        self.working = True
        self.wTree.get_widget("windowMain").window.set_cursor(gtk.gdk.Cursor(gtk.gdk.WATCH))

    def setDefaultCursor(self):
        self.working = False
        self.wTree.get_widget("windowMain").window.set_cursor(None)

    def showWorking(self):
        self.workingDlg = gtk.Dialog(title="Working")
        self.workingDlg.set_modal(True)
        self.workingDlg.show()

    def hideWorking(self):
        self.workingDlg.hide()

    def checkWindowsPrograms(self):
        apps = False
        if os.path.exists(os.path.join(self.customDir, "remaster/bin")):
            apps = True
        if os.path.exists(os.path.join(self.customDir, "remaster/programs")):
            apps = True
        return apps

    # checks if user entered custom password matches
    def checkUserPassword(self):
        if self.wTree.get_widget("entryLiveCdUserPassword").get_text() == self.wTree.get_widget("entryLiveCdUserPasswordCheck").get_text():
            return True
        else:
            return False
    
    def checkUserName(self):
	if int(commands.getoutput('echo ' + self.wTree.get_widget("entryLiveCdUsername").get_text() + ' | wc -m')) > 6 :
		if commands.getoutput('echo '  + self.wTree.get_widget("entryLiveCdUsername").get_text() + '| grep \'^[a-z0-9_-*.]*$\'') != '':
	    		return True
		else:
	    		return False
        else:
            	return False

    def checkSoftware(self):
        install = False
        # custom apt-get
        if self.wTree.get_widget("entryCustomAptInstall").get_text() != "":
            install = True
        # software removal
        # custom
        if self.wTree.get_widget("entryCustomAptRemove").get_text() != "":
            install = True

        return install

    def checkCustomRepos(self):
        customRepos = False
        if self.wTree.get_widget("checkbuttonAptRepoUbuntuOfficial").get_active() == True:
            #print "Selected Ubuntu Official apt archive..."
            customRepos = True
        elif self.wTree.get_widget("checkbuttonAptRepoUbuntuRestricted").get_active() == True:
            #print "Selected Ubuntu Restricted apt archive..."
            customRepos = True
        elif self.wTree.get_widget("checkbuttonAptRepoUbuntuUniverse").get_active() == True:
            #print "Selected Ubuntu Universe apt archive..."
            customRepos = True
        elif self.wTree.get_widget("checkbuttonAptRepoUbuntuMultiverse").get_active() == True:
            #print "Selected Ubuntu Multiverse apt archive..."
            customRepos = True
        else:
            #print "No custom apt repos.  Using defaults."
            customRepos = False
        return customRepos

    def checkAltCustomRepos(self):
        customRepos = False
        if self.wTree.get_widget("checkbuttonAltUbuntuOfficialRepo").get_active() == True:
            #print "Selected Ubuntu Official apt archive..."
            customRepos = True
        elif self.wTree.get_widget("checkbuttonAltUbuntuRestrictedRepo").get_active() == True:
            #print "Selected Ubuntu Restricted apt archive..."
            customRepos = True
        elif self.wTree.get_widget("checkbuttonAltUbuntuUniverseRepo").get_active() == True:
            #print "Selected Ubuntu Universe apt archive..."
            customRepos = True
        elif self.wTree.get_widget("checkbuttonAltUbuntuMultiverseRepo").get_active() == True:
            #print "Selected Ubuntu Multiverse apt archive..."
            customRepos = True
        else:
            #print "No custom apt repos.  Using defaults."
            customRepos = False
        return customRepos

    
    def checkWorkingDir(self):
        # check for existing directories; if not warn...
        remasterExists = None
        rootExists = None
        initrdExists = None
	
	if os.path.exists(os.path.join(self.customDir, "remaster")) == False:
            if self.createRemasterDir == False:
                remasterExists = False
        if os.path.exists(os.path.join(self.customDir, "chroot")) == False:
            if self.createCustomRoot == False:
                rootExists = False
		
		

	workingDirOk = True
        if remasterExists == False:
            workingDirOk = False
        if rootExists == False:
            workingDirOk = False
        
        if workingDirOk == False:
		if self.commandLine == False:
		    warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_OK, gtk.RESPONSE_OK))
		    warnDlg.set_icon_from_file(self.iconFile)
		    warnDlg.vbox.set_spacing(10)
		    labelSpc = gtk.Label(" ")
		    warnDlg.vbox.pack_start(labelSpc)
		    labelSpc.show()
		    lblWarningText = _("  <b>Please fix the errors below before continuing.</b>   ")
		    lblRemasterText = _("  There is no remaster directory.  Please select create remaster option.  ")
		    lblRootText = _("  There is no root directory.  Please select create root option.  ")
		    lblInitrdText = _("  There is no initrd directory.  Please select create initrd option.  ")
		    labelWarning = gtk.Label(lblWarningText)
		    labelRemaster = gtk.Label(lblRemasterText)
		    labelRoot = gtk.Label(lblRootText)
		    labelInitrd = gtk.Label(lblInitrdText)

		    labelWarning.set_use_markup(True)
		    labelRemaster.set_use_markup(True)
		    labelRoot.set_use_markup(True)
		    labelInitrd.set_use_markup(True)
		    warnDlg.vbox.pack_start(labelWarning)
		    warnDlg.vbox.pack_start(labelRemaster)
		    warnDlg.vbox.pack_start(labelRoot)
		    warnDlg.vbox.pack_start(labelInitrd)
		    labelWarning.show()

		    if remasterExists == False:
		        labelRemaster.show()
		    if rootExists == False:
		        labelRoot.show()
		    if initrdExists == False:
		        labelInitrd.show()

		    #warnDlg.show()
		    response = warnDlg.run()
		    # HACK: return False no matter what
		    if response == gtk.RESPONSE_OK:
		        warnDlg.destroy()
		    else:
		        warnDlg.destroy()
		else:
		    lblWarningText = _("  <b>Please fix the errors below before continuing.</b>   \n")
		    lblRemasterText = _("  There is no remaster directory.  Please select create remaster option.  ")
		    lblRootText = _("  There is no root directory.  Please select create root option.  ")
		    print lblWarningText
		    if remasterExists == False:
		        print lblRemasterText
		    if rootExists == False:
		        print lblRootText
	if workingDirOk== True :
		 self.checkLiveCdVersion()
        return workingDirOk

   
    def createShutdownScript(self):
	    #Shutdown script initialisation
            modExecShutdownWs = '#!/bin/sh\n'
            #print modExecShutdownWs
            fModExec=open(os.path.join(self.customDir, "scripts/shutdown_ws.sh"), 'w')
            fModExec.write(modExecShutdownWs)
            fModExec.close()
	    

    def checkPage(self, pageNum):
        if self.runningDebug == True:
            print "CheckPage: " + str(pageNum)
            #print " "
        if pageNum == self.pageWelcome:
            # intro
	    self.discType = "live"
            self.setPage(self.pageInstallType)
            return True
	elif pageNum == self.pageInstallType:
            typeText = _("Install Type:")
            # continue based on disc type (live/alt)
            if self.wTree.get_widget("radiobuttonInstallTypeCd").get_active() == True:
                # set disc type
                self.installType = "Cd"
                print typeText, " " + self.installType
                self.setPage(self.pageLiveSetup)
            elif self.wTree.get_widget("radiobuttonInstallTypeUsb").get_active() == True:
                # set disc type
                self.installType = "Usb"
                print typeText, " " + self.installType
                self.setPage(self.pageUsbSetup) 
	    elif self.wTree.get_widget("radiobuttonInstallTypeDebLive").get_active() == True:
                # set disc type
                self.installType = "Cd"
                print typeText, " " + self.installType
                self.setPage(self.pageDebianLiveSetup)            
        elif pageNum == self.pageLiveSetup:
            # setup
            self.saveSetupInfo()
            # reset interactive edit
            self.interactiveEdit = False
            # check for custom dir
            if self.checkCustomDir() == True:
                if self.checkSetup() == True:
                    if self.checkWorkingDir() == True:
                        warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=    (gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
                        warnDlg.set_icon_from_file(self.iconFile)
                        warnDlg.vbox.set_spacing(10)
                        labelSpc = gtk.Label(" ")
                        warnDlg.vbox.pack_start(labelSpc)
                        labelSpc.show()
                        lblContinueText = _("  <b>Continue?</b>  ")
                        lblContinueInfo = _("     This may take a few minutes.  Please wait...     ")
                        label = gtk.Label(lblContinueText)
                        lblInfo = gtk.Label(lblContinueInfo)
                        label.set_use_markup(True)
                        warnDlg.vbox.pack_start(label)
                        warnDlg.vbox.pack_start(lblInfo)
                        lblInfo.show()
                        label.show()
                        #warnDlg.show()
                        response = warnDlg.run()
                        if response == gtk.RESPONSE_OK:
                            warnDlg.destroy()
                            self.setBusyCursor()
                            gobject.idle_add(self.setupWorkingDirectory)
                            # load modules
                            gobject.idle_add(self.loadModules)
                            self.setBusyCursor()
                            # calculate iso size
                            gobject.idle_add(self.calculateIsoSize)
			  
                            #self.calculateIsoSize()
                            return True
                        else:
                            warnDlg.destroy()
                            return False
                    else:
                        return False
                else:
                    if self.checkWorkingDir() == True:
                        # get ubuntu version
                        #self.loadCdVersion()
                        # load desktop environments
                       
                       
                        # load modules
                        gobject.idle_add(self.loadModules)
                        self.setBusyCursor()
                        # calculate iso size in the background
                        gobject.idle_add(self.calculateIsoSize)
                        #self.calculateIsoSize()
                        return True
                    else:
                        return False
            else:
                warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_OK, gtk.RESPONSE_OK))
                warnDlg.set_icon_from_file(self.iconFile)
                warnDlg.vbox.set_spacing(10)
                labelSpc = gtk.Label(" ")
                warnDlg.vbox.pack_start(labelSpc)
                labelSpc.show()
                lblWorkingDirText = _("  <b>You must enter a working directory.</b>  ")
                label = gtk.Label(lblWorkingDirText)
                #lblInfo = gtk.Label("     This may take a few minutes.  Please     wait...     ")
                label.set_use_markup(True)
                warnDlg.vbox.pack_start(label)
                #warnDlg.vbox.pack_start(lblInfo)
                #lblInfo.show()
                label.show()
                #warnDlg.show()
                response = warnDlg.run()
                # HACK: return False no matter what
                if response == gtk.RESPONSE_OK:
                    warnDlg.destroy()
                    return False
                else:
                    warnDlg.destroy()
                    return False        
	elif pageNum == self.pageDebianLiveSetup:
            # setup
            self.saveDebianLiveSetupInfo()
            # reset interactive edit
            self.interactiveEdit = False
            # check for custom dir
            if self.checkCustomDir() == True:
                  	warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=    (gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
		        warnDlg.set_icon_from_file(self.iconFile)
		        warnDlg.vbox.set_spacing(10)
		        labelSpc = gtk.Label(" ")
		        warnDlg.vbox.pack_start(labelSpc)
		        labelSpc.show()
		        lblContinueText = _("  <b>Continue?</b>  ")
		        lblContinueInfo = _("     This may take a some.  Please wait...     ")
		        label = gtk.Label(lblContinueText)
		        lblInfo = gtk.Label(lblContinueInfo)
		        label.set_use_markup(True)
		        warnDlg.vbox.pack_start(label)
		        warnDlg.vbox.pack_start(lblInfo)
		        lblInfo.show()
		        label.show()
		        #warnDlg.show()
		        response = warnDlg.run()
		        if response == gtk.RESPONSE_OK:
		            warnDlg.destroy()
		            self.setBusyCursor()
		            gobject.idle_add(self.setupDebianLive)
		            # load modules
		            gobject.idle_add(self.loadModules)
		            self.setBusyCursor()
		            # calculate iso size
		            gobject.idle_add(self.calculateIsoSize)
			  
		            #self.calculateIsoSize()
		            return True
		        else:
		            warnDlg.destroy()
		            return False
            else:
                warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_OK, gtk.RESPONSE_OK))
                warnDlg.set_icon_from_file(self.iconFile)
                warnDlg.vbox.set_spacing(10)
                labelSpc = gtk.Label(" ")
                warnDlg.vbox.pack_start(labelSpc)
                labelSpc.show()
                lblWorkingDirText = _("  <b>You must enter a working directory.</b>  ")
                label = gtk.Label(lblWorkingDirText)
                #lblInfo = gtk.Label("     This may take a few minutes.  Please     wait...     ")
                label.set_use_markup(True)
                warnDlg.vbox.pack_start(label)
                #warnDlg.vbox.pack_start(lblInfo)
                #lblInfo.show()
                label.show()
                #warnDlg.show()
                response = warnDlg.run()
                # HACK: return False no matter what
                if response == gtk.RESPONSE_OK:
                    warnDlg.destroy()
                    return False
                else:
                    warnDlg.destroy()
                    return False
        
        elif pageNum == self.pageLiveCustomize:
            warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
            warnDlg.set_icon_from_file(self.iconFile)
            warnDlg.vbox.set_spacing(10)
            labelSpc = gtk.Label(" ")
            warnDlg.vbox.pack_start(labelSpc)
            labelSpc.show()
            lblContinueText = _("  <b>Continue?</b>  ")
            label = gtk.Label(lblContinueText)
            label.set_use_markup(True)
            lblApplyText = _("Be sure to click <b>Apply</b> to apply changes before continuing.")
            lblApply = gtk.Label(lblApplyText)
            lblApply.set_use_markup(True)
            warnDlg.vbox.pack_start(label)
            warnDlg.vbox.pack_start(lblApply)
            label.show()
            lblApply.show()
            #warnDlg.show()
            response = warnDlg.run()
            if response == gtk.RESPONSE_OK:
                warnDlg.destroy()
                self.setPage(self.pageLiveBuild)
	   	self.endCustom()

		# check for windows apps and enable/disable checkbox as necessary
                if self.checkWindowsPrograms() == True:
                    self.wTree.get_widget("checkbuttonLiveCdRemoveWin32Programs").set_sensitive(True)
                else:
                    self.wTree.get_widget("checkbuttonLiveCdRemoveWin32Programs").set_sensitive(False)
                # HACK: check in case "create iso" option is unchecked
                # enable/disable iso burn
                self.checkEnableBurnIso()
		#HACK: init LiveCdIso File Name
		self.wTree.get_widget("entryLiveIsoFilename").set_text(os.path.join(self.customDir, "cooperation-iws-custom.iso"))
                return True
            else:
                warnDlg.destroy()
                return False

        elif pageNum == self.pageLiveBuild:
            # build
            warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
            warnDlg.set_icon_from_file(self.iconFile)
            warnDlg.vbox.set_spacing(10)
            labelSpc = gtk.Label(" ")
            warnDlg.vbox.pack_start(labelSpc)
            labelSpc.show()
            lblBuildText = _("  <b>Build Live CD?</b>  ")
            lblBuildInfo = _("     This may take a few minutes.  Please wait...     ")
            label = gtk.Label(lblBuildText)
            lblInfo = gtk.Label(lblBuildInfo)
            label.set_use_markup(True)
            warnDlg.vbox.pack_start(label)
            warnDlg.vbox.pack_start(lblInfo)
            lblInfo.show()
            label.show()
            #warnDlg.show()
            response = warnDlg.run()
            if response == gtk.RESPONSE_OK:
                warnDlg.destroy()
                self.setBusyCursor()
		if self.wTree.get_widget("entryLiveCdDescription").get_text() != "":
		            self.LiveCdDescription = self.wTree.get_widget("entryLiveCdDescription").get_text()
		# setup build vars
		self.buildSquashRoot = self.wTree.get_widget("checkbuttonBuildSquashRoot").get_active()
		self.buildIso = self.wTree.get_widget("checkbuttonBuildIso").get_active()
		self.buildUsb = self.wTree.get_widget("checkbuttonBuildUsb").get_active()
		self.buildLiveCdFilename = self.wTree.get_widget("entryLiveIsoFilename").get_text()
		self.LiveCdDescription = "cooperation-iws-custom"
		self.LiveCdRemovePrograms = self.wTree.get_widget("checkbuttonLiveCdRemoveWin32Programs").get_active()
		self.LiveCdArch = self.wTree.get_widget("comboboxLiveCdArch").get_active_text()
		self.hfsMap = os.getcwd() + "/lib/hfs.map"
                	
		gobject.idle_add(self.build)
                # change Next text to Finish
                self.wTree.get_widget("buttonNext").set_label("Finish")
                return True
            else:
                warnDlg.destroy()
                return False

        elif pageNum == self.pageUsbSetup:
            # setup
            warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
            warnDlg.set_icon_from_file(self.iconFile)
            warnDlg.vbox.set_spacing(10)
            labelSpc = gtk.Label(" ")
            warnDlg.vbox.pack_start(labelSpc)
            labelSpc.show()
            lblBuildText = _("  <b>Build Live USB ?</b>  ")
            lblBuildInfo = _("     This may take a few minutes.  Please wait...     ")
            label = gtk.Label(lblBuildText)
            lblInfo = gtk.Label(lblBuildInfo)
            label.set_use_markup(True)
            warnDlg.vbox.pack_start(label)
            warnDlg.vbox.pack_start(lblInfo)
            lblInfo.show()
            label.show()
            #warnDlg.show()
            response = warnDlg.run()
            if response == gtk.RESPONSE_OK:
                warnDlg.destroy()
                self.setBusyCursor()
		if self.wTree.get_widget("entryLiveCdDescription").get_text() != "":
		            self.LiveCdDescription = self.wTree.get_widget("entryLiveCdDescription").get_text()
		gobject.idle_add(self.build)
                # change Next text to Finish
                self.wTree.get_widget("buttonNext").set_label("Finish")
                return True
            else:
                warnDlg.destroy()
                return False
	    # check for windows apps and enable/disable checkbox as necessary
            
	    
               #HACK: init LiveCdIso File Name
	    return True
        elif pageNum == self.pageAltCustomize:
            warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
            warnDlg.set_icon_from_file(self.iconFile)
            warnDlg.vbox.set_spacing(10)
            labelSpc = gtk.Label(" ")
            warnDlg.vbox.pack_start(labelSpc)
            labelSpc.show()
            lblContinueText = _("  <b>Continue?</b>  ")
            label = gtk.Label(lblContinueText)
            label.set_use_markup(True)
            lblApplyText = _("Be sure to click <b>Apply</b> to apply changes before continuing.")
            lblApply = gtk.Label(lblApplyText)
            lblApply.set_use_markup(True)
            warnDlg.vbox.pack_start(label)
            warnDlg.vbox.pack_start(lblApply)
            label.show()
            lblApply.show()
            #warnDlg.show()
            response = warnDlg.run()
            if response == gtk.RESPONSE_OK:
                warnDlg.destroy()
                self.setPage(self.pageAltBuild)
                # HACK: check in case "create iso" option is unchecked
                # enable/disable iso burn
                self.checkEnableBurnIso()
                return True
            else:
                warnDlg.destroy()
                return False
        elif pageNum == self.pageAltBuild:
            # build
            warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_YES, gtk.RESPONSE_OK))
            warnDlg.set_icon_from_file(self.iconFile)
            warnDlg.vbox.set_spacing(10)
            labelSpc = gtk.Label(" ")
            warnDlg.vbox.pack_start(labelSpc)
            labelSpc.show()
            lblBuildText = _("  <b>Build Alternate CD?</b>  ")
            lblBuildInfo = _("     This may take a few minutes.  Please wait...     ")
            label = gtk.Label(lblBuildText)
            lblInfo = gtk.Label(lblBuildInfo)
            label.set_use_markup(True)
            warnDlg.vbox.pack_start(label)
            warnDlg.vbox.pack_start(lblInfo)
            lblInfo.show()
            label.show()
            #warnDlg.show()
            response = warnDlg.run()
            if response == gtk.RESPONSE_OK:
                warnDlg.destroy()
                self.setBusyCursor()
                gobject.idle_add(self.buildAlternate)
                # change Next text to Finish
                self.wTree.get_widget("buttonNext").set_label("Finish")
                return True
            else:
                warnDlg.destroy()
                return False

        elif pageNum == self.pageFinish:
            # finished... exit
            print _("Exiting...")
            gtk.main_quit()
            sys.exit(0)

    def checkEnableBurnIso(self):
        # show burn iso button if nautilus-cd-burner exists
        if commands.getoutput('which nautilus-cd-burner') != '':
            # make sure iso isn't blank
            if os.path.exists(self.wTree.get_widget("entryLiveIsoFilename").get_text()):
                self.wTree.get_widget("buttonBurnIso").show()
            else:
                self.wTree.get_widget("buttonBurnIso").hide()
        else:
            self.wTree.get_widget("buttonBurnIso").hide()

    def checkEnableBurnAltIso(self):
        # show burn iso button if nautilus-cd-burner exists
        if commands.getoutput('which nautilus-cd-burner') != '':
            # make sure iso isn't blank
            if os.path.exists(self.wTree.get_widget("entryAltBuildIsoFilename").get_text()):
                self.wTree.get_widget("buttonBurnIso").show()
            else:
                self.wTree.get_widget("buttonBurnIso").hide()
        else:
            self.wTree.get_widget("buttonBurnIso").hide()

    def exitApp(self):
        gtk.main_quit()
        sys.exit(0)

    
    
    # launch chroot terminal
    def launchTerminal(self):
        try:
            # setup environment
            # copy dns info
            print _("Copying DNS info...")
            os.popen('cp -f /etc/resolv.conf ' + os.path.join(self.customDir, "chroot/etc/resolv.conf"))
            # mount /proc
            print _("Mounting /proc filesystem...")
            os.popen('mount --bind /proc \"' + os.path.join(self.customDir, "chroot/proc") + '\"')
            # copy apt.conf
            print _("Copying apt configuration...")
            if not os.path.exists(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/")):
                os.makedirs(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/"))
            os.popen('cp -f /etc/apt/apt.conf.d/* ' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/"))
            # copy wgetrc
            print _("Copying wgetrc configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\"')
            os.popen('cp -f /etc/wgetrc ' + os.path.join(self.customDir, "chroot/etc/wgetrc"))
            print _("Copying hostname configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\"')
            os.popen('cp -f /etc/hosts ' + os.path.join(self.customDir, "chroot/etc/hosts"))
            os.popen('cp -f /etc/hostname ' + os.path.join(self.customDir, "chroot/etc/hostname"))
           
	    # HACK: create temporary script for chrooting
            scr = '#!/bin/sh\n#\n#\t(c) cooperation-iws, 2008\n#\nexport HOME=/root\nchroot ' + os.path.join(self.customDir, "chroot/") + '\n'
            fchroot = open(os.path.join(self.customDir, "scriptChroot.sh"), 'w')
            fchroot.write(scr)
            fchroot.close()
            os.popen('chmod a+x ' + os.path.join(self.customDir, "scriptChroot.sh"))
            # TODO: replace default terminal title with "Reconstructor Terminal"
            # use gnome-terminal if available -- more features
            if commands.getoutput('which gnome-terminal') != '':
                print _('Launching Gnome-Terminal for advanced customization...')
                os.popen('gnome-terminal --hide-menubar -t \"Cooperation-iws Terminal\" -e \"bash ' + os.path.join(self.customDir, "scriptChroot.sh")+ '\"')
            else:
                print _('Launching Xterm for advanced customization...')
                # use xterm if gnome-terminal isn't available
                os.popen('export HOME=/root ; xterm -bg black -fg white -rightbar -title \"Cooperation-iws Terminal\" -e \"bash ' + os.path.join(self.customDir, "scriptChroot.sh")+ '\"')

            # restore wgetrc
            print _("Restoring wgetrc configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            # remove apt.conf
            #print _("Removing apt.conf configuration...")
            #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf") + '\"')
            # remove dns info
            print _("Restoring hostname configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')
           
	    print _("Removing DNS info...")
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
            # remove temp script
            os.popen('rm -Rf /tmp/reconstructor-terminal.sh')
	except Exception, detail:
            # restore settings
            # restore wgetrc
            print _("Restoring wgetrc configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            # remove apt.conf
            #print _("Removing apt.conf configuration...")
            #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf") + '\"')
            # remove dns info
            print _("Removing DNS info...")
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
            # remove temp script
            os.popen('rm -Rf /tmp/reconstructor-terminal.sh')

            errText = _('Error launching terminal: ')
            print errText, detail
            pass

        return


    def endInstall(self):
    	# execute last config 
		os.system('bash \"'+ os.path.join(self.customDir, "scripts/shutdown_ws.sh") + '\"')
			
		print _("Copying DNS info...")
                os.popen('cp -f /etc/resolv.conf ' + os.path.join(self.customDir, "chroot/etc/resolv.conf"))
           	# mount /proc
	    	print _("Mounting /proc filesystem...")
	    	os.popen('mount --bind /proc \"' + os.path.join(self.customDir, "chroot/proc") + '\"')
	    	# copy apt.conf
	    	print _("Copying apt.conf configuration...")
	    	if not os.path.exists(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d")):
			os.makedirs(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d"))
	   	os.popen('cp -f /etc/apt/apt.conf.d/* ' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d"))
	   	# copy wgetrc
	   	print _("Copying wgetrc configuration...")
	   	# backup
	   	os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\"')
	   	os.popen('cp -f /etc/wgetrc ' + os.path.join(self.customDir, "chroot/etc/wgetrc"))
	   	print _("Copying hostname configuration...")
           	# backup
           	os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\"')
            	os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\"')
            	os.popen('cp -f /etc/hosts ' + os.path.join(self.customDir, "chroot/etc/hosts"))
            	os.popen('cp -f /etc/hostname ' + os.path.join(self.customDir, "chroot/etc/hostname"))
           
           	#execute shutdown web server script
		print _("Execute shutdown actions...")
		os.system('chroot \"' + os.path.join(self.customDir,"chroot/") +'\" /tmp/shutdown_ws.sh')
		# cleanup
            	os.popen('cd \"' + os.path.join(self.customDir, "chroot/tmp/") + '\" ; ' + 'rm -Rf *.rmod 1>&2 2>/dev/null')
            	os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/tmp/module-exec.sh") + '\" 1>&2 2>/dev/null')
            	# restore wgetrc
            	print _("Restoring wgetrc configuration...")
            	os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            	# remove apt.conf
            	#print _("Removing apt.conf configuration...")
            	#os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/*") + '\"')
            	# remove dns info
		print _("Restoring hostname configuration...")
                os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
                os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')
                       	
		print _("Removing DNS info...")
            	os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
            	# umount /proc
            	print _("Umounting /proc...")
            	os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')


    # launch post install script

	
    def launchPostInstall(self):
        try:
            # setup environment
            # copy dns info
            print _("Copying DNS info...")
            os.popen('cp -f /etc/resolv.conf ' + os.path.join(self.customDir, "chroot/etc/resolv.conf"))
            # mount /proc
            print _("Mounting /proc filesystem...")
            os.popen('mount --bind /proc \"' + os.path.join(self.customDir, "chroot/proc") + '\"')
            # copy apt.conf
            print _("Copying apt configuration...")
            if not os.path.exists(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/")):
                os.makedirs(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/"))
            os.popen('cp -f /etc/apt/apt.conf.d/* ' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/"))
            # copy wgetrc
            print _("Copying wgetrc configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\"')
            os.popen('cp -f /etc/wgetrc ' + os.path.join(self.customDir, "chroot/etc/wgetrc"))
            print _("Copying hostname configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\"')
            os.popen('cp -f /etc/hosts ' + os.path.join(self.customDir, "chroot/etc/hosts"))
            os.popen('cp -f /etc/hostname ' + os.path.join(self.customDir, "chroot/etc/hostname"))
	    # HACK: create temporary script for chrooting
            scr = '#!/bin/sh\n#\n#\t(c) cooperation-iws, 2008\n#\nchroot ' + os.path.join(self.customDir, "chroot") + " /var/share/lampp/config_post_install.sh" + '\n'
            # TODO: replace default terminal title with "Reconstructor Terminal"
            # use gnome-terminal if available -- more features
            print _('Launching Post install script customizations...')
            os.popen('chmod +x ' + os.path.join(self.customDir, "chroot/var/share/lampp/config_post_install.sh"))
	   
	    os.system('chroot ' + os.path.join(self.customDir, "chroot") + ' /var/share/lampp/config_post_install.sh')
            
            # restore wgetrc
            print _("Restoring wgetrc configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            # remove apt.conf
            #print _("Removing apt.conf configuration...")
            #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf") + '\"')
            # remove dns info
            print _("Restoring hostname configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')
           
	    print _("Removing DNS info...")
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
            # remove temp script
            os.popen('rm -Rf /tmp/reconstructor-terminal.sh')

        except Exception, detail:
            # restore settings
            # restore wgetrc
            print _("Restoring wgetrc configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            # remove apt.conf
            #print _("Removing apt.conf configuration...")
            #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf") + '\"')
            # remove dns info
            print _("Restoring hostname configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')
           
	    print _("Removing DNS info...")
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
            # remove temp script
            os.popen('rm -Rf /tmp/reconstructor-terminal.sh')

            errText = _('Error launching terminal: ')
            print errText, detail
            pass

        return

    # Sets live cd information (username, full name, hostname) for live cd
    def setLiveCdInfo(self, username, userFullname, userPassword, hostname):
	fHostFile=open(os.path.join(self.customDir, "chroot") + '/tmp/hostname', 'w')
   	fHostFile.write(hostname)
    	fHostFile.close()
    		    
 	 	
	if self.casperPath == 'casper': 
	    if self.distVariant == 'mint':
		initUsername = 'mint'
		initUserFullname = 'Live session user'
		initHostName = 'mint'
		initBuildSystem = 'Ubuntu'
	    elif self.distVariant == 'nUbuntu':
		initUsername = 'nubuntu'
		initUserFullname = 'Live session user'
		initHostName = 'live'
		initBuildSystem = 'Ubuntu'
	    else:
		initUsername = 'ubuntu'
		initUserFullname = 'Live session user'
		initHostName = 'ubuntu'
		initBuildSystem = 'Ubuntu'
	    if username != '':
		    print ('Username: ' + username)
		    sed = 'sed -i \'5s/' + initUsername + '/' + username + '/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPath + ".conf")
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	    #sed = 'sed -i \'s/USERNAME=casper/USERNAME=' + username + '/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/casper")
		    #cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if userFullname != '':
		    print ('User Full Name: ' + userFullname)
		    sed = 'sed -i \'s/USERFULLNAME=\"' + initUserFullname + '\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPath + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed User Full Name: \n ' + sed + '\n' + cmd)
	    	    #sed = 'sed -i \'s/USERFULLNAME=\"Live session user\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if hostname != '':
		    print ('Hostname: ' + hostname)
		    sed = 'sed -i \'s/HOST=\"' + initHostName + '\"/HOST=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPath + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed 1 Hostname: \n ' + sed + '\n' + cmd)
		    sed = 'sed -i \'s/BUILD_SYSTEM=\"' + initBuildSystem + '\"/BUILD_SYSTEM=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPath + ".conf")
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed 2 Hostname: \n ' + sed + '\n' + cmd)
		    sed = 'sed -i \'s/HOST=live/HOST=' + hostname + '/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	    sed = 'sed -i \'s/BUILD_SYSTEM=Custom/BUILD_SYSTEM=' + hostname +'/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	   
		    #cmd = commands.getoutput('chmod +r+x '+ os.path.join(self.customDir, "chroot/etc/casper.conf"))	
       

	    
           
            
            
            if userPassword != '':
                #print ('Password: ' + l)
                passwordText = _('Setting Live CD Password... ')
                print passwordText
                #print "DEBUG: Password: " + userPassword + " des Hash: " + commands.getoutput('echo ' + userPassword + ' | mkpasswd -s -H des')
		crypt_pass = commands.getoutput('mkpasswd -s ' + userPassword )			
		while  commands.getoutput(' echo  ' + crypt_pass + ' | grep "[/.]" ') != '' :
               		crypt_pass = commands.getoutput('mkpasswd -s ' + userPassword )
		sed = 'sed -i \'s/set passwd\/user-password-crypted U6aMy0wojraho/set passwd\/user-password-crypted ' + crypt_pass +'/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 password:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'s/ALL=(ALL) NOPASSWD: ALL/ALL=(ALL) ALL/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 2 password: \n ' + sed + '\n' + cmd)
		sed = 'sed -i \'46s/NOPASSWD: //\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/10adduser")
		cmd = commands.getoutput(sed)
 	        #print ('Sed 3 password:\n ' + sed + '\n' + cmd)
		#cmd = commands.getoutput('chmod +r+x '+ os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/casper-bottom/10adduser"))	

                
            
	    if self.checkbuttonDisableAutologin == True:
		sed = 'sed -i \'34s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'36s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'45s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'54s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		
            
        else:
	    if username != '':
		    print ('Username: ' + username)
		    sed = 'sed -i \'3s/user/' + username + '/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPath + ".conf")
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	    sed = 'sed -i \'s/USERNAME=\"user\"/USERNAME=\"' + username + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath)
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if userFullname != '':
		    print ('User Full Name: ' + userFullname)
		    sed = 'sed -i \'s/USERFULLNAME=\"Debian Live user\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPath + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed User Full Name: \n ' + sed + '\n' + cmd)
	    	    sed = 'sed -i \'s/USERFULLNAME=\"Live user\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if hostname != '':
		    print ('Hostname: ' + hostname)
		    sed = 'sed -i \'s/HOSTNAME=\"debian\"/HOSTNAME=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPath + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed 1 Hostname: \n ' + sed + '\n' + cmd)
		    #print ('Sed 2 Hostname: \n ' + sed + '\n' + cmd)
		    sed = 'sed -i \'s/HOSTNAME=\"host\"/HOSTNAME=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	   
		    #cmd = commands.getoutput('chmod +r+x '+ os.path.join(self.customDir, "chroot/etc/casper.conf"))	
       

	    
           
            
            
            if userPassword != '':
                #print ('Password: ' + l)
                passwordText = _('Setting Live CD Password... ')
                print passwordText
                #print "DEBUG: Password: " + userPassword + " des Hash: " + commands.getoutput('echo ' + userPassword + ' | mkpasswd -s -H des')
		crypt_pass = commands.getoutput('mkpasswd -s ' + userPassword )			
		while  commands.getoutput(' echo  ' + crypt_pass + ' | grep "[/.]" ') != '' :
               		crypt_pass = commands.getoutput('mkpasswd -s ' + userPassword )
		sed = 'sed -i \'s/8Ab05sVQ4LLps/' + crypt_pass +'/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 password:\n ' + sed + '\n' + cmd)
		#sed = 'sed -i \'s/set passwd\/root-password-crypted \*/set passwd\/root-password-crypted ${user_crypted}/\' '+ os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/10adduser")  
		#cmd = commands.getoutput(sed)
 	       	sed = 'sed -i \'s/ NOPASSWD://\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
                
            
	    if self.checkbuttonDisableAutologin == True:
		sed = 'sed -i \'s/true/false/g\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)

    		

    # Burns ISO
    def burnIso(self):
        try:
            if commands.getoutput('which nautilus-cd-burner') != '':
                print _('Burning ISO...')
                os.popen('nautilus-cd-burner --source-iso=\"' + self.buildLiveCdFilename + '\"')
            else:
                print _('Error: nautilus-cd-burner is needed for burning iso files... ')

        except Exception, detail:
            errText = _('Error burning ISO: ')
            print errText, detail
            pass

    def burnAltIso(self):
        try:
            if commands.getoutput('which nautilus-cd-burner') != '':
                print _('Burning ISO...')
                os.popen('nautilus-cd-burner --source-iso=\"' + self.buildAltCdFilename + '\"')
            else:
                print _('Error: nautilus-cd-burner is needed for burning iso files... ')

        except Exception, detail:
            errText = _('Error burning ISO: ')
            print errText, detail
            pass

    
    
    
    def detectUsb(self):
	try:
	    os.popen('bash \"' + os.path.join(self.scriptDir, "detect_usb.sh") + '\"')
	except Exception, detail:
            errText = _("Error detecting Usb Key: ")
            print errText, detail
            pass
	fUsbKeyPath = file(os.path.join("/tmp/usb_key"), 'r')
	usbKeyPath = fUsbKeyPath.read(8)
	fUsbKeyPath.close()
	self.wTree.get_widget("entryKeyUsb").set_text(usbKeyPath)
    
    def detectUsb2(self):
	try:
	    os.popen('bash \"' + os.path.join(self.scriptDir, "detect_usb.sh") + '\"')
	except Exception, detail:
            errText = _("Error detecting Usb Key: ")
            print errText, detail
            pass
	fUsbKeyPath = file(os.path.join("/tmp/usb_key"), 'r')
	usbKeyPath = fUsbKeyPath.read(8)
	fUsbKeyPath.close()
	self.wTree.get_widget("entryKeyUsb2").set_text(usbKeyPath)
           
    def calculateIsoSize(self):
        try:
            # reset current size
            self.wTree.get_widget("labelSoftwareIsoSize").set_text("")
            totalSize = None
            remasterSize = 0
            rootSize = 0
            squashSize = 0
            print _('Calculating Live ISO Size...')
            # regex for extracting size
            r = re.compile('(\d+)\s', re.IGNORECASE)
            # get size of remaster dir - use du -s (it's faster)
            remaster = commands.getoutput('echo $(du -s ' + os.path.join(self.customDir, "remaster/") + ') | cut -d\' \' -f1')
           
	    #mRemaster = r.match(remaster)
	    #print "mRemaster" + mRemaster +" \n"
            remasterSize = int(remaster)
            # subtract squashfs root
            if os.path.exists(os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.squashfs")):
                squash = commands.getoutput('echo $(du -s ' + os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.squashfs")+ ') | cut -d\' \' -f1')
              
                squashSize = int(squash)

            remasterSize -= squashSize
            # get size of root dir
            root = commands.getoutput('echo $(du -s ' + os.path.join(self.customDir, "chroot/") + ') | cut -d\' \' -f1')
            
            rootSize = int(root)

            # divide root size to simulate squash compression
            self.wTree.get_widget("labelSoftwareIsoSize").set_text( '~ ' + str(int(round((remasterSize + (rootSize/3.185))/1024))) + ' MB')
            self.setDefaultCursor()
            # set page here - since this is run on a background thread,
            # the next page will show too quickly if set in self.checkPage()
            self.setPage(self.pageLiveCustomize)
        except Exception, detail:
            errText = _("Error calculating estimated iso size: ")
            print errText, detail
            pass

    



    def calculateAltIsoSize(self):
        try:
            # reset current size
            self.wTree.get_widget("labelAltIsoSize").set_text("")
            totalSize = None
            remasterSize = 0
            print _('Calculating Alternate ISO Size...')
            # regex for extracting size
            r = re.compile('(\d+)\s', re.IGNORECASE)
            # get size of remaster dir - use du -s (it's faster)
            remaster = commands.getoutput('du -s ' + os.path.join(self.customDir, self.altRemasterDir))
            mRemaster = r.match(remaster)
            remasterSize = int(mRemaster.group(1))

            self.wTree.get_widget("labelAltIsoSize").set_text( '~ ' + str(int(round(remasterSize/1024))) + ' MB')
            self.setDefaultCursor()
            # set page here - since this is run on a background thread,
            # the next page will show too quickly if set in self.checkPage()
            self.setPage(self.pageAltCustomize)
        except Exception, detail:
            errText = _("Error calculating estimated iso size: ")
            print errText, detail
            pass

    def startInteractiveEdit(self):
        print _('Beginning Interactive Editing...')
        # set interactive edit tag
        self.interactiveEdit = True
        # check for template user home directory; create if necessary
        #print ('useradd -d /home/reconstructor -m -s /bin/bash -p ' + str(os.urandom(8)))
        if os.path.exists('/home/reconstructor') == False:
            # create user with random password
            password = 'r0714'
            os.popen('useradd -d /home/reconstructor -s /bin/bash -p ' + password +' reconstructor')
            # create home dir
            os.popen('mkdir -p /home/reconstructor')
            # change owner of home
            os.popen('chown -R reconstructor /home/reconstructor')
        # launch Xnest in background
        try:
            print _('Starting Xnest in the background...')
            os.popen('Xnest :1 -ac -once & 1>&2 2>/dev/null')
        except Exception, detail:
            errXnest = _("Error starting Xnest: ")
            print errXnest, detail
            return
        # try to start gnome-session with template user
        try:
            print _('Starting Gnome-Session....')
            #os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\" ' + 'su -c \"export DISPLAY=localhost:1 ; gnome-session\" 1>&2 2>/dev/null\"')
            #os.popen("chroot /home/ehazlett/reconstructor/root \"/tmp/test.sh\"")
            os.popen('su reconstructor -c \"export DISPLAY=:1 ; gnome-session\" 1>&2 2>/dev/null')
        except Exception, detail:
            errGnome = _("Error starting Gnome-Session: ")
            print errGnome, detail
            return

    def clearInteractiveSettings(self):
        try:
            print _('Clearing Interactive Settings...')
            print _('Removing \'reconstructor\' user...')
            os.popen('userdel reconstructor')
            print _('Removing \'reconstructor\' home directory...')
            os.popen('rm -Rf /home/reconstructor')
            self.setDefaultCursor()
        except Exception, detail:
            self.setDefaultCursor()
            errText = _('Error clearing interactive settings: ')
            print errText, detail
            pass

    def getGpgKeyInfo(self):
        # show dialog for key info
        keyDlg = gtk.Dialog(title="Installation Key", parent=None, flags=0, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OK, gtk.RESPONSE_OK))
        keyDlg.set_icon_from_file('glade/app.png')
        keyDlg.vbox.set_spacing(10)
        labelSpc = gtk.Label(" ")
        keyDlg.vbox.pack_start(labelSpc)
        labelSpc.show()
        infoText = _("<b>GPG Installation Key Information</b>")
        lblInfo = gtk.Label(infoText)
        lblInfo.set_use_markup(True)
        # email entry
        hboxEmail = gtk.HBox()
        emailText = _("Email:")
        labelEmail = gtk.Label(emailText)
        hboxEmail.pack_start(labelEmail, expand=False, fill=False, padding=5)
        entryEmail = gtk.Entry()
        hboxEmail.pack_start(entryEmail, expand=True, fill=True)
        # password entry
        hboxPassword = gtk.HBox()
        passText = _("Password:")
        labelPassword = gtk.Label(passText)
        hboxPassword.pack_start(labelPassword, expand=False, fill=False, padding=5)
        entryPassword = gtk.Entry()
        entryPassword.set_visibility(False)
        hboxPassword.pack_start(entryPassword, expand=True, fill=True)
        # password confirm entry
        hboxPasswordConfirm = gtk.HBox()
        passConfirmText = _("Confirm:")
        labelPasswordConfirm = gtk.Label(passConfirmText)
        hboxPasswordConfirm.pack_start(labelPasswordConfirm, expand=False, fill=False, padding=11)
        entryPasswordConfirm = gtk.Entry()
        entryPasswordConfirm.set_visibility(False)
        hboxPasswordConfirm.pack_start(entryPasswordConfirm, expand=True, fill=True)

        keyDlg.vbox.pack_start(lblInfo, expand=False, fill=False)
        #keyDlg.vbox.pack_start(labelEmail)
        #keyDlg.vbox.pack_start(entryEmail)
        keyDlg.vbox.pack_start(hboxEmail)
        keyDlg.vbox.pack_start(hboxPassword)
        keyDlg.vbox.pack_start(hboxPasswordConfirm)
        #keyDlg.vbox.pack_start(labelPassword)
        #keyDlg.vbox.pack_start(entryPassword)
        #keyDlg.vbox.pack_start(entryPasswordConfirm)
        lblInfo.show()
        labelEmail.show()
        entryEmail.show()
        hboxEmail.show()
        labelPassword.show()
        entryPassword.show()
        labelPasswordConfirm.show()
        entryPasswordConfirm.show()
        hboxPassword.show()
        hboxPasswordConfirm.show()
        response = keyDlg.run()
        info = None
        if response == gtk.RESPONSE_OK :
            if entryPassword.get_text() == entryPasswordConfirm.get_text():
                info = (entryEmail.get_text(), entryPasswordConfirm.get_text())
            else:
                print _("Passwords do not match...")
        else:
            print _("GPG generation cancelled...")

        keyDlg.destroy()
        return info

    def on_buttonBack_clicked(self, widget):
        # HACK: back pressed so change buttonNext text
        self.wTree.get_widget("buttonNext").set_label("Next")
        # HACK: get_current_page() returns after the click, so check for 1 page ahead
        # check for first step; disable if needed
        if self.wTree.get_widget("notebookWizard").get_current_page() == 1:
            self.wTree.get_widget("buttonBack").hide()
        # check for disc type and move to proper locations
        if self.wTree.get_widget("notebookWizard").get_current_page() == self.pageUsbSetup:
            self.setPage(self.pageInstallType)
        elif self.wTree.get_widget("notebookWizard").get_current_page() == self.pageFinish:
            # on finish page; move to proper disc type build
            if self.installType == "Cd":
                self.setPage(self.pageLiveBuild)
            elif self.discType == "Usb":
                self.setPage(self.pageUsbSetup)
        else:
            self.wTree.get_widget("notebookWizard").prev_page()

    def on_buttonNext_clicked(self, widget):
        page = self.wTree.get_widget("notebookWizard").get_current_page()
        # HACK: show back button
        self.wTree.get_widget("buttonBack").show()
        #if (self.checkPage(page)):
        #    self.wTree.get_widget("notebookWizard").next_page()
        self.checkPage(page)

    def on_buttonBrowseWorkingDir_clicked(self, widget):
        dlgTitle = _('Select Working Directory')
        workingDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_SELECT_FOLDER, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK), backend=None)
        workingDlg.set_uri(os.environ['HOME'] + '/reconstructor')
        response = workingDlg.run()
        if response == gtk.RESPONSE_OK :
            filename = workingDlg.get_current_folder()
            self.wTree.get_widget("entryWorkingDir").set_text(workingDlg.get_filename())
            workingDlg.hide()
        elif response == gtk.RESPONSE_CANCEL :
            workingDlg.destroy()
    
    def on_buttonBrowseWorkingDir_clicked2(self, widget):
        dlgTitle = _('Select Working Directory')
        workingDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_SELECT_FOLDER, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK), backend=None)
        workingDlg.set_uri(os.environ['HOME'] + '/reconstructor')
        response = workingDlg.run()
        if response == gtk.RESPONSE_OK :
            filename = workingDlg.get_current_folder()
            self.wTree.get_widget("entryWorkingDir2").set_text(workingDlg.get_filename())
            workingDlg.hide()
        elif response == gtk.RESPONSE_CANCEL :
            workingDlg.destroy()
    def on_buttonBrowseIsoFilename_clicked(self, widget):
        # filter only iso files
        isoFilter = gtk.FileFilter()
        isoFilter.set_name("ISO Files (.iso)")
        isoFilter.add_pattern("*.iso")
        # create dialog
        dlgTitle = _('Select Live CD ISO')
        isoDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_OPEN, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK), backend=None)
        isoDlg.add_filter(isoFilter)
        isoDlg.set_current_folder(os.environ['HOME'])
        response = isoDlg.run()
        if response == gtk.RESPONSE_OK :
            self.wTree.get_widget("entryIsoFilename").set_text(isoDlg.get_filename())
            isoDlg.hide()
        elif response == gtk.RESPONSE_CANCEL :
            isoDlg.destroy()
    def on_buttonBrowseIsoFilename_clicked2(self, widget):
        # filter only iso files
        isoFilter = gtk.FileFilter()
        isoFilter.set_name("ISO Files (.iso)")
        isoFilter.add_pattern("*.iso")
        # create dialog
        dlgTitle = _('Select Live CD ISO')
        isoDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_OPEN, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK), backend=None)
        isoDlg.add_filter(isoFilter)
        isoDlg.set_current_folder(os.environ['HOME'])
        response = isoDlg.run()
        if response == gtk.RESPONSE_OK :
            self.wTree.get_widget("entryIsoFilename2").set_text(isoDlg.get_filename())
            isoDlg.hide()
        elif response == gtk.RESPONSE_CANCEL :
            isoDlg.destroy()

    def on_buttonBrowseLiveCdFilename_clicked(self, widget):
        # filter only iso files
        isoFilter = gtk.FileFilter()
        isoFilter.set_name("ISO Files")
        isoFilter.add_pattern("*.iso")
        # create dialog
        dlgTitle = _('Select Live CD Filename')
        isoDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_SAVE, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_SAVE, gtk.RESPONSE_OK), backend=None)
        isoDlg.add_filter(isoFilter)
        isoDlg.set_select_multiple(False)
        isoDlg.set_current_folder(os.environ['HOME'])
        response = isoDlg.run()
        if response == gtk.RESPONSE_OK :
            self.wTree.get_widget("entryLiveIsoFilename").set_text(isoDlg.get_filename())
            isoDlg.hide()
        elif response == gtk.RESPONSE_CANCEL :
            isoDlg.destroy()

    def on_buttonBrowseAltCdFilename_clicked(self, widget):
        # filter only iso files
        isoFilter = gtk.FileFilter()
        isoFilter.set_name("ISO Files")
        isoFilter.add_pattern("*.iso")
        # create dialog
        dlgTitle = _('Select Alternate CD Filename')
        isoDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_SAVE, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_SAVE, gtk.RESPONSE_OK), backend=None)
        isoDlg.add_filter(isoFilter)
        isoDlg.set_select_multiple(False)
        isoDlg.set_current_folder(os.environ['HOME'])
        response = isoDlg.run()
        if response == gtk.RESPONSE_OK :
            self.wTree.get_widget("entryAltBuildIsoFilename").set_text(isoDlg.get_filename())
            isoDlg.hide()
        elif response == gtk.RESPONSE_CANCEL :
            isoDlg.destroy()

    def on_checkbuttonBuildIso_toggled(self, widget):
        if self.wTree.get_widget("checkbuttonBuildIso").get_active() == True:
            # show filename, description, etc. entry
            self.wTree.get_widget("tableLiveCd").show()
        else:
            # hide filename entry
            self.wTree.get_widget("tableLiveCd").hide()

   

  
 
 
    def on_buttonSoftwareApply_clicked(self, widget):
        # customize distro
        warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_OK, gtk.RESPONSE_OK))
        warnDlg.set_icon_from_file(self.iconFile)
        warnDlg.vbox.set_spacing(10)
        labelSpc = gtk.Label(" ")
        warnDlg.vbox.pack_start(labelSpc)
        labelSpc.show()
        lblContinueText = _("  <b>Continue?</b>  ")
        lblContinueInfo = _("     This may take a few minutes.  Please wait...     ")
        label = gtk.Label(lblContinueText)
        lblInfo = gtk.Label(lblContinueInfo)
        label.set_use_markup(True)
        warnDlg.vbox.pack_start(label)
        warnDlg.vbox.pack_start(lblInfo)
        lblInfo.show()
        label.show()
        #warnDlg.show()
        response = warnDlg.run()
        if response == gtk.RESPONSE_OK:
            warnDlg.destroy()
            self.setBusyCursor()
            self.user = 'ubuntu'
            # check user entered password first, so user doesn't have to wait
            if self.checkUserPassword() == True : 
		if self.wTree.get_widget("entryLiveCdUsername").get_text() == '' or self.checkUserName() == True:
		    # set user info
		    self.user = self.wTree.get_widget("entryLiveCdUsername").get_text()
		    self.userFull = self.wTree.get_widget("entryLiveCdUserFullname").get_text()
		    self.password = self.wTree.get_widget("entryLiveCdUserPassword").get_text()
		    self.host = self.wTree.get_widget("entryLiveCdHostname").get_text()
		    if self.casperPath == 'casper' and self.debDist != 'etch':
			self.debMirror= self.wTree.get_widget("comboboxUbuntuMirrors").get_active_text() 
		    else:
			self.debMirror= self.wTree.get_widget("comboboxDebianLiveMirrors1").get_active_text()
		    	self.keyLang = self.wTree.get_widget("comboboxLiveCDKeybLang1").get_active_text()
		    # set live cd info
		    self.checkbuttonDisableAutologin = self.wTree.get_widget("checkbuttonDisableAutologin").get_active()
		    self.setLiveCdInfo(username=self.user, userFullname=self.userFull, userPassword=self.password, hostname=self.host)
	 	    self.ciwsOsType = self.wTree.get_widget("comboboxCiwsOs").get_active_text() 
		else:
		    print _('Username do not match.')
		    # show warning dlg
		    warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_OK, gtk.RESPONSE_OK))
		    warnDlg.set_icon_from_file(self.iconFile)
		    warnDlg.vbox.set_spacing(10)
		    labelSpc = gtk.Label(" ")
		    warnDlg.vbox.pack_start(labelSpc)
		    labelSpc.show()
		    lblBuildText = _("  Either username count less than 6 characters, either username count a forbidden character [0-9a-z_-*.]")
		    lblBuildInfo = _("     Please make sure passwords or Username match and try again...     ")
		    label = gtk.Label(lblBuildText)
		    lblInfo = gtk.Label(lblBuildInfo)
		    label.set_use_markup(True)
		    warnDlg.vbox.pack_start(label)
		    warnDlg.vbox.pack_start(lblInfo)
		    lblInfo.show()
		    label.show()
		    response = warnDlg.run()
		    # destroy dialog no matter what...
		    if response == gtk.RESPONSE_OK:
		        warnDlg.destroy()
		    else:
		        warnDlg.destroy()
		    # show live cd customization page
		    self.wTree.get_widget("notebookCustomize").set_current_page(-1)
		    # return - don't continue until error fixed
		    return 
            else:
                print _('User passwords do not match.')
                # show warning dlg
                warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_OK, gtk.RESPONSE_OK))
                warnDlg.set_icon_from_file(self.iconFile)
                warnDlg.vbox.set_spacing(10)
                labelSpc = gtk.Label(" ")
                warnDlg.vbox.pack_start(labelSpc)
                labelSpc.show()
                lblBuildText = _("  Either Passwords do not match,  ")
                lblBuildInfo = _("     Please make sure passwords or Username match and try again...     ")
                label = gtk.Label(lblBuildText)
                lblInfo = gtk.Label(lblBuildInfo)
                label.set_use_markup(True)
            	warnDlg.vbox.pack_start(label)
            	warnDlg.vbox.pack_start(lblInfo)
            	lblInfo.show()
            	label.show()
            	response = warnDlg.run()
            	# destroy dialog no matter what...
            	if response == gtk.RESPONSE_OK:
                	warnDlg.destroy()
            	else:
                	warnDlg.destroy()
            	# show live cd customization page
            	self.wTree.get_widget("notebookCustomize").set_current_page(-1)
            	# return - don't continue until error fixed
            	return
            self.treeModel.foreach(self.copyExecuteModule)
	    self.comboboxCiwsArtwork = self.wTree.get_widget("comboboxCiwsArtwork").get_active_text()
	    self.comboboxCiwsCms = self.wTree.get_widget("comboboxCiwsCms").get_active_text()
	    self.checkbuttonAufs = self.wTree.get_widget("checkbuttonAufs").get_active()
	    self.comboboxWebAppMirrors = self.wTree.get_widget("comboboxWebAppMirrors").get_active_text()
	    self.checkbuttonLocalMirror = self.wTree.get_widget("checkbuttonLocalMirror").get_active()
	    self.entryLocalMirror = self.wTree.get_widget("entryLocalMirror").get_text()
	    self.radiobuttonDefaultInstall = self.wTree.get_widget("radiobuttonDefaultInstall").get_active()

	    gobject.idle_add(self.customize)
            gobject.idle_add(self.calculateIsoSize)
        else:
            warnDlg.destroy()

    def on_buttonSoftwareCalculateIsoSize_clicked(self, widget):
        self.setBusyCursor()
        gobject.idle_add(self.calculateIsoSize)
    
    def on_buttonSoftwareDetectUsb_clicked(self, widget):
        self.setBusyCursor()
        gobject.idle_add(self.detectUsb)
	self.setDefaultCursor()

    def on_buttonSoftwareDetectUsb_clicked2(self, widget):
        self.setBusyCursor()
        gobject.idle_add(self.detectUsb2)
	self.setDefaultCursor()

   
    def on_buttonInteractiveEditLaunch_clicked(self, widget):
        self.startInteractiveEdit()

    def on_buttonInteractiveClear_clicked(self, widget):
        warnDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_NO, gtk.RESPONSE_CANCEL, gtk.STOCK_OK, gtk.RESPONSE_OK))
        warnDlg.set_icon_from_file(self.iconFile)
        warnDlg.vbox.set_spacing(10)
        labelSpc = gtk.Label(" ")
        warnDlg.vbox.pack_start(labelSpc)
        labelSpc.show()
        lblContinueText = _("  <b>Delete?</b>  ")
        label = gtk.Label(lblContinueText)
        label.set_use_markup(True)
        warnDlg.vbox.pack_start(label)
        label.show()
        #warnDlg.show()
        response = warnDlg.run()
        if response == gtk.RESPONSE_OK:
            warnDlg.destroy()
            self.setBusyCursor()
            # clear settings
            gobject.idle_add(self.clearInteractiveSettings)
        else:
            warnDlg.destroy()

    def on_buttonUsplashGenerate_clicked(self,widget):
	pngFile = None
	outputFile = None
	# filter only iso files
	soFilter = gtk.FileFilter()
	soFilter.set_name("Usplash Library Files")
	soFilter.add_pattern("*.so")
	# create dialog
	dlgTitle = _('Save Usplash As...')
	soDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_SAVE, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_SAVE, gtk.RESPONSE_OK), backend=None)
	soDlg.add_filter(soFilter)
	soDlg.set_select_multiple(False)
	soDlg.set_current_folder(os.environ['HOME'])
	response = soDlg.run()
	if response == gtk.RESPONSE_OK :
		outputFile = soDlg.get_filename()
		soDlg.destroy()
	elif response == gtk.RESPONSE_CANCEL :
		soDlg.destroy()

	if pngFile != None and outputFile != None:
		# generate .so
		self.generateUsplash(pngFile, outputFile)
		# check for file and assign .so splash image field
		if os.path.exists(outputFile):
			self.wTree.get_widget("entryUsplashFilename").set_text(outputFile)

    
    def on_checkbuttonOptimizationStartupEnable_toggled(self, widget):
        if self.wTree.get_widget("checkbuttonOptimizationStartupEnable").get_active() == True:
            self.wTree.get_widget("labelOptimizationStartupInfo").show()
            self.wTree.get_widget("tableOptimizationStartup").show()
        else:
            self.wTree.get_widget("labelOptimizationStartupInfo").hide()
            self.wTree.get_widget("tableOptimizationStartup").hide()

    def on_buttonCustomizeLaunchTerminal_clicked(self, widget):
        self.launchTerminal()

    def on_buttonCustomizeLaunchPostInstall_clicked(self, widget):
        self.launchPostInstall()

    def on_buttonCustomizeLaunchFirefox_clicked(self, widget):
        os.popen('firefox http://localhost')

    def on_buttonBurnIso_clicked(self, widget):
        # check for disc type
        if self.discType == 'live':
            self.burnIso()
        elif self.discType == 'alt':
            self.burnAltIso()
        else:
            print _("Error: Cannot burn iso... Unknown disc type...")

  
    def on_buttonModulesAddModule_clicked(self, widget):
        # filter only tar.gz files
        dlgFilter = gtk.FileFilter()
        dlgFilter.set_name("Modules (.rmod)")
        dlgFilter.add_pattern("*.rmod")
        # create dialog
        dlgTitle = _('Select Reconstructor Module')
        dlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_OPEN, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK), backend=None)
        dlg.add_filter(dlgFilter)
        dlg.set_select_multiple(False)
        response = dlg.run()
        if response == gtk.RESPONSE_OK :
            self.addModule(dlg.get_filename())
            dlg.destroy()
        elif response == gtk.RESPONSE_CANCEL :
            print _("Module installation cancelled...")
            dlg.destroy()

    def on_buttonModulesViewModule_clicked(self, widget, treeview):
        self.showModuleSource(treeview)

    def on_buttonModulesUpdateModule_clicked(self, widget, treeview):
        selection = treeview.get_selection()
        model, iter = selection.get_selected()
        modName = ''
        modVersion = ''
        modPath = None
        modUpdateUrl = ''
        if iter:
            path = model.get_path(iter)
            modName = model.get_value(iter, self.moduleColumnName)
            modVersion = model.get_value(iter, self.moduleColumnVersion)
            modPath = model.get_value(iter, self.moduleColumnPath)
            modUpdateUrl = model.get_value(iter, self.moduleColumnUpdateUrl)
        # check for valid module and update
        if modPath != None:
            self.setBusyCursor()
            gobject.idle_add(self.updateModule, modName, modVersion, modPath, modUpdateUrl, treeview)

   
    def on_buttonBrowseDebianLiveDir_clicked(self, widget):
        dlgTitle = _('Select Working Directory')
        workingDlg = gtk.FileChooserDialog(title=dlgTitle, parent=self.wTree.get_widget("windowMain"), action=gtk.FILE_CHOOSER_ACTION_SELECT_FOLDER, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OPEN, gtk.RESPONSE_OK), backend=None)
        workingDlg.set_uri(os.environ['HOME'] + '/reconstructor')
        response = workingDlg.run()
        if response == gtk.RESPONSE_OK :
            filename = workingDlg.get_current_folder()
            self.wTree.get_widget("entryDebianLiveWorkingDir").set_text(workingDlg.get_filename())
            workingDlg.hide()
        elif response == gtk.RESPONSE_CANCEL :
            workingDlg.destroy()


 

   
    def saveSetupInfo(self):
        # do setup - check and create dirs as needed
        print _("INFO: Saving working directory information...")
	if self.commandLine == False: 
		self.customDir = self.wTree.get_widget("entryWorkingDir2").get_text()
		self.createRemasterDir = self.wTree.get_widget("checkbuttonCreateRemaster").get_active()
		self.createCustomRoot = self.wTree.get_widget("checkbuttonCreateRoot").get_active()
		self.createInitrdRoot = self.wTree.get_widget("checkbuttonCreateInitRd").get_active()
		self.isoFilename = self.wTree.get_widget("entryIsoFilename2").get_text()
		
	# debug
        print "Custom Directory: " + str(self.customDir)
        print "Create Remaster Directory: " + str(self.createRemasterDir)
        print "Create Custom Root: " + str(self.createCustomRoot)
        print "Create Initrd Root: " + str(self.createInitrdRoot)
        print "ISO Filename: " + str(self.isoFilename)
    
    def saveDebianLiveSetupInfo(self):
        # do setup - check and create dirs as needed
        print _("INFO: Saving working directory information...")
        self.customDir = self.wTree.get_widget("entryDebianLiveWorkingDir").get_text()
	self.DebianLiveType = self.wTree.get_widget("comboboxDebianLiveType").get_active_text()         
	self.DebianLiveReleaseType = self.wTree.get_widget("comboboxDebianLiveReleaseType").get_active_text()         

	# debug
        print "Custom Directory: " + str(self.customDir)
        print "DebianLiveType: " + str(self.DebianLiveType)
       



    def saveAltSetupInfo(self):
        # do setup - check and create dirs as needed
        print _("INFO: Saving working directory information...")
        self.customDir = self.wTree.get_widget("entryAltWorkingDir").get_text()
        self.createAltRemasterDir = self.wTree.get_widget("checkbuttonAltCreateRemasterDir").get_active()
        self.createAltInitrdRoot = self.wTree.get_widget("checkbuttonAltCreateInitrdDir").get_active()
        self.isoFilename = self.wTree.get_widget("entryAltIsoFilename").get_text()
        # debug
        print "Custom Directory: " + str(self.customDir)
        print "Create Remaster Directory: " + str(self.createAltRemasterDir)
        print "Create Initrd Root: " + str(self.createAltInitrdRoot)
        print "ISO Filename: " + str(self.isoFilename)

    def checkLiveCdVersion(self):
		
	    if os.path.exists(os.path.join(self.customDir, "remaster/boot/grub")) and commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/boot/grub/menu.lst") + '| grep \'Webconverger\'') != '':
		self.casperPath = 'live'
		self.wTree.get_widget("hbox701").hide()
		self.wTree.get_widget("hbox301").show()
		self.wTree.get_widget("hbox702").show()
		self.wTree.get_widget("labelLiveCDKeybLang3").show()	    	
		self.debDist= 'lenny'
		self.distVariant = 'webconverger'	
		print "Webconverger Live CD"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + ' | grep \'Elyssa\'') != '':
		self.casperPath = 'casper'
		self.debDist = 'hardy'
		self.distVariant = 'mint'			
		self.wTree.get_widget("hbox701").hide()
		self.wTree.get_widget("hbox301").show()
		self.wTree.get_widget("hbox702").show()
		self.wTree.get_widget("labelLiveCDKeybLang3").show()
		print "Linux Mint 5 Elyssa"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + ' | grep \'nUbuntu\'') != '' and commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.04\'') != '':
		self.casperPath = 'casper'
		self.debDist = 'hardy'
		self.distVariant = 'nUbuntu'			
		self.wTree.get_widget("hbox701").hide()
		self.wTree.get_widget("hbox301").show()
		self.wTree.get_widget("hbox702").show()
		self.wTree.get_widget("labelLiveCDKeybLang3").show()
		print "nUbuntu 8.04"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'etch\'') != '':
		self.casperPath = 'casper'
		self.debDist= 'etch'
		self.distVariant = 'etch'			
		self.wTree.get_widget("hbox701").hide()
		self.wTree.get_widget("hbox301").show()
		self.wTree.get_widget("hbox702").show()
		self.wTree.get_widget("labelLiveCDKeybLang3").show()
		print "Debian Etch Live CD"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.04\'') != '' or commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'hardy\'') != '':
		self.casperPath = 'casper'	
		self.wTree.get_widget("hbox301").hide()
		self.wTree.get_widget("hbox701").show()
		self.wTree.get_widget("hbox702").hide()
		self.wTree.get_widget("labelLiveCDKeybLang3").hide()
		self.debDist= 'hardy'
		self.distVariant = 'hardy'		
		print "Ubuntu 8.04 Live CD"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.10\'') != '':
		self.casperPath = 'casper'	
		self.wTree.get_widget("hbox301").hide()
		self.wTree.get_widget("hbox701").show()
		self.wTree.get_widget("hbox702").hide()
		self.wTree.get_widget("labelLiveCDKeybLang3").hide()
		self.debDist= 'intrepid'
		self.distVariant = 'intrepid'		
		print "Ubuntu 8.10 Live CD"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'lenny\'') != '':
		self.casperPath = 'live'
		self.wTree.get_widget("hbox701").hide()
		self.wTree.get_widget("hbox301").show()
		self.wTree.get_widget("hbox702").show()
		self.wTree.get_widget("labelLiveCDKeybLang3").show()	    	
		self.debDist= 'lenny'
		self.distVariant = 'lenny'	
		print "Debian Lenny Live CD"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'sid\'') != '':	    	
		self.debDist= 'sid'			
		self.casperPath = 'live'
		self.distVariant = 'sid'
		self.wTree.get_widget("hbox701").hide()
		self.wTree.get_widget("hbox301").show()
		self.wTree.get_widget("hbox702").show()
		self.wTree.get_widget("labelLiveCDKeybLang3").show()	    	
		print "Debian Lenny Live CD"	
	    else:
		print "Live CD not detected, Aborting"


# ---------- Setup ---------- #
    def setupWorkingDirectory(self):
        print _("INFO: Setting up working directory...")
	if not os.path.exists(os.path.join(self.customDir, "scripts")):
		os.makedirs(os.path.join(self.customDir, "scripts"))        
	#create shutdown_ws script
	self.createShutdownScript()	
	# remaster dir
        if self.createRemasterDir == True:
            # check for existing directories and remove if necessary
            #if os.path.exists(os.path.join(self.customDir, "remaster")):
            #    print _("INFO: Removing existing Remaster directory...")
            #    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/") + '\"')
            if os.path.exists(os.path.join(self.customDir, "remaster")) == False:
                print "INFO: Creating Remaster directory..."
                os.makedirs(os.path.join(self.customDir, "remaster"))
            
	    # check for iso
            if self.isoFilename == "" :
		if self.commandLine == False:
		        mntDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OK, gtk.RESPONSE_OK))
		        mntDlg.set_icon_from_file(self.iconFile)
		        mntDlg.vbox.set_spacing(10)
		        labelSpc = gtk.Label(" ")
		        mntDlg.vbox.pack_start(labelSpc)
		        labelSpc.show()
		        lblText = _("  <b>Please insert Ubuntu Live CD and click OK</b>  ")
		        label = gtk.Label(lblText)
		        label.set_use_markup(True)
		        mntDlg.vbox.pack_start(label)
		        label.show()
		        #warnDlg.show()
		        response = mntDlg.run()
		        if response == gtk.RESPONSE_OK:
		            print _("Using Live CD for remastering...")
		            mntDlg.destroy()
		            os.popen("mount " + self.mountDir)
		        else:
		            mntDlg.destroy()
		            self.setDefaultCursor()
		            return
		else:
			print _("Please choose an iso file")
			exit(0)
            else:
                print _("Using ISO for remastering...")
                os.popen('mount -o loop \"' + self.isoFilename + '\" ' + self.mountDir)

            print _("Copying files...")

            # copy remaster files
            os.popen('rsync -at --del ' + self.mountDir + '/ \"' + os.path.join(self.customDir, "remaster") + '\"')
            print _("Finished copying files...")
	    
	    
	
			
            # unmount iso/cd-rom
            os.popen("umount " + self.mountDir)
	
	    #Identify Live CD
	    self.checkLiveCdVersion()
	
        # custom root dir
        if self.createCustomRoot == True:
            #if os.path.exists(os.path.join(self.customDir, "root")):
            #    print _("INFO: Removing existing Custom Root directory...")

            #    os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/") + '\"')
            if os.path.exists(os.path.join(self.customDir, "chroot")) == False:
                print _("INFO: Creating Custom Root directory...")
                os.makedirs(os.path.join(self.customDir, "chroot"))
            # check for existing directories and remove if necessary
            if os.path.exists(os.path.join(self.customDir, "tmpsquash")):
                print _("INFO: Removing existing tmpsquash directory...")

                os.popen('rm -Rf \"' + os.path.join(self.customDir, "tmpsquash") + '\"')

            # extract squashfs into custom root
            # check for iso
            if self.isoFilename == "" and self.commandLine == False:
                mntDlg = gtk.Dialog(title=self.appName, parent=None, flags=0, buttons=(gtk.STOCK_CANCEL, gtk.RESPONSE_CANCEL, gtk.STOCK_OK, gtk.RESPONSE_OK))
                mntDlg.set_icon_from_file(self.iconFile)
                mntDlg.vbox.set_spacing(10)
                labelSpc = gtk.Label(" ")
                mntDlg.vbox.pack_start(labelSpc)
                labelSpc.show()
                lblText = _("  <b>Please insert Ubuntu Live CD and click OK</b>  ")
                label = gtk.Label(lblText)
                label.set_use_markup(True)
                mntDlg.vbox.pack_start(label)
                label.show()
                response = mntDlg.run()
                if response == gtk.RESPONSE_OK:
                    print _("Using Live CD for squashfs root...")
                    mntDlg.destroy()
                    os.popen("mount " + self.mountDir)
                else:
                    mntDlg.destroy()
                    self.setDefaultCursor()
                    return
            else:
                print _("Using ISO for squashfs root...")
                os.popen('mount -o loop \"' + self.isoFilename + '\" ' + self.mountDir)

            # copy remaster files
            os.mkdir(os.path.join(self.customDir, "tmpsquash"))
            # mount squashfs root
            print _("Mounting squashfs...")
            os.popen('mount -t squashfs -o loop ' + self.mountDir + '/' + self.casperPath + '/filesystem.squashfs \"' + os.path.join(self.customDir, "tmpsquash") + '\"')
            print _("Extracting squashfs root...")

            # copy squashfs root
            os.popen('rsync -at --del \"' + os.path.join(self.customDir, "tmpsquash") + '\"/ \"' + os.path.join(self.customDir, "chroot/") + '\"')

            # umount tmpsquashfs
            print _("Unmounting tmpsquash...")
            os.popen('umount --force \"' + os.path.join(self.customDir, "tmpsquash") + '\"')
            # umount cdrom
            print _("Unmounting cdrom...")
            os.popen("umount --force " + self.mountDir)
            # remove tmpsquash
            print _("Removing tmpsquash...")
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "tmpsquash") + '\"')
            # set proper permissions - MUST DO WITH UBUNTU
            print _("Setting proper permissions...")
            os.popen('chmod 6755 \"' + os.path.join(self.customDir, "chroot/usr/bin/sudo") + '\"')
            os.popen('chmod 0440 \"' + os.path.join(self.customDir, "chroot/etc/sudoers") + '\"')
            print _("Finished extracting squashfs root...")
        

        # get ubuntu version
        #self.loadCdVersion()
        # get current boot options menu text color
        #self.loadBootMenuColor()
        # get current gdm background color
        #self.loadGdmBackgroundColor()
        # load comboboxes for customization
        #self.loadGdmThemes()
        #self.loadGnomeThemes()
        #self.hideWorking()
	if self.commandLine == False:        
		self.setDefaultCursor()
		self.setPage(self.pageLiveCustomize)
	
	      
	print _("Finished setting up working directory...")
        print " "
        return False

    def setupUsbWorkingDirectory(self):
        print _("INFO: Setting up Usb working directory...")
        # remaster dir
        # check for existing directories and remove if necessary
        #if os.path.exists(os.path.join(self.customDir, "remaster")):
        #    print _("INFO: Removing existing Remaster directory...")
        #    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/") + '\"')
        if os.path.exists(os.path.join(self.customDir, "remaster")) == False:
            print "INFO: Creating Remaster directory..."
            os.makedirs(os.path.join(self.customDir, "remaster"))
           
        
        print _("Using ISO for remastering...")
        os.popen('mount -o loop \"' + self.isoFilename + '\" ' + os.path.join(self.customDir, "remaster"))

    def setupDebianLive(self):
	self.debMirror = self.wTree.get_widget("comboboxDebianLiveMirrors").get_active_text() 
	self.keybLang = self.wTree.get_widget("comboboxLiveCDKeybLang").get_active_text()
	lhConfig = "lh_config "
	if re.search('Smallest',self.DebianLiveType): 
		lhConfig += "--bootstrap-flavour minimal "
	elif re.search('Minimal Xfce',self.DebianLiveType):
		lhConfig += "-p xfce "
	elif re.search('Minimal Gnome',self.DebianLiveType):
		lhConfig += "-p gnome "
	elif re.search('Minimal Kde',self.DebianLiveType):
		lhConfig += "-p kde "
	elif re.search('Full Xfce',self.DebianLiveType):
		lhConfig += "-p xfce-desktop "
	elif re.search('Full Gnome',self.DebianLiveType):
		lhConfig += "-p gnome-desktop "
	elif re.search('Full Kde',self.DebianLiveType):
		lhConfig += "-p kde-desktop "
	
    	lhConfig += '--distribution ' + self.DebianLiveReleaseType + ' --linux-flavours \"686\" --mirror-bootstrap \"' + self.debMirror + '\" --mirror-chroot \"' + self.debMirror + '\" --mirror-binary \"' + self.debMirror + '\" --apt-options \"--yes  --force-yes\" --bootappend-live \"keyb=' + keybLang + '\" '
	
	scriptDebianLive = 'echo "I: Creating Debian Live CD Linux flavour ' + self.DebianLiveType + ' ' + self.DebianLiveReleaseType + ' + " \n'
	scriptDebianLive += 'echo "' + lhConfig + '"\n'
	scriptDebianLive += 'echo "deb http://live.debian.net/debian/ ./" >> /etc/apt/sources.list\n'
	scriptDebianLive += 'apt-get update\n'
	scriptDebianLive += 'apt-get remove -y --force-yes live-helper\n'
	scriptDebianLive += 'apt-get install -y --force-yes live-helper cdebootstrap debian-keyring \n'
	scriptDebianLive += 'cd ' +self.customDir + '\n'
	scriptDebianLive += lhConfig + '\n'
	#scriptDebianLive += 'lh_bootstrap && lh_chroot\n'
	scriptDebianLive += 'lh_build\n'
	scriptDebianLive += 'mv binary remaster \n'
	scriptDebianLive += 'mv binary.iso debian_lenny_barebone.iso\n'
	fscriptCustomExec=open(os.path.join(self.customDir, "scriptDebianLive.sh"), 'w')
        fscriptCustomExec.write(scriptDebianLive)
        fscriptCustomExec.close()
        
	os.popen('gnome-terminal --hide-menubar -t \"Cooperation-iws Terminal\" -e \"bash ' + os.path.join(self.customDir, "scriptDebianLive.sh")+ '\"')
	self.casperPath = 'live'
	if commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'etch\'') != '':	    	
			self.debDist= 'etch'	
	if commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'lenny\'') != '':	    	
			self.debDist= 'lenny'			
	if commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'sid\'') != '':	    	
			self.debDist= 'sid'	
	fcasper=open(os.path.join(self.customDir, "chroot/tmp/casper_path"), 'w')
	fcasper.write(self.casperPath)
	fcasper.close()
	fdebDist=open(os.path.join(self.customDir, "chroot/tmp/deb_dist"), 'w')
	fdebDist.write(self.debDist)
	fdebDist.close()  
	
# ---------- Customize Live ---------- #
    def customize(self):
        print _("INFO: Customizing...")
            
	#Set Global variable for chroot
	fWorkDir=open(os.path.join(self.customDir, "chroot/tmp/user"), 'w')
        fWorkDir.write(self.user)
       	fWorkDir.close()
        fcasper=open(os.path.join(self.customDir, "chroot/tmp/casper_path"), 'w')
	fcasper.write(self.casperPath)
	fcasper.close()  
	fcasper=open("/tmp/casper_path", 'w')
	fcasper.write(self.casperPath)
	fcasper.close()
	fdebDist=open(os.path.join(self.customDir, "chroot/tmp/deb_dist"), 'w')
	fdebDist.write(self.debDist)
	fdebDist.close()  
	fDebMirror=open(os.path.join(self.customDir, "chroot/tmp/deb_mirror_path"), 'w')
	fDebMirror.write(self.debMirror)
	fDebMirror.close()
	fciwsOsType=open(os.path.join(self.customDir, "chroot/tmp/os_type"), 'w')
	fciwsOsType.write(self.ciwsOsType)
	fciwsOsType.close()
	
	
	
	if self.comboboxCiwsArtwork == "ciwsGnome":
		self.artwork = "ciws_gnome"
		
	elif self.comboboxCiwsArtwork == "eLearning":
		self.artwork = "eLearning"
		
	else:
		self.artwork = ""
		
	if self.comboboxCiwsCms == "Wordpress":
		self.cms = "Wordpress"
	else:
		self.cms = "Joomla"

  	if self.checkbuttonAufs == True:
		os.popen('sed -i "s/splash/splash union=aufs/g" ' + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg")) 
	if self.casperPath == 'live':
		os.popen('sed -i "s/initrd=\/'+self.casperPath+'\/initrd.gz/initrd=\/'+self.casperPath+'\/initrd.gz keyb='+self.keyLang+'/g" ' + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg")) 
	
	#XNEST
	scriptCustomExec = '#!/bin/sh\n\n'
	if self.reqXnest == True: 
		scriptCustomExec += 'bash \"' + self.scriptDir + 'xnest.sh\"' + ' ;\n'
	scriptCustomExec += 'cp -r ' + self.scriptDir + 'init_Lampp.sh' + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'init.sh' + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'end_Lampp.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'shutdown_ws.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
	scriptCustomExec += 'mkdir ' +  os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + os.path.join(self.ciwsRootDir, "cooperation-wui/" + self.cms ) + '/* ' +  os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + '/. ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'cooperation-iws-wui.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'chmod -R 777 ' + os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' ;\n'
 	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/init.sh")   + ' ;\n'
 	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/init_Lampp.sh")   + ' ;\n'
 	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/end_Lampp.sh")   + ' ;\n'
	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/shutdown_ws.sh")   + ' ;\n'
	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/cooperation-iws-wui.sh")   + ' ;\n'
	if self.artwork != "":
			scriptCustomExec += 'cp -r ' + os.path.join(self.ciwsRootDir, "artwork/" + self.artwork+".artchroot") + ' ' +  os.path.join(self.customDir, "chroot/tmp/artwork.amod")   + ' ;\n'
 			scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/artwork.amod")   + ' ;\n'
 			scriptCustomExec += 'cp -r ' + os.path.join(self.ciwsRootDir, "artwork/" + self.artwork) + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 			
	fscriptCustomExec=open(os.path.join(self.customDir, "scriptExec.sh"), 'w')
        fscriptCustomExec.write(scriptCustomExec)
        fscriptCustomExec.close()
        os.popen('chmod a+x ' + os.path.join(self.customDir, "scriptExec.sh"))
        os.popen('bash \"' + os.path.join(self.customDir, "scriptExec.sh") + '\" > /dev/null 2>&1')
	    
	#Share Working directory
	fWorkDir=open('/tmp/working-directory', 'w')
        fWorkDir.write(self.customDir)
        fWorkDir.close()
	#Share Script Root dir	
	fWorkDir=open('/tmp/ciws-root-directory', 'w')
        fWorkDir.write(self.ciwsRootDir)
        fWorkDir.close()

	#Mirrors
	if self.comboboxWebAppMirrors == "Free.fr":
	    mirrorWebApp = "B"
	    mirrorUrl = self.mirrorFree
	elif self.comboboxWebAppMirrors == "Berlios1.de":
 	    mirrorWebApp = "B"
	    mirrorUrl = self.mirrorBerlios1
	elif self.comboboxWebAppMirrors == "Berlios2.de":
 	    mirrorWebApp = "B"
	    mirrorUrl = self.mirrorBerlios2
	elif self.comboboxWebAppMirrors == "Web":
 	    mirrorWebApp = "A"
	    mirrorUrl = self.mirrorFree
	elif self.checkbuttonLocalMirror == True:
	    mirrorWebApp = "B"
	    mirrorUrl = self.entryLocalMirror
	fMirrorWebApp=open(os.path.join(self.customDir, "chroot/tmp/mirroir"), 'w')
        fMirrorWebApp.write(mirrorWebApp)
        fMirrorWebApp.close() 
	fMirrorUrl=open(os.path.join(self.customDir, "chroot/tmp/url_mirroir"), 'w')
        fMirrorUrl.write(mirrorUrl)
        fMirrorUrl.close() 
	
	fMirrorWebApp=open("/tmp/mirroir", 'w')
        fMirrorWebApp.write(mirrorWebApp)
        fMirrorWebApp.close() 
	fMirrorUrl=open("/tmp/url_mirroir", 'w')
        fMirrorUrl.write(mirrorUrl)
        fMirrorUrl.close() 

	#Default Install of Web Apps
	if self.radiobuttonDefaultInstall == True:
	    defaultInstall = "A"
	else:
	    defaultInstall = "B"
	fDefaultInstallWebApp=open(os.path.join(self.customDir, "chroot/tmp/def_install"), 'w')
        fDefaultInstallWebApp.write(defaultInstall)
        fDefaultInstallWebApp.close() 
	fDefaultInstallWebApp=open("/tmp/def_install", 'w')
        fDefaultInstallWebApp.write(defaultInstall)
        fDefaultInstallWebApp.close() 
	
	
        # run modules
        # HACK: check for run on boot scripts and clear previous if new ones selected
	if self.commandLine == False:         
		self.execModulesEnabled = False;
	        self.treeModel.foreach(self.checkExecModuleEnabled)
        if self.execModulesEnabled == True:
            print _('Running modules...')
            modExecScrChroot = '#!/bin/sh\n\ncd /tmp ;\n'
	    modExecScrChroot += 'export DISPLAY=127.0.0.1:5.0 \n'
 	    modExecScrChroot += 'bash \"/tmp/init.sh\"' + ' ;\n '
 	    
 	    modExecScr = '#!/bin/sh\n\n'
            modExecScr += 'chmod +x \"' + os.path.join(self.ciwsRootDir, "artwork/"+self.artwork+".artscript")+ '\"' + ' ;\n '
	    modExecScr += 'bash \"' + os.path.join(self.ciwsRootDir, "artwork/"+self.artwork+".artscript")+ '\"' + ' ;\n '
	    # copy all "execute" enabled scripts proper location (chroot or customdir)
            
	   
            # find all modules in chroot and chain together and run
            for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "scripts/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.rmod', ext):
                        modExecScr += 'echo -------------------------------------------------\n'
                        modExecScr += 'echo ------------Cooperation-iws----------------------\n'
                        modExecScr += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecScr += 'echo -------------------------------------------------\n'
                        modExecScr += 'echo -------------------------------------------------\n'
                        modExecScr += 'bash \"' + os.path.join(self.customDir, "scripts/") + os.path.basename(execMod) + '\"' + ' ;\n '
            modExecScrChroot += 'echo Running OS:  \n'
	    for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.scrmod', ext):
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecScrChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n'
	    modExecScrChroot += 'echo Running Servers:  \n'
	    for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.smod', ext):
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecScrChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n'
	    modExecScrChroot += 'echo Running Core:  \n'
	    if self.ReqApache == "A":    
		modExecScrChroot += 'bash \"/tmp/init_Lampp.sh\"' + ' ;\n '
		modExecScrChroot += 'bash \"/tmp/cooperation-iws-wui.sh\"' + ' ;\n '
	    if self.artwork != "":  
		modExecScrChroot += 'bash \"/tmp/artwork.amod\"' + ' ;\n '
            for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.rmod', ext):
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecScrChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'echo -------------------------------------------------\n'
                        modExecScrChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n '
	    for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in execModFiles:
                    ext = os.path.basename(execMod)
            
            modExecScr += '\necho \'--------------------\'\necho \'Modules Finished...\'\n'
            #modExecScr += '\n read ok < /dev/tty\n'
            modExecScrChroot += '\necho \'--------------------\'\necho \'Modules Finished...\'\n'
            modExecScrChroot += 'echo Running Core_end \n'
            modExecScrChroot += 'bash \"/tmp/end_Lampp.sh\"' + ' ;\n '
            modExecScrChroot += 'sleep 10'
            #modExecScrChroot += 'echo \'Press [Enter] to continue...\'\nread \n'
            #print modExecScr
            fModExec=open(os.path.join(self.customDir, "scripts/module-exec.sh"), 'w')
            fModExec.write(modExecScr)
            fModExec.close()
	    os.popen('chmod a+x ' + os.path.join(self.customDir, "scripts/module-exec.sh"))
            #print modExecScrChroot
            fModExecChroot=open(os.path.join(self.customDir, "chroot/tmp/module-exec.sh"), 'w')
            fModExecChroot.write(modExecScrChroot)
            fModExecChroot.close()
            os.popen('chmod a+x ' + os.path.join(self.customDir, "chroot/tmp/module-exec.sh"))
             	   	
	    #os.popen('xterm -title \'Reconstructor Module Exec\' -e chroot \"' + os.path.join(self.customDir, "chroot/") + '\" /tmp/module-exec.sh')
            # copy dns info
            print _("Copying DNS info...")
            os.popen('cp -f /etc/resolv.conf ' + os.path.join(self.customDir, "chroot/etc/resolv.conf"))
            # mount /proc
            print _("Mounting /proc filesystem...")
            os.popen('mount --bind /proc \"' + os.path.join(self.customDir, "chroot/proc") + '\"')
            # mount /sys
            print _("Mounting /sys filesystem...")
            #os.popen('mount -t sysfs none \"' + os.path.join(self.customDir, "chroot/sys") + '\"')
            # mount 
	    print _("Mounting /dev/pts filesystem...")
            #os.popen('mount -t devpts none \"' + os.path.join(self.customDir, "chroot/dev/pts") + '\"')
            # copy apt.conf
            print _("Copying apt.conf configuration...")
            if not os.path.exists(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d")):
                os.makedirs(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d"))
            os.popen('cp -f /etc/apt/apt.conf.d/* ' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d"))
            # copy wgetrc
            print _("Copying wgetrc configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\"')
            os.popen('cp -f /etc/wgetrc ' + os.path.join(self.customDir, "chroot/etc/wgetrc"))
            print _("Copying hostname configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\"')
            os.popen('cp -f /etc/hosts ' + os.path.join(self.customDir, "chroot/etc/hosts"))
            os.popen('cp -f /etc/hostname ' + os.path.join(self.customDir, "chroot/etc/hostname"))
            # run module script
            os.system('chroot \"' + os.path.join(self.customDir, "chroot/") + '\" /tmp/module-exec.sh')
            os.system('bash \"' + os.path.join(self.customDir, "scripts/module-exec.sh")+ '\"')
	
	    # cleanup
            #os.popen('cd \"' + os.path.join(self.customDir, "chroot/tmp/") + '\" ; ' + 'rm -Rf *.rmod 1>&2 2>/dev/null')
            # restore wgetrc
            print _("Restoring wgetrc configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            print _("Restoring hostname configuration...")
            
	    os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')

            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')

            # remove apt.conf
            #print _("Removing apt.conf configuration...")
            #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/*") + '\"')
            # remove dns info
            print _("Removing DNS info...")
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
	    # umount /sys
	    print _("Umounting /sys...")
            #os.popen('umount \"' + os.path.join(self.customDir, "chroot/sys/") + '\"')
	    # umount /dev/pts
	    print _("Umounting /dev/pts...")
            #os.popen('umount \"' + os.path.join(self.customDir, "chroot/dev/pts") + '\"')
		
        
        # manual software
        # check for manual install
        if self.manualInstall == True:
            print _("Manually installing all existing .deb archives in /var/cache/apt/archives...")
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' dpkg -i -R /var/cache/apt/archives/ 1>&2 2>/dev/null')
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get clean')
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get autoclean')

        # DEPRECATED - replacing with module framework
        # install software

        # install regular software
        if self.checkSoftware() == True:
            # copy dns info
            print _("Copying DNS info...")
            os.popen('cp -f /etc/resolv.conf ' + os.path.join(self.customDir, "chroot/etc/resolv.conf"))
            # mount /proc
            print _("Mounting /proc filesystem...")
            os.popen('mount --bind /proc \"' + os.path.join(self.customDir, "chroot/proc") + '\"')
            # copy apt.conf
            print _("Copying apt.conf configuration...")
            if not os.path.exists(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/")):
                os.makedirs(os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/"))
            os.popen('cp -f /etc/apt/apt.conf.d/* ' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf.d/"))
            # copy wgetrc
            print _("Copying wgetrc configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\"')
            os.popen('cp -f /etc/wgetrc ' + os.path.join(self.customDir, "chroot/etc/wgetrc"))
            print _("Copying hostname configuration...")
            # backup
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\"')
            os.popen('cp -f /etc/hosts ' + os.path.join(self.customDir, "chroot/etc/hosts"))
            os.popen('cp -f /etc/hostname ' + os.path.join(self.customDir, "chroot/etc/hostname"))
         
	    # update ONLY if repositories are selected
            if self.checkCustomRepos() == True:
                print _("Updating APT Information...")
                # update apt
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get update ')
            # clean cache
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get clean')
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get autoclean')

            # custom apt-get
            if self.wTree.get_widget("entryCustomAptInstall").get_text() != "":
                print _("Installing Custom Software...")
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get install --assume-yes --force-yes -d ' + self.wTree.get_widget("entryCustomAptInstall").get_text())
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' dpkg -i -R /var/cache/apt/archives/ 1>&2 2>/dev/null')
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get clean')
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get autoclean')

            # custom software removal
            if self.wTree.get_widget("entryCustomAptRemove").get_text() != "":
                print _("Removing Custom Software...")
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' dpkg -P ' + self.wTree.get_widget("entryCustomAptRemove").get_text() + ' 1>&2 2>/dev/null')
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' dpkg --configure -a')
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get clean')
                os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get autoclean')


            # restore wgetrc
            print _("Restoring wgetrc configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            # remove apt.conf
            #print _("Removing apt.conf configuration...")
            #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf") + '\"')
            # remove dns info
            print _("Restoring hostname configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')
           
	    print _("Removing DNS info...")
            os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
            self.setDefaultCursor()
            self.setPage(self.pageLiveBuild)

	
	#END SCRIPTS
	if self.reqXnest == True: 
		scriptEndExec = 'bash \"' + self.scriptDir + 'xnest_end.sh\"' + ' ;\n '
	 	fscriptEndExec=open(os.path.join(self.customDir, "scriptEndExec.sh"), 'w')
		fscriptEndExec.write(scriptEndExec)
		fscriptEndExec.close()
		os.popen('chmod a+x ' + os.path.join(self.customDir, "scriptEndExec.sh"))
		os.popen('bash \"' + os.path.join(self.customDir, "scriptEndExec.sh") + '\"')
	



# ---------- Build ---------- #
    def build(self):
        if self.installType == "Cd":
		# check for custom mksquashfs (for multi-threading, new features, etc.)
		mksquashfs = ''
		if commands.getoutput('echo $MKSQUASHFS') != '':
		    mksquashfs = commands.getoutput('echo $MKSQUASHFS')
		    print 'Using alternative mksquashfs: ' + ' Version: ' + commands.getoutput(mksquashfs + ' -version')
		
		print " "
		print _("INFO: Starting Build...")
		print " "
		# build initrd
		

		# build squash root
		if self.buildSquashRoot == True:
		    # create squashfs root
		    if os.path.exists(os.path.join(self.customDir, "chroot")):
		        print _("Creating SquashFS chroot...")
		        print _("Updating File lists...")
		        q = ' dpkg-query -W --showformat=\'${Package} ${Version}\n\' '
		        os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + q + ' > \"' + os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.manifest") + '\"' )
		        os.popen('cp -f \"' + os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.manifest") + '\" \"' + os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.manifest-desktop") + '\"')
		        # check for existing squashfs root
		        if os.path.exists(os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.squashfs")):
		            print _("Removing existing SquashFS chroot...")
		            os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.squashfs") + '\"')
		        print _("Building SquashFS root...")
		        # check for alternate mksquashfs
		        #if mksquashfs == '':
			scriptMksquashfs = '#!/bin/bash \n'
                        scriptMksquashfs += 'cd ' + self.customDir + '\n'
			scriptMksquashfs += 'if [[ -n $(dpkg-query --list | grep squashfs | grep 1:3.3-1) ]]; then\n'
		        scriptMksquashfs += 'apt-get remove -y -force-yes squashfs-tools\n'
		        scriptMksquashfs += 'wget http://ftp.de.debian.org/debian/pool/main/s/squashfs/squashfs-tools_3.3-7_i386.deb\n'
		        scriptMksquashfs += 'dpkg -i squashfs-tools_3.3-7_i386.deb\n'
		        scriptMksquashfs += 'fi \necho \"I: Building squashfs\" \n'
		        scriptMksquashfs += 'cp chroot/initrd.gz remaster/' + self.casperPath + '/. \n'
		      	scriptMksquashfs += 'cp chroot/vmlinuz remaster/' + self.casperPath + '/. \n'
		      	scriptMksquashfs += 'mksquashfs chroot remaster/' + self.casperPath + '/filesystem.squashfs \n'
		        scriptMksquashfs += 'exit 0 \n'
			fscriptMksquashfs=open(os.path.join(self.customDir, "scriptMksquashfs.sh"), 'w')
			fscriptMksquashfs.write(scriptMksquashfs)
			fscriptMksquashfs.close()
			os.popen('chmod a+x ' + os.path.join(self.customDir, "scriptMksquashfs.sh"))
			os.system('bash \"' + os.path.join(self.customDir, "scriptMksquashfs.sh")+ '\"')
		   	
		        #else:
		            #os.popen(self.timeCmd + ' ' + mksquashfs + ' \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' \"' + os.path.join(self.customDir, "remaster/casper/filesystem.squashfs") + '\"')

		# remove windows programs
		if self.LiveCdRemovePrograms == True:
		    print _('Removing Win32 versions of Firefox, Thunderbird, etc. ...')
		    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/bin") + '\"')
		    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/programs") + '\"')
		    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/autorun.inf") + '\"')
		    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/start.ini") + '\"')
		    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/start.exe") + '\"')
		    os.popen('rm -Rf \"' + os.path.join(self.customDir, "remaster/start.bmp") + '\"')

		# build iso
		if self.buildIso == True:
		    # create iso
		    if os.path.exists(os.path.join(self.customDir, "remaster")):
		        print _("Creating ISO...")
		        # add disc id
		        os.popen('echo \"Built by Cooperation-iws ' + self.appVersion + ' - Rev ' + self.updateId + ' (c) Cooperation-iws Team, 2008 - http://cooperation-iws.gensys-net.eu\" > \"' + os.path.join(self.customDir, "remaster/.disc_id") + '\"')
		        # update md5
		        print _("Updating md5 sums...")
		        os.popen('cd \"' + os.path.join(self.customDir, "remaster/") + '\"; ' + 'find . -type f -print0 | xargs -0 md5sum > md5sum.txt')
		        # remove existing iso
		        if os.path.exists(self.buildLiveCdFilename):
		            print _("Removing existing ISO...")
		            os.popen('rm -Rf \"' + self.buildLiveCdFilename + '\"')
		        # build
		        # check for description - replace if necessary
		        
		        # build iso according to architecture
		        if self.LiveCdArch == "x86":
		            print _("Building x86 ISO...")
		            os.popen(self.timeCmd + ' mkisofs -o \"' + self.buildLiveCdFilename + '\" -b \"isolinux/isolinux.bin\" -c \"isolinux/boot.cat\" -no-emul-boot -boot-load-size 4 -boot-info-table -V \"' + self.LiveCdDescription + '\" -cache-inodes -r -J -l \"' + os.path.join(self.customDir, "remaster") + '\"')
		        elif self.LiveCdArch == "PowerPC":
		            print _("Building PowerPC ISO...")
		            os.popen(self.timeCmd + ' mkisofs  -r -V \"' + self.LiveCdDescription + '\" --netatalk -hfs -probe -map \"' + self.hfsMap + '\" -chrp-boot -iso-level 2 -part -no-desktop -hfs-bless ' + '\"' + os.path.join(self.customDir, "remaster/install") + '\" -o \"' + self.buildLiveCdFilename + '\" \"' + os.path.join(self.customDir, "remaster") + '\"')
		        elif self.LiveCdArch == "x86_64":
		            print _("Building x86_64 ISO...")
		            os.popen(self.timeCmd + ' mkisofs -r -o \"' + self.buildLiveCdFilename + '\" -b \"isolinux/isolinux.bin\" -c \"isolinux/boot.cat\" -no-emul-boot -V \"' + self.LiveCdDescription + '\" -J -l \"' + os.path.join(self.customDir, "remaster") + '\"')
	else :
		self.customDir = self.wTree.get_widget("entryWorkingDir").get_text()	
		self.isoFilename  = self.wTree.get_widget("entryIsoFilename").get_text()
		
		self.setupUsbWorkingDirectory()
		#Share Working directory
		fWorkDir=open('/tmp/working-directory', 'w')
        	fWorkDir.write(self.customDir)
        	fWorkDir.close()
		self.buildUsb = True
		
	#Build usb
	if  self.buildUsb == True : 
		print "Custom Directory: " + str(self.customDir)
        	print "ISO Filename: " + str(self.isoFilename)
		
		print _("Building Live USB...")
		try:
		    os.popen('/usr/bin/liveusb -m ' + os.path.join(self.customDir, "remaster"))  	
    		except Exception, detail:
            	    errText = _("Error Creating Live Usb Key: ")
            	    print errText, detail
            	    pass
	 	# unmount iso/cd-rom
    		os.popen("umount " + os.path.join(self.customDir, "remaster") + " 1>&2 2>/dev/null")

	self.setDefaultCursor()
        self.setPage(self.pageFinish)
        # print status message
        statusMsgFinish = _('     <b>Finished.</b>     ')
        statusMsgISO = _('      <b>Finished.</b> ISO located at: ')
        if os.path.exists(self.buildLiveCdFilename):
            print "ISO Located: " + self.buildLiveCdFilename
            self.wTree.get_widget("labelBuildComplete").set_text(statusMsgISO + self.buildLiveCdFilename + '     ')
            self.wTree.get_widget("labelBuildComplete").set_use_markup(True)
        else:
            self.wTree.get_widget("labelBuildComplete").set_text(statusMsgFinish)
            self.wTree.get_widget("labelBuildComplete").set_use_markup(True)
        # enable/disable iso burn
        self.checkEnableBurnIso()

        print "Build Complete..."


# ---------- MAIN ----------

if __name__ == "__main__":
    APPDOMAIN='reconstructor'
    LANGDIR='lang'
    # locale
    locale.setlocale(locale.LC_ALL, '')
    gettext.bindtextdomain(APPDOMAIN, LANGDIR)
    gtk.glade.bindtextdomain(APPDOMAIN, LANGDIR)
    gtk.glade.textdomain(APPDOMAIN)
    gettext.textdomain(APPDOMAIN)
    gettext.install(APPDOMAIN, LANGDIR, unicode=1)

    # check credentials
    if os.getuid() != 0 :
        ## show non-root privledge error
        warnDlg = gtk.Dialog(title="Reconstructor", parent=None, flags=0, buttons=(gtk.STOCK_OK, gtk.RESPONSE_OK))
        warnDlg.set_icon_from_file('glade/app.png')
        warnDlg.vbox.set_spacing(10)
        labelSpc = gtk.Label(" ")
        warnDlg.vbox.pack_start(labelSpc)
        labelSpc.show()
        warnText = _("  <b>You must run with root privledges.</b>")
        infoText = _("Open a Terminal, change to the directory with reconstructor, \nand type <b>sudo python reconstructor.py</b>  ")
        label = gtk.Label(warnText)
        lblInfo = gtk.Label(infoText)
        label.set_use_markup(True)
        lblInfo.set_use_markup(True)
        warnDlg.vbox.pack_start(label)
        warnDlg.vbox.pack_start(lblInfo)
        label.show()
        lblInfo.show()
        response = warnDlg.run()
        if response == gtk.RESPONSE_OK :
            warnDlg.destroy()
            #gtk.main_quit()
            sys.exit(0)
        # use gksu to open -- HIDES TERMINAL
        #os.popen('gksu ' + os.getcwd() + '/reconstructor.py')
        #gtk.main_quit()
        #sys.exit(0)
    else :
        rec = Reconstructor()
        # run gui
        gtk.main()
