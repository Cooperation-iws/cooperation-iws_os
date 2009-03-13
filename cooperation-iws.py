#!/usr/bin/env python
#
# Cooperation-iws -- http://www.cooperation-iws.eu
#    Copyright (c) 2008-2009  Cooperation-iws Team <olivier@cooperation-iws.eu>
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
        

	self.hosting = "http://cooperation.gensys.free.fr/v0.3"
	self.mirrorFree = "http://cooperation.gensys.free.fr/mirroir/v0.5"
	self.mirrorBerlios1 = "http://download.berlios.de/ciws"
	self.mirrorBerlios2 = "http://download2.berlios.de/ciws"
	self.appName = "Cooperation-iws"
        self.codeName = " \"\" "
        self.appVersion = "0.9.0"
        self.updateId = "325"
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
        self.shutdownScripts = ('11anacron', '11atd', '19cupsys', '20acpi-support', '20apmd', '20bittorrent', '20dbus', '20festival', '20hotkey-setup', '20makedev', '20nvidia-kernel', '20powernowd', '20rsync', '20ssh', '21acpid', '21hplip', '74bluez-utils', '88pcmcia', '88pcmciautils', '89klogd', '90syslogd')
	self.ReqApache = "B"
	self.nodebuntu = False


        APPDOMAIN='reconstructor'
        LANGDIR='lang'
        # locale
        locale.setlocale(locale.LC_ALL, '')
        gettext.bindtextdomain(APPDOMAIN, LANGDIR)
        gtk.glade.bindtextdomain(APPDOMAIN, LANGDIR)
        gtk.glade.textdomain(APPDOMAIN)
        gettext.textdomain(APPDOMAIN)
        gettext.install(APPDOMAIN, LANGDIR, unicode=1)

 	# print copyright
        print " "
        print self.appName + " -- (c) Cooperation-iws Team, 2008"
        print "       Version: " + self.appVersion
        print "        http://www.cooperation-iws.eu"
        print " "
	
        #command options parser
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
                    dest="modulesfile", default="templates/empty" ,
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
	parser.add_option( "--debmirrornonfree", 
                    dest="debmirrorNonfree", default="http://packages.medibuntu.org/" ,
                    help="Non Free Debian packages mirror url")
	parser.add_option( "--debmirrorsecurity", 
                    dest="debmirrorsecurity", default="http://security.debian.org/" ,
                    help="Security packages for Debian OS")
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
                    dest="host", default="" ,
                    help="Host Name")
	parser.add_option( "--keyblang", 
                    dest="keyblang", default="" ,
                    help="Keyboard Language")
	parser.add_option( "--locale", 
                    dest="locale", default="" ,
                    help="OS localization")
	parser.add_option( "--ostype", 
                    dest="ostype", default="Server" ,
                    help="Os Type (Server or Client)")
	parser.add_option( "--disautologin", action="store_true",
                    dest="disautologin", default=False ,
                    help="Use aufs")
	parser.add_option( "--outputisoname", 
                    dest="outputisoname", default="cooperation-iws-server.iso" ,
                    help="Output iso image name")
	parser.add_option( "--silent", 
                    dest="silent", action="store_true",
                    default=False ,
                    help="No prompt mode (silent mode)")
	parser.add_option( "--debianlive", 
                    dest="debianlive", action="store_true",
                    default=False ,
                    help="Create Debian Live Chroot from Live-helper script")
	parser.add_option( "--debianLiveOS", 
                    dest="debianLiveOS", default="lenny" ,
                    help="Debian OS (etch, lenny, sid)")
	parser.add_option( "--debianflavor", 
                    dest="debianLiveFlavor", default="xfce" ,
                    help="Debian flavor (xfce, gnome, kde)")
	parser.add_option( "--webconverger", 
                    dest="webconverger", action="store_true",
                    default=False ,
                    help="Create Web converger iso")
	parser.add_option( "--webconvergerlocale", 
                    dest="webconvergerlocale", default="webconverger-eu",
                    help="Webconverger localization")
        parser.add_option( "--encryption", 
                    dest="encryption", default="disabled",
                    help="Debian live encryption")
	parser.add_option( "--pfsense", 
                    dest="pfsense", action="store_true", default=False,
                    help="Debian live encryption")
	parser.add_option( "--encryptionpassphrase", 
                    dest="encryptionpassphrase", default="",
                    help="Debian live encryption passphrase")
	parser.add_option( "--isotype", 
                    dest="isotype", default="" ,
                    help="Type of Input Iso image")
        (options, args) = parser.parse_args()


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
	    if self.user != "" and self.checkUserName() == False:
		print _("You need to specify a username with at least 6 characters in this field of characters: [a-z0-9_-*.]")
		exit(0)
	    self.password = options.password
	    self.userFull = options.userfullname
	    self.host = options.host
	    self.checkbuttonDisableAutologin = options.disautologin
	    self.debMirror = options.debmirror
            self.debMirrorNonfree = options.debmirrorNonfree
            self.debMirrorSecurity = options.debmirrorsecurity
            self.keyLang = options.keyblang
	    self.ciwsOsType = options.ostype
	    self.isoname = options.outputisoname
	    self.silent = options.silent
	    self.debianLive = options.debianlive
	    self.DebianLiveType =  options.debianLiveFlavor       
	    self.DebianLiveReleaseType =  options.debianLiveOS         
	    self.webconverger = options.webconverger
	    self.webconvergerLocale = options.webconvergerlocale
	    self.encryption = options.encryption
	    self.encryptionpassphrase = options.encryptionpassphrase
	    self.locale = options.locale
	    self.locale = options.locale
	    self.pfsense = options.pfsense
	    self.isoType = options.isotype
	    if self.pfsense == True:
		self.nodebuntu == True
		
	else:
	    self.commandLine = False



	if os.path.exists(self.mountDir) == False:
		    print _('INFO: Creating mount directory...')
		    os.makedirs(self.mountDir)

        self.commandLineGui()

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
            installTxt = _('Installing dependencies: ')
	    print installTxt + dependList.replace('\n', ' ')
	    os.popen('apt-get install -y --force-yes ' + dependList.replace('\n', ' '))
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

                            

    def listModules(self):
	print _('Listing modules...')
        print " \033[1m Module Name \033[0m\n"
	print "Module file name | Description | Author | Version | Require Apache | Run in chroot"
                        
        # load modules into the treestore
        for root, dirs, files in os.walk(self.moduleDir):
		count = 1
                for f in files:
                    r, ext = os.path.splitext(f)
                    if ext == '.rmod' or ext == '.smod' or ext == '.kmod':
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
	self.otherApacheInstance = False
        for root, dirs, files in os.walk(self.moduleDir):
		count = 0
                for f in files:
                    r, ext = os.path.splitext(f)
                    if ext == '.rmod' or ext == '.smod' or ext == '.kmod':
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
					
				if modProps[self.modReqApache] == "True" and self.otherApacheInstance == False:       
					self.ReqApache = "A"
					fReqApache=open(os.path.join(self.customDir, "chroot/tmp/apache"), 'w')
			    		fReqApache.write(self.ReqApache)
			    		fReqApache.close()
				elif modProps[self.modReqApache] == "False":
					self.otherApacheInstance = True
					os.popen('rm '+os.path.join(self.customDir, "chroot/tmp/apache"))
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

    def checkWindowsPrograms(self):
        apps = False
        if os.path.exists(os.path.join(self.customDir, "remaster/bin")):
            apps = True
        if os.path.exists(os.path.join(self.customDir, "remaster/programs")):
            apps = True
        return apps

    # checks if user entered custom password matches
    def checkUserPassword(self):
        if self.password == self.passwordCheck:
            return True
        else:
            return False
    
    def checkUserName(self):
	if int(commands.getoutput('echo ' + self.user + ' | wc -m')) > 6 :
		if commands.getoutput('echo '  + self.user + '| grep \'^[a-z0-9_-*.]*$\'') != '':
	    		return True
		else:
	    		return False
        else:
            	return False

       
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
            	#os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
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
            os.popen('chmod +x ' + os.path.join(self.customDir, "chroot/opt/ciws/share/lampp/config_post_install.sh"))
	   
	    os.system('chroot ' + os.path.join(self.customDir, "chroot") + ' /opt/ciws/share/lampp/config_post_install.sh')
            
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
	elif self.distVariant == 'ozos-0.9':
		initUsername = 'wizard'
		initUserFullname = 'Live session user'
		initHostName = 'oz'
		initBuildSystem = 'OzOS'
	elif self.distVariant == 'poseidon-3.1':
		initUsername = 'poseidon'
		initUserFullname = 'Live session user'
		initHostName = 'poseidon'
		initBuildSystem = 'Ubuntu'
	elif self.distVariant == 'nubuntu_8.10':
		initUsername = 'nubuntu'
		initUserFullname = 'Live session user'
		initHostName = 'nubuntu'
		initBuildSystem = 'Ubuntu'
	elif self.distVariant == 'edubuntu_8.10' or self.distVariant == 'studio_8.10':
		initUsername = 'custom'
		initUserFullname = 'Live session user'
		initHostName = 'custom'
		initBuildSystem = 'client'
	else:
		initUsername = 'ubuntu'
		initUserFullname = 'Live session user'
		initHostName = 'ubuntu'
		initBuildSystem = 'Ubuntu'

	if self.casperPathUpdated  == 'casper':
	    if username != '':
		    print ('Username: ' + username)
		    sed = 'sed -i \'5s/' + initUsername + '/' + username + '/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPathUpdated  + ".conf")
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	    #sed = 'sed -i \'s/USERNAME=casper/USERNAME=' + username + '/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/casper")
		    #cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if userFullname != '':
		    print ('User Full Name: ' + userFullname)
		    sed = 'sed -i \'s/USERFULLNAME=\"' + initUserFullname + '\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPathUpdated  + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed User Full Name: \n ' + sed + '\n' + cmd)
	    	    #sed = 'sed -i \'s/USERFULLNAME=\"Live session user\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPath )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if hostname != '':
		    print ('Hostname: ' + hostname)
		    sed = 'sed -i \'s/HOST=\"' + initHostName + '\"/HOST=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPathUpdated  + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed 1 Hostname: \n ' + sed + '\n' + cmd)
		    sed = 'sed -i \'s/BUILD_SYSTEM=\"' + initBuildSystem + '\"/BUILD_SYSTEM=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPathUpdated  + ".conf")
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed 2 Hostname: \n ' + sed + '\n' + cmd)
		    sed = 'sed -i \'s/HOST=live/HOST=' + hostname + '/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	    sed = 'sed -i \'s/BUILD_SYSTEM=Custom/BUILD_SYSTEM=' + hostname +'/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated )
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
		sed = 'sed -i \'s/set passwd\/user-password-crypted U6aMy0wojraho/set passwd\/user-password-crypted ' + crypt_pass +'/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 password:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'s/ALL=(ALL) NOPASSWD: ALL/ALL=(ALL) ALL/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 2 password: \n ' + sed + '\n' + cmd)
		sed = 'sed -i \'46s/NOPASSWD: //\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/10adduser")
		cmd = commands.getoutput(sed)
 	        #print ('Sed 3 password:\n ' + sed + '\n' + cmd)
		#cmd = commands.getoutput('chmod +r+x '+ os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/casper-bottom/10adduser"))	

                
            
	    if self.checkbuttonDisableAutologin == True:
		sed = 'sed -i \'34s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'36s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'45s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		sed = 'sed -i \'54s/true/false/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)
 	        #print ('Sed 1 autologin:\n ' + sed + '\n' + cmd)
		
            
        else:
	    if username != '':
		    print ('Username: ' + username)
		    sed = 'sed -i \'3s/user/' + username + '/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPathUpdated  + ".conf")
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    	    sed = 'sed -i \'s/USERNAME=\"user\"/USERNAME=\"' + username + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if userFullname != '':
		    print ('User Full Name: ' + userFullname)
		    sed = 'sed -i \'s/USERFULLNAME=\"Debian Live user\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPathUpdated  + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed User Full Name: \n ' + sed + '\n' + cmd)
	    	    sed = 'sed -i \'s/USERFULLNAME=\"Live user\"/USERFULLNAME=\"' + userFullname + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
	    
	    if hostname != '':
		    print ('Hostname: ' + hostname)
		    sed = 'sed -i \'s/HOSTNAME=\"debian\"/HOSTNAME=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/etc/" + self.casperPathUpdated  + ".conf") 
		    cmd = commands.getoutput(sed)
	 	    #print ('Sed 1 Hostname: \n ' + sed + '\n' + cmd)
		    #print ('Sed 2 Hostname: \n ' + sed + '\n' + cmd)
		    sed = 'sed -i \'s/HOSTNAME=\"host\"/HOSTNAME=\"' + hostname + '\"/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  )
		    cmd = commands.getoutput(sed)
	    	    #print ('Sed Username: \n ' + sed + ' \n ' + cmd)
             
            if userPassword != '':
                #print ('Password: ' + l)
                passwordText = _('Setting Live CD Password... ')
                print passwordText
                #print "DEBUG: Password: " + userPassword + " des Hash: " + commands.getoutput('echo ' + userPassword + ' | mkpasswd -s -H des')
		crypt_pass = commands.getoutput('mkpasswd -s ' + userPassword )			
		while  commands.getoutput(' echo  ' + crypt_pass + ' | grep "[/.]" ') != '' :
               		crypt_pass = commands.getoutput('mkpasswd -s ' + userPassword )
		sed = 'sed -i \'s/8Ab05sVQ4LLps/' + crypt_pass +'/\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
 	        sed = 'sed -i \'s/ NOPASSWD://\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/10adduser") 
		cmd = commands.getoutput(sed)
                
            
	    if self.checkbuttonDisableAutologin == True:
		sed = 'sed -i \'s/true/false/g\' ' + os.path.join(self.customDir, "chroot/usr/share/initramfs-tools/scripts/" + self.casperPathUpdated  + "-bottom/15autologin") 
		cmd = commands.getoutput(sed)

    #detect Live CD version
    def checkLiveCdVersion(self):
		
            if  self.isoType == "edubuntu_8.10":
		self.casperPath = 'casper'	
		self.debDist= 'intrepid'
		self.distVariant = 'edubuntu_8.10'		
		print "\033[1m Edubuntu 8.10 Live CD\033[0m\n"	
	    elif  self.isoType == "eeebuntu_8.10":
		self.casperPath = 'casper'	
		self.debDist= 'intrepid'
		self.distVariant = 'eeebuntu_8.10'		
		print "\033[1m Eeebuntu 8.10 Live CD\033[0m\n" 
	    elif  self.isoType == "studio_8.10":
		self.casperPath = 'casper'	
		self.debDist= 'intrepid'
		self.distVariant = 'studio_8.10'		
		print "\033[1m Ubuntu Studio 8.10 Live CD\033[0m\n" 
	    elif  self.isoType == "netbook-remix_8.10":
		self.casperPath = 'casper'	
		self.debDist= 'intrepid'
		self.distVariant = 'netbook-remix_8.10'		
		print "\033[1m Netbook remix 8.10 Live CD\033[0m\n"
	    elif  self.isoType == "nubuntu_8.10":
		self.casperPath = 'casper'	
		self.debDist= 'intrepid'
		self.distVariant = 'nubuntu_8.10'		
		print "\033[1m Nbuntu8.10 Live CD\033[0m\n"
	    elif  self.isoType == "maryan_8.04.1":
		self.casperPath = 'casper'	
		self.debDist= 'hardy'
		self.distVariant = 'maryan_8.04.1'		
		print "\033[1m Maryan 8.10 Live CD\033[0m\n"	
	    elif  self.isoType == "opengeu_8.04.1":
		self.casperPath = 'casper'	
		self.debDist= 'hardy'
		self.distVariant = 'opengeu_8.04.1'		
		print "\033[1m Opengeu 8.04.1 Live CD\033[0m\n"
            elif  self.isoType == "ozos-0.9":
		self.casperPath = 'casper'	
		self.debDist= 'hardy'
		self.distVariant = 'ozos-0.9'		
		print "\033[1m Ozos 0.9 Live CD\033[0m\n"
            elif  self.isoType == "poseidon-3.1":
		self.casperPath = 'casper'	
		self.debDist= 'hardy'
		self.distVariant = 'poseidon-3.1'		
		print "\033[1m Poseidon 3.1 Live CD\033[0m\n"		
	    elif os.path.exists(os.path.join(self.customDir, "remaster/boot/grub")) and commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/boot/grub/menu.lst") + '| grep \'Webconverger\'') != '':
		self.casperPath = 'live'
		self.debDist= 'lenny'
		self.distVariant = 'webconverger'	
		print "\033[1m Webconverger Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + ' | grep \'Elyssa\'') != '':
		self.casperPath = 'casper'
		self.debDist = 'hardy'
		self.distVariant = 'mint'			
		print "\033[1m Linux Mint 5 Elyssa\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + ' | grep \'nUbuntu\'') != '' and commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.04\'') != '':
		self.casperPath = 'casper'
		self.debDist = 'hardy'
		self.distVariant = 'nUbuntu'			
		print "\033[1m  nUbuntu 8.04\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'etch\'') != '':
		self.casperPath = 'casper'
		self.debDist= 'etch'
		self.distVariant = 'etch'			
		print "\033[1m Debian Etch Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'20070727\'') != '':
		self.casperPath = 'casper'
		self.debDist= 'studio64'
		self.distVariant = 'studio64'			
		print "\033[1m Studio 64 Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.04\'') != '' or commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'hardy\'') != '':
		self.casperPath = 'casper'	
		self.debDist= 'hardy'
		self.distVariant = 'hardy'		
		print "\033[1m Ubuntu 8.04 Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.10\'') != '':
		self.casperPath = 'casper'	
		self.debDist= 'intrepid'
		self.distVariant = 'intrepid'		
		print "\033[1m Ubuntu 8.10 Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'lenny\'') != '':
		self.casperPath = 'live'
		self.debDist= 'lenny'
		self.distVariant = 'lenny'	
		print "Debian Lenny Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + '| grep \'vyatta\'') != '':
		self.casperPath = 'live'
		self.debDist= 'lenny'
		self.distVariant = 'vyatta'	
		print "\033[1m Vyatta Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'sid\'') != '':	    	
		self.debDist= 'sid'			
		self.casperPath = 'live'
		self.distVariant = 'sid'
		print "\033[1m Debian Sid Live CD\033[0m\n"
	    	
	    else:
		print "Live CD not detected, Aborting"

# ---------- Main thread ---------- #
    
    def commandLineGui(self):
	self.checkDependencies()
	if self.pfsense == True:
		if self.checkCustomDir() == True:
 			if self.checkWorkingDir() == True:
				self.setupWorkingDirectory()
				os.popen("cp "+self.moduleFilename + " /tmp/app_params")
				os.popen("echo \""+self.isoname+"\" > /tmp/output_iso_name")
				fWorkDir=open('/tmp/working-directory', 'w')
       				fWorkDir.write(self.customDir)
       				fWorkDir.close()
				self.cmdLoadModules()
				fWorkDir=open('/tmp/iso-filename', 'w')
		        	fWorkDir.write(self.isoFilename)
		        	fWorkDir.close()
				self.customizeNodebuntu()	
	elif self.checkCustomDir() == True:
                if self.checkSetup() == True:
                    if self.checkWorkingDir() == True:
			if self.debianLive == True:			
				self.setupDebianLive()           		
			else:
				self.setupWorkingDirectory()
		self.checkLiveCdVersion()
		self.cmdLoadModules()
		os.popen("cp "+self.moduleFilename + " " + os.path.join(self.customDir, "chroot") + "/tmp/app_params")
		os.popen("chmod +x " + os.path.join(self.customDir, "chroot") + "/tmp/app_params")
		os.popen("echo \"A\" > "+ os.path.join(self.customDir, "chroot") + "/tmp/silent")
		print _('Proceeding to customization...')		
		self.customize()		
		self.setLiveCdInfo(username=self.user, userFullname=self.userFull, userPassword=self.password, hostname=self.host)
		
		self.launchPostInstall()
		if self.silent == False:
			self.launchTerminal()
		self.endInstall()
		self.installType = "Cd"
		self.LiveCdDescription="Cooperation-iws Live CD"
		self.LiveCdArch = "x86"
		self.buildIso=True		
		self.buildSquashRoot = True
		self.buildUsb = False
		self.buildLiveCdFilename = os.path.join(self.customDir, self.isoname)
		self.LiveCdDescription = "cooperation-iws-custom"
		self.LiveCdRemovePrograms = True
		self.hfsMap = os.getcwd() + "/lib/hfs.map"
		
		self.build()
		
	
	exit(0)


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
	lhConfig = "lh_config "
	lhConfig += "-p " + self.DebianLiveType + " "
	lhConfig += '--distribution ' + self.DebianLiveReleaseType + ' --linux-flavours \"686\" --mirror-bootstrap \"' + self.debMirror + '\" --mirror-chroot \"' + self.debMirror + '\" --mirror-binary \"' + self.debMirror + '\" --apt-options \"--yes  --force-yes\" --bootappend-live \"keyb=' + self.keyLang + ' locale='+self.locale +'\" --hostname ' + self.host + ' --username ' + self.user + ' --encryption '+ self.encryption
	
	scriptDebianLive = 'echo "I: Creating Debian Live CD Linux flavour ' + self.DebianLiveType + ' ' + self.DebianLiveReleaseType + ' + " \n'
	scriptDebianLive += 'echo "' + lhConfig + '"\n'
	scriptDebianLive += 'echo "deb http://live.debian.net/debian/ ./" >> /etc/apt/sources.list\n'
	scriptDebianLive += 'apt-get update\n'
	scriptDebianLive += 'apt-get remove -y --force-yes live-helper \n'
	#scriptDebianLive += 'apt-get install -y --force-yes live-helper cdebootstrap debian-keyring \n'
	scriptDebianLive += 'cd /tmp && wget '+self.entryLocalMirror+'/live-helper_1.0.2+20090128.011503_all.deb\n'
	scriptDebianLive += 'apt-get install -y --force-yes debian-keyring \n'
	scriptDebianLive += 'cd /tmp && dpkg -i live-helper_1.0.2+20090128.011503_all.deb\n'
	scriptDebianLive += 'apt-get install -f --assume-yes --force-yes\n'
	scriptDebianLive += 'cd ' +self.customDir + '\n'
	
        
	if self.webconverger == True:
		scriptDebianLive += "apt-get install -y --force-yes git-core \n"
		scriptDebianLive += "wget "+self.entryLocalMirror+"/webconverger-081114.tar.gz \n"
		scriptDebianLive += "tar -xzf webconverger-081114.tar.gz \n"
		#scriptDebianLive += "git clone git://git.debian.org/git/debian-live/config-webc.git \n"
		scriptDebianLive += "sed -i \"17s/quiet/quiet keyb="+ self.keyLang +"/\" config-webc/webconverger/config/binary \n"
		scriptDebianLive += "echo LH_MIRROR_BOOTSTRAP=\"" + self.debMirror + "\" >> config-webc/webconverger/config/bootstrap \n"
		scriptDebianLive += "echo LH_MIRROR_CHROOT=\"" + self.debMirror + "\" >> config-webc/webconverger/config/bootstrap \n"
		scriptDebianLive += "echo LH_MIRROR_CHROOT_SECURITY=\"" + self.debMirrorSecurity + "\" >> config-webc/webconverger/config/bootstrap \n"
		scriptDebianLive += "echo LH_MIRROR_BINARY=\"" + self.debMirror + "\" >> config-webc/webconverger/config/bootstrap \n"
		scriptDebianLive += "echo LH_MIRROR_BINARY_SECURITY=\"" + self.debMirrorSecurity + "\" >> config-webc/webconverger/config/bootstrap \n"
		#scriptDebianLive += "sed -i \"25s/LH_BOOTLOADER/#LH_BOOTLOADER/\" config-webc/webconverger/config/binary \n"
		scriptDebianLive += 'cp ' + self.ciwsRootDir + '/artwork/'+ self.webconvergerLocale +'/menu.lst config-webc/webconverger/config/binary_grub/\n'
		scriptDebianLive += "cd config-webc/webconverger \n"
		
		
	else:
		scriptDebianLive += lhConfig + '\n'
	if self.encryption != "disabled":
		scriptDebianLive += "sed -i \"100s/-T/-p 3/\" /usr/bin/lh_binary_encryption\n"		
		scriptDebianLive += "sed -i \"102s/tmp/tmp 3< \/tmp\/squashfspwd/\" /usr/bin/lh_binary_encryption\n"
		scriptDebianLive += "sed -i \"109s/-T/-p 3/\" /usr/bin/lh_binary_encryption\n"		
		scriptDebianLive += "sed -i \"111s/tmp/tmp 3< \/tmp\/squashfspwd/\" /usr/bin/lh_binary_encryption\n"
		scriptDebianLive += "sed -i \"106s/-T/-p 3/\" /usr/bin/lh_binary_encryption\n"		
		scriptDebianLive += "sed -i \"108s/tmp/tmp 3< \/tmp\/squashfspwd/\" /usr/bin/lh_binary_encryption\n"
		scriptDebianLive += "sed -i \"115s/-T/-p 3/\" /usr/bin/lh_binary_encryption\n"		
		scriptDebianLive += "sed -i \"118s/tmp/tmp 3< \/tmp\/squashfspwd/\" /usr/bin/lh_binary_encryption\n"
		#scriptDebianLive += "sed -i \"73s/losetup/losetup.orig/\" " +self.customDir +"/config/common\n"
		
		fscriptPassphrase=open(os.path.join(self.customDir, "/tmp/squashfspwd"), 'w')
        	fscriptPassphrase.write(self.encryptionpassphrase)
        	fscriptPassphrase.close()
	#scriptDebianLive += 'lh_bootstrap && lh_chroot \n'
	scriptDebianLive += 'lh_build\n'
	if self.webconverger == True:
		scriptDebianLive += "mv binary.iso webconverger_bare.iso\n"
		scriptDebianLive += 'mv binary remaster \n'
	else:	
		#scriptDebianLive += 'lh_binary && lh_source\n'	
		scriptDebianLive += 'mv binary remaster \n'
		scriptDebianLive += 'mv binary.iso debian_lenny_barebone.iso\n'
	fscriptCustomExec=open(os.path.join(self.customDir, "scriptDebianLive.sh"), 'w')
        fscriptCustomExec.write(scriptDebianLive)
        fscriptCustomExec.close()
        
	os.system('bash ' + os.path.join(self.customDir, "scriptDebianLive.sh"))

	if self.webconverger == True:
		exit(0)
		self.customDir += "/config-webc/webconverger"
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
	self.casperPathUpdated = self.casperPath
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
	fcasperupdated=open(os.path.join(self.customDir, "chroot/tmp/casper_path_updated"), 'w')
	fcasperupdated.write(self.casperPathUpdated)
	fcasperupdated.close()  
	fcasperupdated=open("/tmp/casper_path_updated", 'w')
	fcasperupdated.write(self.casperPathUpdated)
	fcasperupdated.close()
	fdebDist=open(os.path.join(self.customDir, "chroot/tmp/deb_dist"), 'w')
	fdebDist.write(self.debDist)
	fdebDist.close()  
	fDebMirror=open(os.path.join(self.customDir, "chroot/tmp/deb_mirror_path"), 'w')
	fDebMirror.write(self.debMirror)
	fDebMirror.close()
	fDebMirrorNonfree=open(os.path.join(self.customDir, "chroot/tmp/deb-nonfree_mirror_path"), 'w')
	fDebMirrorNonfree.write(self.debMirrorNonfree)
	fDebMirrorNonfree.close()

	fDebMirrorSecurity=open(os.path.join(self.customDir, "chroot/tmp/deb-security_mirror_path"), 'w')
	fDebMirrorSecurity.write(self.debMirrorSecurity)
	fDebMirrorSecurity.close()
	fciwsOsType=open(os.path.join(self.customDir, "chroot/tmp/os_type"), 'w')
	fciwsOsType.write(self.ciwsOsType)
	fciwsOsType.close()
	fHostFile=open(os.path.join(self.customDir, "chroot") + '/tmp/hostname', 'w')
   	fHostFile.write(self.host)
    	fHostFile.close()
    	
	
	
	if self.comboboxCiwsArtwork == "ciwsGnome":
		self.artwork = "ciws_gnome"
		
	elif self.comboboxCiwsArtwork == "webconvergereu":
		self.artwork = "webconverger-eu"
	
	elif self.comboboxCiwsArtwork == "eLearning":
		self.artwork = "eLearning"
		
	else:
		self.artwork = ""
		
	if self.comboboxCiwsCms == "Wordpress-goo":
		self.cms = "cooperation-wui-wordpress-def-0.7.0-081130.tar.gz"
	else:
		self.cms = "cooperation-wui-joomla-def-0.8.0-090306.tar.gz"

  	if self.checkbuttonAufs == True:
		os.popen('sed -i "s/splash/splash union=aufs/g" ' + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg")) 
		
	if self.casperPath == 'live' or self.casperPathUpdated == "live":
		os.popen('sed -i "s/vmlinuz1/vmlinuz/g" ' + os.path.join(self.customDir, "remaster/isolinux/menu.cfg")) 
		os.popen('sed -i "s/initrd=\/'+self.casperPath+'\/initrd1.img/initrd=\/'+self.casperPathUpdated+'\/initrd.gz keyb='+self.keyLang+'/g" ' + os.path.join(self.customDir, "remaster/isolinux/menu.cfg")) 
		os.popen('echo '+self.keyLang+' > ' + os.path.join(self.customDir, "chroot/tmp/keyblang") )
	#XNEST
	scriptCustomExec = '#!/bin/sh\n\n'
	if self.reqXnest == True: 
		scriptCustomExec += 'bash \"' + self.scriptDir + 'xnest.sh\"' + ' ;\n'
	scriptCustomExec += 'cp -r ' + self.scriptDir + 'init_Lampp.sh' + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + os.path.join(self.ciwsRootDir, "cert/" ) + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'init.sh' + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'end_Lampp.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'shutdown_ws.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
	scriptCustomExec += 'mkdir ' +  os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' ;\n'
 	scriptCustomExec += 'cd ' +  os.path.join(self.customDir, "chroot/tmp")+'\n'
 	scriptCustomExec += 'wget ' + self.entryLocalMirror +"/" + self.cms  + ' \n'
 	scriptCustomExec += 'tar -xzf ' + self.cms + ' -C ' +  os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' \n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'cooperation-iws-wui.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'chmod -R 777 ' + os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' ;\n'
 	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/init.sh")   + ' ;\n'
 	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/init_Lampp.sh")   + ' ;\n'
 	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/end_Lampp.sh")   + ' ;\n'
	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/shutdown_ws.sh")   + ' ;\n'
	scriptCustomExec += 'chmod 777 ' + os.path.join(self.customDir, "chroot/tmp/cooperation-iws-wui.sh")   + ' ;\n'
	if self.ciwsOsType == "Client":
		scriptCustomExec += 'cp -r ' + os.path.join(self.ciwsRootDir, "artwork/client/" ) + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	
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
       
        modExecScrChroot = '#!/bin/sh\n\ncd /tmp ;\n'
	modExecScrChroot = 'export DEBIAN_FRONTEND=noninteractive\n'
	modExecScrChroot += 'export DISPLAY=127.0.0.1:5.0 \n'
 	modExecScrChroot += 'export LC_ALL=C \n'
 	modExecScrChroot += 'bash \"/tmp/init.sh\"' + ' ;\n '
 	modExecScr = '#!/bin/sh\n\n'
        if self.artwork != "":
		modExecScr += 'chmod +x \"' + os.path.join(self.ciwsRootDir, "artwork/"+self.artwork+".artscript")+ '\"' + ' ;\n '
		modExecScr += 'bash \"' + os.path.join(self.ciwsRootDir, "artwork/"+self.artwork+".artscript")+ '\"' + ' ;\n '
	modExecLamppChroot = '#!/bin/sh\n\ncd /tmp ;\n'
	modExecLamppChroot = 'export DEBIAN_FRONTEND=noninteractive\n'
	modExecLamppChroot += 'export DISPLAY=127.0.0.1:5.0 \n'
 	modExecLamppChroot += 'export LC_ALL=C \n'
 		

	if self.execModulesEnabled == True:
            print _('Running modules...')
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
                    if re.search('.kmod', ext):
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
                        modExecLamppChroot += 'echo -------------------------------------------------\n'
                        modExecLamppChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecLamppChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecLamppChroot += 'echo -------------------------------------------------\n'
                        modExecLamppChroot += 'echo -------------------------------------------------\n'
                        modExecLamppChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n'
	    if self.ReqApache == "A":    
		modExecLamppChroot += 'bash \"/tmp/init_Lampp.sh\"' + ' ;\n '
		modExecLamppChroot += 'bash \"/tmp/cooperation-iws-wui.sh\"' + ' ;\n '
	    if self.artwork != "":  
		modExecScrChroot += 'bash \"/tmp/artwork.amod\"' + ' ;\n '
	    if self.encryption != "disabled":
		os.popen('sed -i "s/quiet splash//g" ' + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg")) 
		if self.debDist == 'hardy':
			print "Updating Live-initramfs for crypt: Hardy"
			modExecLamppChroot += 'apt-get install --assume-yes --force-yes aespipe \n'
			modExecLamppChroot += 'sed -i \'231s/root/$(basename ${fspath})/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'236s/\/sbin\/losetup/\/$root\/sbin\/losetup/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'230s/^/echo $(basename ${fspath}) | grep -q "home-sn" || echo $(basename ${fspath}) | grep -q "ciws-sn" \&\& root="root"  /\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		#modExecLamppChroot += 'sed -i \'1218s/try_snap/echo try_snap \&\& try_snap/\' /usr/share/initramfs-tools/scripts/live\n' 
			#modExecLamppChroot += 'sed -i \'889s/^/echo "snapdata:$snapdata" /\' /usr/share/initramfs-tools/scripts/live\n' 
			modExecLamppChroot += 'sed -i \'959s/do_snap_copy "${dev}" "${snap_mount}" "${snap_type}"/mount -t $(get_fstype "${dev}") -o rw,noatime "${dev}" "${rootmnt}\/home"/\' /usr/share/initramfs-tools/scripts/live\n' 
			modExecLamppChroot += 'sed -i \'345s/ro/rw/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'1364s/ro/rw/\' /usr/share/initramfs-tools/scripts/live\n' 
	   		modExecLamppChroot += 'sed -i \'902s/${snapback}/${mountpoint}/\' /usr/share/initramfs-tools/scripts/live\n' 
	   		
	   	elif self.debDist == 'intrepid':
			print "Updating Live-initramfs for crypt: Intrepid"
			modExecLamppChroot += 'apt-get install --assume-yes --force-yes aespipe \n'
			modExecLamppChroot += 'sed -i \'231s/root/$(basename ${fspath})/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'236s/\/sbin\/losetup/\/$root\/sbin\/losetup/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'230s/^/echo $(basename ${fspath}) | grep -q "home-sn" || echo $(basename ${fspath}) | grep -q "ciws-sn" \&\& root="root"  /\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		#modExecLamppChroot += 'sed -i \'1218s/try_snap/echo try_snap \&\& try_snap/\' /usr/share/initramfs-tools/scripts/live\n' 
			#modExecLamppChroot += 'sed -i \'889s/^/echo "snapdata:$snapdata" /\' /usr/share/initramfs-tools/scripts/live\n' 
			modExecLamppChroot += 'sed -i \'959s/do_snap_copy "${dev}" "${snap_mount}" "${snap_type}"/mount -t $(get_fstype "${dev}") -o rw,noatime "${dev}" "${rootmnt}\/home"/\' /usr/share/initramfs-tools/scripts/live\n' 
			modExecLamppChroot += 'sed -i \'345s/ro/rw/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'1364s/ro/rw/\' /usr/share/initramfs-tools/scripts/live\n' 
	   		modExecLamppChroot += 'sed -i \'902s/${snapback}/${mountpoint}/\' /usr/share/initramfs-tools/scripts/live\n' 
	   		
	   	else:
			print "Updating Live-initramfs for crypt: Debian"
		    	modExecLamppChroot += 'apt-get install --assume-yes --force-yes aespipe \n'
			modExecLamppChroot += 'sed -i \'231s/root/$(basename ${fspath})/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'236s/\/sbin\/losetup/\/$root\/sbin\/losetup/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'230s/^/echo $(basename ${fspath}) | grep -q "home-sn" || echo $(basename ${fspath}) | grep -q "ciws-sn" \&\& root="root"  /\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		#modExecLamppChroot += 'sed -i \'1218s/try_snap/echo try_snap \&\& try_snap/\' /usr/share/initramfs-tools/scripts/live\n' 
			#modExecLamppChroot += 'sed -i \'889s/^/echo "snapdata:$snapdata" /\' /usr/share/initramfs-tools/scripts/live\n' 
			modExecLamppChroot += 'sed -i \'959s/do_snap_copy "${dev}" "${snap_mount}" "${snap_type}"/mount -t $(get_fstype "${dev}") -o rw,noatime "${dev}" "${rootmnt}\/home"/\' /usr/share/initramfs-tools/scripts/live\n' 
			modExecLamppChroot += 'sed -i \'345s/ro/rw/\' /usr/share/initramfs-tools/scripts/live-helpers\n' 
	   		modExecLamppChroot += 'sed -i \'1364s/ro/rw/\' /usr/share/initramfs-tools/scripts/live\n' 
	   		modExecLamppChroot += 'sed -i \'902s/${snapback}/${mountpoint}/\' /usr/share/initramfs-tools/scripts/live\n' 
	   		
            modExecLamppChroot += 'echo Running Core:  \n'
	    
            for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.rmod', ext):
                        modExecLamppChroot += 'echo -------------------------------------------------\n'
                        modExecLamppChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecLamppChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecLamppChroot += 'echo -------------------------------------------------\n'
                        modExecLamppChroot += 'echo -------------------------------------------------\n'
                        modExecLamppChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n '
	   
            
            modExecScr += '\necho \'--------------------\'\necho \'Modules Finished...\'\n'
            #modExecScr += '\n read ok < /dev/tty\n'
            modExecLamppChroot += '\necho \'--------------------\'\necho \'Modules Finished...\'\n'
            modExecLamppChroot += 'echo Running Core_end \n'
            modExecLamppChroot += 'bash \"/tmp/end_Lampp.sh\"' + ' ;\n '
	    modExecLamppChroot += 'sleep 10\n'
	    
	    
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
        fModExecChroot=open(os.path.join(self.customDir, "chroot/tmp/lampp-exec.sh"), 'w')
        fModExecChroot.write(modExecLamppChroot)
        fModExecChroot.close()
        os.popen('chmod a+x ' + os.path.join(self.customDir, "chroot/tmp/lampp-exec.sh"))
        os.popen('echo "normal" > '+os.path.join(self.customDir, "chroot/tmp/in_chroot"))
   	   	
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
	if commands.getoutput('cat '  +  os.path.join(self.customDir, "chroot/tmp/in_chroot")  + ' | grep \'normal\'') != '':        
		os.system('chroot \"' + os.path.join(self.customDir, "chroot/") + '\" /tmp/lampp-exec.sh')
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
        #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/resolv.conf") + '\"')
        # umount /proc
        print _("Umounting /proc...")
        os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
	# umount /sys
	print _("Umounting /sys...")
        #os.popen('umount \"' + os.path.join(self.customDir, "chroot/sys/") + '\"')
	# umount /dev/pts
	print _("Umounting /dev/pts...")
        #os.popen('umount \"' + os.path.join(self.customDir, "chroot/dev/pts") + '\"')
	self.casperPathUpdated = commands.getoutput('cat '  +  os.path.join(self.customDir, "chroot/tmp/casper_path_updated"))
        os.popen('mv \"' + os.path.join(self.customDir, "remaster/casper") + '\" \"' + os.path.join(self.customDir, "remaster/"+self.casperPathUpdated ) + '\"')
	self.casperPath = self.casperPathUpdated
        # manual software
        # check for manual install
        if self.manualInstall == True:
            print _("Manually installing all existing .deb archives in /var/cache/apt/archives...")
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' dpkg -i -R /var/cache/apt/archives/ 1>&2 2>/dev/null')
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get clean')
            os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + ' apt-get autoclean')

	#END SCRIPTS
	if self.reqXnest == True: 
		scriptEndExec = 'bash \"' + self.scriptDir + 'xnest_end.sh\"' + ' ;\n '
	 	fscriptEndExec=open(os.path.join(self.customDir, "scriptEndExec.sh"), 'w')
		fscriptEndExec.write(scriptEndExec)
		fscriptEndExec.close()
		os.popen('chmod a+x ' + os.path.join(self.customDir, "scriptEndExec.sh"))
		os.popen('bash \"' + os.path.join(self.customDir, "scriptEndExec.sh") + '\"')
	
    def customizeNodebuntu(self):

	if self.execModulesEnabled == True:
	    print _('Running modules...')
	    modExecScr = '#!/bin/bash\n\n'
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
 	    modExecScr += '\necho \'--------------------\'\necho \'Modules Finished...\'\n'
	    fModExec=open(os.path.join(self.customDir, "scripts/module-exec.sh"), 'w')
            fModExec.write(modExecScr)
            fModExec.close()
	    os.popen('chmod a+x ' + os.path.join(self.customDir, "scripts/module-exec.sh"))
    
	    os.system('bash \"' + os.path.join(self.customDir, "scripts/module-exec.sh")+ '\"')
	

# ---------- Build ---------- #
    def build(self):

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
	if self.encryption != "disabled":		
		fscriptEncryption=open(os.path.join(self.customDir, "/tmp/encryption"), 'w')
		fscriptEncryption.write(self.encryption)
		fscriptEncryption.close()
		fscriptPassphrase=open(os.path.join(self.customDir, "/tmp/squashfspwd"), 'w')
		fscriptPassphrase.write(self.encryptionpassphrase)
		fscriptPassphrase.close()
		os.system('bash \"' + self.scriptDir + '/encrypt.sh\"')
		#os.popen('sed -i \"s/boot=live/boot=live encryption=' + self.encryption + '/g\" ' + os.path.join(self.customDir, "remaster/isolinux/menu.cfg") ) 
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
	            os.popen('mkisofs -o \"' + self.buildLiveCdFilename + '\" -b \"isolinux/isolinux.bin\" -c \"isolinux/boot.cat\" -no-emul-boot -boot-load-size 4 -boot-info-table -V \"' + self.LiveCdDescription + '\" -cache-inodes -r -J -l \"' + os.path.join(self.customDir, "remaster") + '\"')
	        elif self.LiveCdArch == "PowerPC":
	            print _("Building PowerPC ISO...")
	            os.popen('mkisofs  -r -V \"' + self.LiveCdDescription + '\" --netatalk -hfs -probe -map \"' + self.hfsMap + '\" -chrp-boot -iso-level 2 -part -no-desktop -hfs-bless ' + '\"' + os.path.join(self.customDir, "remaster/install") + '\" -o \"' + self.buildLiveCdFilename + '\" \"' + os.path.join(self.customDir, "remaster") + '\"')
	        elif self.LiveCdArch == "x86_64":
	            print _("Building x86_64 ISO...")
	            os.popen('mkisofs -r -o \"' + self.buildLiveCdFilename + '\" -b \"isolinux/isolinux.bin\" -c \"isolinux/boot.cat\" -no-emul-boot -V \"' + self.LiveCdDescription + '\" -J -l \"' + os.path.join(self.customDir, "remaster") + '\"')
	
		
		
	# print status message
        statusMsgFinish = _('     <b>Finished.</b>     ')
        statusMsgISO = _('      <b>Finished.</b> ISO located at: ')
        print "\033[1m "+ self.buildLiveCdFilename + "\033[0m\n"

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
    rec = Reconstructor()
      
       

