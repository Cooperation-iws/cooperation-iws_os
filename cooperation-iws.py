#!/usr/bin/env python
#
# Cooperation-iws --
#    Copyright (c) 2008-2011  Cooperation-iws Team 
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


class Cooperationiws:


# ---------- INIT ---------- # 
  
    def __init__(self):
        # vars
 	self.appName = "Cooperation-iws"
        self.appVersion = "0.9.2"
        self.updateId = "325"
        self.cdUbuntuVersion = ''
        self.moduleDir = os.getcwd() + '/modules/'
	self.scriptDir = os.getcwd() + '/scripts/'
	self.xmlDir = os.getcwd() + '/xml/'
	self.phpDir = os.getcwd() + '/lib/php/'
	self.ciwsRootDir = os.getcwd()
        self.mountDir = '/media/cdrom'
        self.tmpDir = "tmp"
        self.customDir = ""
        self.createRemasterDir = False
        self.createCustomRoot = False
        self.createInitrdRoot = False
        self.isoFilename = ""
        self.buildLiveCdFilename = ''
        self.f = sys.stdout
        self.treeModel = None
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
        self.execModulesEnabled = False
        # time command for timing operations
        
        self.ReqApache = "B"
	self.nodebuntu = False
	self.scriptParams = '#!/bin/bash\n\n'

        APPDOMAIN='cooperationiws'
        LANGDIR='lang'
        # locale
        locale.setlocale(locale.LC_ALL, '')
        gettext.bindtextdomain(APPDOMAIN, LANGDIR)
        gettext.textdomain(APPDOMAIN)
        gettext.install(APPDOMAIN, LANGDIR, unicode=1)

 	# print copyright
        print " "
        print self.appName + " -- (c) Cooperation-iws Team, 2011"
        print "       Version: " + self.appVersion
        print "        http://www.cooperation-iws.eu"
        print " "
	
        #command options parser
        parser = optparse.OptionParser()
        
	parser.add_option("-c", "--commandline",
                    action="store_true", dest="commandline", default=False,
                    help="command line option")
	parser.add_option("-l", "--listmodules",
                    action="store_true", dest="listmodules", default=False,
                    help="list all modules")
	parser.add_option( "--directory",
                    dest="directory", default="" ,
                    help="Install directory")
	#Deprecated, only here for compatibility purpose
	parser.add_option( "--createdirectories", action="store_true",
                    dest="createdirectories", default=False ,
                    help="Deprecated")
	parser.add_option( "--isofile", 
                    dest="isofile", default="" ,
                    help="Initial Cd image")
	parser.add_option( "--modulesfile", 
                    dest="modulesfile", default="bash/templates/empty" ,
                    help="Modules list file")
	parser.add_option( "--artwork", 
                    dest="artwork", default="" ,
                    help="Kind of Artwork")
	parser.add_option( "--cms", 
                    dest="cms", default="" ,
                    help="Kind of CMS")
	parser.add_option( "--aufs", action="store_true",
                    dest="aufs", default=False ,
                    help="Use aufs")
	parser.add_option( "--webappmirror", 
                    dest="webappmirror", default="http://localhost:81" ,
                    help="Web applictions mirror url")
	parser.add_option( "--debmirror", 
                    dest="debmirror", default="ftp://ftp.proxad.net/mirrors/ftp.ubuntu.com/ubuntu/" ,
                    help="Debian packages mirror url")
	parser.add_option( "--debmirrornonfree", 
                    dest="debmirrorNonfree", default="http://packages.medibuntu.org/" ,
                    help="Non Free Debian packages mirror url, medibuntu, debian-multimedia, ...")
	parser.add_option( "--debmirrorsecurity", 
                    dest="debmirrorsecurity", default="http://security.debian.org/" ,
                    help="Security packages for Debian OS")
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
                    help="Disable autologin to your system")
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
	parser.add_option( "--arch", 
                    dest="arch", default="686" ,
                    help="Debian architecture (686, amd64)")
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
	parser.add_option( "--encryptionpassphrase", 
                    dest="encryptionpassphrase", default="01234567890123456789",
                    help="Debian live encryption passphrase")
	parser.add_option( "--isotype", 
                    dest="isotype", default="" ,
                    help="Type of Input Iso image")
        (options, args) = parser.parse_args()
        
        print _('INFO: Text only version...')

	#Init parameters and variables

	self.commandLine = True

	if options.listmodules == True:
		self.listModules()
		exit(0)
	self.customDir = options.directory
	self.createRemasterDir = True
	self.createCustomRoot = True
	self.isoFilename = options.isofile     
	if options.modulesfile == "":
		print _("You need to specify a Modules list file")
		exit(0)
	self.moduleFilename = options.modulesfile  
	self.artwork = options.artwork       
	self.ciwsCms = options.cms
	self.checkbuttonAufs = options.aufs
	self.checkbuttonLocalMirror = True
	self.ciwsDepot = options.webappmirror
	self.comboboxWebAppMirrors = ""
	self.user = options.username
	if self.user != "" and self.checkUserName() == False:
		print _("You need to specify a username with at least 6 characters in this field of characters: [a-z0-9_-*.]")
		exit(0)
	self.password = options.password
	self.userFull = options.userfullname
	self.host = options.host
	self.disableAutologin = options.disautologin
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
	self.isoType = options.isotype
	self.LiveCdArch=options.arch

	#Init the app
        self.commandLineGui()


# ---------- Verify Custom Dir has been created ---------- #
    
    def checkCustomDir(self):
        if self.customDir == "":
            return False
        else:
            if os.path.exists(self.customDir) == False:
                os.makedirs(self.customDir)
            return True


# ---------- Verify Username is correctly formated ---------- #    
       
    def checkUserName(self):
	if int(commands.getoutput('echo ' + self.user + ' | wc -m')) > 6 :
		if commands.getoutput('echo '  + self.user + '| grep \'^[a-z0-9_-*.]*$\'') != '':
	    		return True
		else:
	    		return False
        else:
            	return False


# ---------- Check dependencies ---------- #

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
        if commands.getoutput('which rsync') == '':
            print _('rsync NOT FOUND (needed for Remastering ISO)')
            dependList += 'rsync\n'
	if commands.getoutput('which syslinux') == '':
            print _('syslinux NOT FOUND (needed for Remastering ISO)')
            dependList += 'syslinux\n'
	if commands.getoutput('which mtools') == '':
            print _('mtools NOT FOUND (needed for Remastering ISO)')
            dependList += 'mtools\n'
	if dependList != '' or wgetlist != '':
            print _('\nThe following dependencies are not met: ')
            print dependList
            print _('Please install the dependencies.')
            exit(0)
        

# ---------- Detect Live CD version ---------- #
       
    def checkLiveCdVersion(self):
	    print "\nLive CD type is:"
            if  self.debianLive == True:
		self.casperPath = 'live'	
		self.distVers = self.DebianLiveReleaseType
		self.distVariant = self.DebianLiveReleaseType		
		print "\033[1m Edubuntu 8.10 Live CD\033[0m\n"
	    elif  self.isoType == "edubuntu_8.10":
		self.casperPath = 'casper'
		self.distType = 'debian_derivative'	
		self.distVers = 'intrepid'
		self.distVariant = 'edubuntu_8.10'
	    elif  self.isoType == "edubuntu_9.04":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'jaunty'
		self.distVariant = 'edubuntu_9.04'		
		print "\033[1m Edubuntu 8.10 Live CD\033[0m\n"	
	    elif  self.isoType == "eeebuntu_8.10":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'intrepid'
		self.distVariant = 'eeebuntu_8.10'		
		print "\033[1m Eeebuntu 8.10 Live CD\033[0m\n" 
	    elif  self.isoType == "studio_8.10":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'intrepid'
		self.distVariant = 'studio_8.10'		
		print "\033[1m Ubuntu Studio 8.10 Live CD\033[0m\n" 
	    elif  self.isoType == "studio_9.04":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'jaunty'
		self.distVariant = 'studio_9.04'		
		print "\033[1m Ubuntu Studio 9.04 Live CD\033[0m\n" 
	    elif  self.isoType == "netbook-remix_8.10":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'intrepid'
		self.distVariant = 'netbook-remix_8.10'		
		print "\033[1m Netbook remix 8.10 Live CD\033[0m\n"
	    elif  self.isoType == "nubuntu_8.10":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'intrepid'
		self.distVariant = 'nubuntu_8.10'		
		print "\033[1m Nbuntu8.10 Live CD\033[0m\n"
	    elif  self.isoType == "maryan_8.04.1":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'hardy'
		self.distVariant = 'maryan_8.04.1'		
		print "\033[1m Maryan 8.10 Live CD\033[0m\n"	
	    elif  self.isoType == "opengeu_8.04.1":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'hardy'
		self.distVariant = 'opengeu_8.04.1'		
		print "\033[1m Opengeu 8.04.1 Live CD\033[0m\n"
            elif  self.isoType == "ozos-0.9":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'hardy'
		self.distVariant = 'ozos-0.9'		
		print "\033[1m Ozos 0.9 Live CD\033[0m\n"
            elif  self.isoType == "poseidon-3.1":
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'hardy'
		self.distVariant = 'poseidon-3.1'		
		print "\033[1m Poseidon 3.1 Live CD\033[0m\n"		
	    elif os.path.exists(os.path.join(self.customDir, "remaster/boot/grub")) and commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/boot/grub/menu.lst") + '| grep \'Webconverger\'') != '':
		self.casperPath = 'live'
		self.distType = 'debian_derivative'	
		self.distVers = 'lenny'
		self.distVariant = 'webconverger'	
		print "\033[1m Webconverger Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + ' | grep \'Elyssa\'') != '':
		self.casperPath = 'casper'
		self.distType = 'debian_derivative'	
		self.distVers = 'hardy'
		self.distVariant = 'mint'			
		print "\033[1m Linux Mint 5 Elyssa\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + ' | grep \'nUbuntu\'') != '' and commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.04\'') != '':
		self.casperPath = 'casper'
		self.distType = 'debian_derivative'	
		self.distVers = 'hardy'
		self.distVariant = 'nUbuntu'			
		print "\033[1m  nUbuntu 8.04\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'etch\'') != '':
		self.casperPath = 'casper'
		self.distVers = 'etch'
		self.distVariant = 'etch'			
		print "\033[1m Debian Etch Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'20070727\'') != '':
		self.casperPath = 'casper'
		self.distType = 'debian_derivative'	
		self.distVers = 'studio64'
		self.distVariant = 'studio64'			
		print "\033[1m Studio 64 Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.04\'') != '' or commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'hardy\'') != '':
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'hardy'
		self.distVariant = 'hardy'		
		print "\033[1m Ubuntu 8.04 Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'9.04\'') != '':
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'jaunty'
		self.distVariant = 'jaunty'		
		print "\033[1m Ubuntu 9.04 Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + ' | grep \'8.10\'') != '':
		self.casperPath = 'casper'	
		self.distType = 'debian_derivative'	
		self.distVers = 'intrepid'
		self.distVariant = 'intrepid'		
		print "\033[1m Ubuntu 8.10 Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'lenny\'') != '':
		self.casperPath = 'live'
		self.distType = 'debian_derivative'	
		self.distVers = 'lenny'
		self.distVariant = 'lenny'	
		print "Debian Lenny Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") + '| grep \'vyatta\'') != '':
		self.casperPath = 'live'
		self.distType = 'debian_derivative'	
		self.distVers = 'lenny'
		self.distVariant = 'vyatta'	
		print "\033[1m Vyatta Live CD\033[0m\n"
	    elif commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'sid\'') != '':	    	
		self.distVers = 'sid'			
		self.distType = 'debian_derivative'	
		self.casperPath = 'live'
		self.distVariant = 'sid'
		print "\033[1m Debian Sid Live CD\033[0m\n"
	    	
	    else:
		print "Live CD not detected, Aborting"


# ---------- Handle Module Properties ---------- #
     
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

        # regex through module to get info
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

                            
# ---------- List Modules ---------- #

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
                        
                        modPath = os.path.join(self.moduleDir, f)

                        # Refactoring! triplem
                        modProps = self.getModuleProperties(f)
                        modSubCategory = modProps[self.modSubCategoryKey]

                        if self.modules.has_key(modProps[self.modNameKey]):
                            print "The module is already present"

                        self.modules[modProps[self.modNameKey]] = modProps

                        print "\033[1m "+ str(count) + "| "+ str(modProps[self.modNameKey]) + "\033[0m\n"
                        print str(os.path.basename(modPath))  + " | " +str(modProps[self.modDescriptionKey]) + " | "  +str(modProps[self.modAuthorKey]) + " | "+ str(modProps[self.modVersionKey]) + " | "  + str(bool(modProps[self.modReqApache]))+ " | " +str(bool(modProps[self.modRunInChrootKey]))+ "\n"
						
                       	count +=1


# ---------- Parse Modules ---------- #
			
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


# ---------- Copy Modules ---------- #
    
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
   

# ---------- Main thread ---------- #
    
    def commandLineGui(self):
	self.checkDependencies()
	
	if self.checkCustomDir() == True:
		if self.debianLive == True:			
			self.setupDebianLive()           		
		else:
			self.setupWorkingDirectory()
		self.cmdLoadModules()
		os.popen("cp "+self.moduleFilename + " " + os.path.join(self.customDir, "chroot") + "/tmp/app_params")
		os.popen("chmod +x " + os.path.join(self.customDir, "chroot") + "/tmp/app_params")
		os.popen("echo \"A\" > "+ os.path.join(self.customDir, "chroot") + "/tmp/silent")
		print _('Proceeding to customization...')		
		self.customize()		
		
		if self.silent == False:
			self.launchTerminal()
		self.endInstall()
		self.installType = "Cd"
		self.LiveCdDescription="Cooperation-iws Live CD"
		
		self.buildIso=True		
		self.buildSquashRoot = True
		self.buildUsb = False
		self.buildLiveCdFilename = os.path.join(self.customDir, self.isoname)
		self.LiveCdDescription = "cooperation-iws-custom"
		
		self.build()
		
	
	exit(0)


# ---------- Setup ---------- #

    def setupWorkingDirectory(self):
        print _("INFO: Setting up working directory...")

	if os.path.exists(self.mountDir) == False:
		    print _('INFO: Creating mount directory...')
		    os.makedirs(self.mountDir)
		
	if not os.path.exists(os.path.join(self.customDir, "scripts")):
		os.makedirs(os.path.join(self.customDir, "scripts"))        
	
	#create shutdown_ws script
	modExecShutdownWs = '#!/bin/sh\n'
	fModExec=open(os.path.join(self.customDir, "scripts/shutdown_ws.sh"), 'w')
	fModExec.write(modExecShutdownWs)
	fModExec.close()

	# remaster dir
        if self.createRemasterDir == True:
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
	
	# check version of the input livecd    
	self.checkLiveCdVersion()

        # custom root dir
        if self.createCustomRoot == True:
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
	      
	print _("Finished setting up working directory...")
        print " "
        return False


# ---------- Debian Live option ---------- #
    
    def setupDebianLive(self):
	
        
	os.system('bash \"' + self.scriptDir + '/debianlive.sh\" \"' + self.DebianLiveType + '\" \"' + self.DebianLiveReleaseType + '\" \"' + self.LiveCdArch + '\" \"' + self.debMirror + '\" \"' + self.debMirrorSecurity + '\" \"' + self.keyLang + '\" \"' + self.locale + '\" \"' + self.host + '\" \"' + self.user + '\" \"' + self.encryption + '\" \"' + self.encryptionpassphrase + '\" \"' + self.customDir + '\" \"' + self.ciwsDepot + '\" ')

	
	self.casperPath = 'live'
	if commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'etch\'') != '':	    	
			self.distVers = 'etch'	
	if commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'lenny\'') != '':	    	
			self.distVers = 'lenny'			
	if commands.getoutput('cat '  + os.path.join(self.customDir, "remaster/isolinux/f1.txt") + '| grep \'squeeze\'') != '':	    	
			self.distVers = 'squeeze'	
	
	self.checkLiveCdVersion()
 	
	
# ---------- Customize Live ---------- #

    def customize(self):
        print _("INFO: Customizing...")
	
        #Set Global variable for chroot

	self.scriptParams +='LIVEUSER=\"' + self.user + '\"\n'

	self.scriptParams +='LIVEUSER_FULL=\"' + self.userFull + '\"\n'
	
	self.scriptParams +='CASPER_PATH=\"' + self.casperPath + '\"\n'
	
	self.scriptParams +='DEB_DIST=\"' + self.distVers + '\"\n'

        self.scriptParams +='DEB_MIRROR_PATH=\"' + self.debMirror + '\"\n'

        self.scriptParams +='DEBNONFREE_MIRROR_PATH=\"' + self.debMirrorNonfree + '\"\n'

        self.scriptParams +='DEB_MIRROR_SECURITY_PATH=\"' + self.debMirrorSecurity + '\"\n'

        self.scriptParams +='OS_TYPE=\"' + self.ciwsOsType + '\"\n'

        self.scriptParams +='HOSTNAME=\"' + self.host + '\"\n'

        self.scriptParams +='CLEAR_HOST_PWD=\"' + self.password + '\"\n'

        crypt_pass = commands.getoutput('mkpasswd -s ' + self.password )			
	while  commands.getoutput(' echo  ' + crypt_pass + ' | grep "[/.]" ') != '' :
        	crypt_pass = commands.getoutput('mkpasswd -s ' + self.password )
	self.scriptParams +='CRYPT_HOST_PWD=\"' + crypt_pass + '\"\n'

	self.scriptParams +='URL_CIWS_DEPOT=\"' + self.ciwsDepot + '\"\n'

	if self.disableAutologin == True:
		self.scriptParams +='DISABLE_AUTOLOGIN=\"1\"\n'

	if self.encryption != "disabled":
        	self.scriptParams +='ENCRYPTION=\"1\"\n'
        
	fscriptParams=open(os.path.join(self.customDir, "chroot") + '/tmp/scripts_params', 'w')
	fscriptParams.write(self.scriptParams)
	fscriptParams.close()
	


	fcasper=open("/tmp/casper_path", 'w')
	fcasper.write(self.casperPath)
	fcasper.close()

	
	fMirrorUrl=open("/tmp/url_mirroir", 'w')
        fMirrorUrl.write(self.ciwsDepot)
        fMirrorUrl.close() 


	#Share Working directory
	fWorkDir=open('/tmp/working-directory', 'w')
        fWorkDir.write(self.customDir)
        fWorkDir.close()
	#Share Script Root dir	
	fWorkDir=open('/tmp/ciws-root-directory', 'w')
        fWorkDir.write(self.ciwsRootDir)
        fWorkDir.close()

	

	if self.ciwsCms == "Wordpress-goo":
		self.cms = "cooperation-wui-wordpress-def-0.7.0-081130.tar.gz"
	else:
		self.cms = "cooperation-wui-joomla-def-0.8.0-090306.tar.gz"

  	if self.checkbuttonAufs == True:
		os.popen('sed -i "s/splash/splash union=aufs/g" ' + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg")) 
		
	#Changing Casper name for ISO
	if self.casperPath == "casper" :        
		os.popen('mv \"' + os.path.join(self.customDir, "remaster/"+self.casperPath) + '\" \"' + os.path.join(self.customDir, "remaster/live" ) + '\"')
	self.casperPath = "live"

	os.popen('sed -i "s/vmlinuz1/vmlinuz/g" ' + os.path.join(self.customDir, "remaster/isolinux/menu.cfg")) 
	os.popen('sed -i "s/initrd=\/live\/initrd1.img/initrd=\/live\/initrd.gz keyb='+self.keyLang+'/g" ' + os.path.join(self.customDir, "remaster/isolinux/menu.cfg")) 
	os.popen('sed -i "s/splash//g" ' + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg")) 
		
	

	scriptCustomExec = '#!/bin/bash\n\n'
	scriptCustomExec += 'cp -r ' + self.scriptDir + 'init_Lampp.sh' + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + os.path.join(self.ciwsRootDir, "cert/" ) + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'init.sh' + ' ' + os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'end_Lampp.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'shutdown_ws.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
	scriptCustomExec += 'cp -r ' + self.xmlDir + '/*.xml' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
	scriptCustomExec += 'cp -r ' + self.phpDir + '/generate_xml_server_desc.php' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
	scriptCustomExec += 'mkdir ' +  os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' ;\n'
 	scriptCustomExec += 'cd ' +  os.path.join(self.customDir, "chroot/tmp")+'\n'
 	scriptCustomExec += 'wget ' + self.ciwsDepot +"/" + self.cms  + ' \n'
 	scriptCustomExec += 'tar -xzf ' + self.cms + ' -C ' +  os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' \n'
 	scriptCustomExec += 'cp -r ' + self.scriptDir + 'cooperation-iws-wui.sh' + ' ' +  os.path.join(self.customDir, "chroot/tmp/")   + ' ;\n'
 	scriptCustomExec += 'chmod -R 777 ' + os.path.join(self.customDir, "chroot/tmp/cooperation-wui")   + ' ;\n'
 	scriptCustomExec += 'chmod +x ' + os.path.join(self.customDir, "chroot/tmp/init.sh")   + ' ;\n'
 	scriptCustomExec += 'chmod +x ' + os.path.join(self.customDir, "chroot/tmp/init_Lampp.sh")   + ' ;\n'
 	scriptCustomExec += 'chmod +x ' + os.path.join(self.customDir, "chroot/tmp/end_Lampp.sh")   + ' ;\n'
	scriptCustomExec += 'chmod +x ' + os.path.join(self.customDir, "chroot/tmp/shutdown_ws.sh")   + ' ;\n'
	scriptCustomExec += 'chmod +x ' + os.path.join(self.customDir, "chroot/tmp/cooperation-iws-wui.sh")   + ' ;\n'
	scriptCustomExec += 'chmod +x ' + os.path.join(self.customDir, "chroot/tmp/generate_xml_server_desc.php")   + ' ;\n'
	scriptCustomExec += 'chmod 755 ' + os.path.join(self.customDir, "chroot/tmp/*.xml")   + ' ;\n'
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
	    
	
	
	

        # run modules
        # HACK: check for run on boot scripts and clear previous if new ones selected
	
       
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
			modExecScr += 'echo "'+ os.path.basename(execMod) +'" >> /tmp/ls.log \n'
                        modExecScr += 'bash \"' + os.path.join(self.customDir, "scripts/") + os.path.basename(execMod) + '\"' + ';\n '
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
                        modExecScrChroot += 'echo "'+ os.path.basename(execMod) +'" >> /tmp/ls.log \n'
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
                        modExecLamppChroot += 'echo "'+ os.path.basename(execMod) +'" >> /tmp/ls.log \n'
                        modExecLamppChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n'
	    if self.ReqApache == "A":    
		modExecLamppChroot += 'bash \"/tmp/init_Lampp.sh\"' + ' ;\n '
		modExecLamppChroot += 'bash \"/tmp/cooperation-iws-wui.sh\"' + ' ;\n '
	    if self.artwork != "":  
		modExecScrChroot += 'bash \"/tmp/artwork.amod\"' + ' ;\n '
	    
	   		
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
	os.popen ('cp '	 + os.path.join(self.customDir, "chroot/tmp/ls.log") + ' '+self.customDir)        
	# cleanup
        #os.popen('cd \"' + os.path.join(self.customDir, "chroot/tmp/") + '\" ; ' + 'rm -Rf *.rmod 1>&2 2>/dev/null')
        # restore wgetrc
        print _("Restoring wgetrc configuration...")
        os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
        print _("Restoring hostname configuration...")
            
	os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
        os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')

        # umount /proc
        print _("Umounting /proc...")
        os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
	# umount /sys
	print _("Umounting /sys...")
        #os.popen('umount \"' + os.path.join(self.customDir, "chroot/sys/") + '\"')
	# umount /dev/pts
	print _("Umounting /dev/pts...")
        #os.popen('umount \"' + os.path.join(self.customDir, "chroot/dev/pts") + '\"')
	

	
        	

# ---------- Launch chroot terminal if install is not silent ---------- #

    def launchTerminal(self):
        try:
            # setup environment
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
            # remove dns info
            print _("Restoring hostname configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
            
            
	except Exception, detail:
            # restore settings
            # restore wgetrc
            print _("Restoring wgetrc configuration...")
            os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')
            # remove apt.conf
            #print _("Removing apt.conf configuration...")
            #os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/etc/apt/apt.conf") + '\"')
            # remove dns info
            
            
            # umount /proc
            print _("Umounting /proc...")
            os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')
            errText = _('Error launching terminal: ')
            print errText, detail
            pass

        return


# ---------- End of Install ---------- #

    def endInstall(self):
	print " "
	print _("INFO: Finishing customization...")
	print " "    		
	#Executing shutdown scripts outside chroot
	os.system('bash \"'+ os.path.join(self.customDir, "scripts/shutdown_ws.sh") + '\"')

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
	os.popen('chmod +x ' + os.path.join(self.customDir, "chroot/opt/ciws/share/lampp/config_post_install.sh"))
        os.system('chroot ' + os.path.join(self.customDir, "chroot") + ' /opt/ciws/share/lampp/config_post_install.sh')
  	os.system('chroot \"' + os.path.join(self.customDir,"chroot/") +'\" /tmp/shutdown_ws.sh')
	
	# cleanup
    	os.popen('cd \"' + os.path.join(self.customDir, "chroot/tmp/") + '\" ; ' + 'rm -Rf *.rmod 1>&2 2>/dev/null')
    	os.popen('rm -Rf \"' + os.path.join(self.customDir, "chroot/tmp/module-exec.sh") + '\" 1>&2 2>/dev/null')

    	# restore wgetrc
    	print _("Restoring wgetrc configuration...")
    	os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/wgetrc.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/wgetrc") + '\"')

    	# remove dns info
	print _("Restoring hostname configuration...")
        os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hosts.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hosts") + '\"')
        os.popen('mv -f \"' + os.path.join(self.customDir, "chroot/etc/hostname.orig") + '\" \"' + os.path.join(self.customDir, "chroot/etc/hostname") + '\"')

    	# umount /proc
    	print _("Umounting /proc...")
    	os.popen('umount \"' + os.path.join(self.customDir, "chroot/proc/") + '\"')


# ---------- Build ---------- #

    def build(self):

	print " "
	print _("INFO: Starting Build...")
	print " "
	# build squash root
	if self.buildSquashRoot == True:
	    # create squashfs root
	    if os.path.exists(os.path.join(self.customDir, "chroot")):
	        print _("Creating SquashFS chroot...")
	        print _("Updating File lists...")
	        q = ' dpkg-query -W --showformat=\'${Package} ${Version}\n\' '
	        os.popen('chroot \"' + os.path.join(self.customDir, "chroot/") + '\"' + q + ' > \"' + os.path.join(self.customDir, "remaster/" + self.casperPath + "/filesystem.manifest") + '\"' )
	        print _("Building SquashFS root...")
	        os.system('bash \"' + self.scriptDir + '/mksquashfs.sh\" \"' + self.customDir + '\" \"' + self.casperPath + '\"')
	   	
	if self.encryption != "disabled":		
		fscriptEncryption=open(os.path.join(self.customDir, "/tmp/encryption"), 'w')
		fscriptEncryption.write(self.encryption)
		fscriptEncryption.close()
		fscriptPassphrase=open(os.path.join(self.customDir, "/tmp/squashfspwd"), 'w')
		fscriptPassphrase.write(self.encryptionpassphrase)
		fscriptPassphrase.close()
		os.system('bash \"' + self.scriptDir + '/encrypt.sh\"')
		os.popen('sed -i \"s/boot=live/boot=live encryption=' + self.encryption + '/g\" ' + os.path.join(self.customDir, "remaster/isolinux/isolinux.cfg") ) 
	
	# build iso
	if self.buildIso == True:
	    # create iso
	    if os.path.exists(os.path.join(self.customDir, "remaster")):
	        print _("Creating ISO...")
	        # add disc id
	        
	        # update md5
	        print _("Updating md5 sums...")
	        os.popen('cd \"' + os.path.join(self.customDir, "remaster/") + '\"; ' + 'find . -type f -print0 | xargs -0 md5sum > md5sum.txt')
				        
		# remove existing iso
	        if os.path.exists(self.buildLiveCdFilename):
	            print _("Removing existing ISO...")
	            os.popen('rm -Rf \"' + self.buildLiveCdFilename + '\"')
	                        
	        # build iso according to architecture
	        if self.LiveCdArch == "686":
	            print _("Building x86 ISO...")
	            os.popen('mkisofs -o \"' + self.buildLiveCdFilename + '\" -b \"isolinux/isolinux.bin\" -c \"isolinux/boot.cat\" -no-emul-boot -boot-load-size 4 -boot-info-table -V \"' + self.LiveCdDescription + '\" -cache-inodes -r -J -l \"' + os.path.join(self.customDir, "remaster") + '\"')
	        elif self.LiveCdArch == "amd64":
	            print _("Building amd64 ISO...")
	            os.popen('mkisofs -r -o \"' + self.buildLiveCdFilename + '\" -b \"isolinux/isolinux.bin\" -c \"isolinux/boot.cat\" -no-emul-boot -V \"' + self.LiveCdDescription + '\" -J -l \"' + os.path.join(self.customDir, "remaster") + '\"')
		
	# print status message
       
        statusMsgISO = _('      Finished. ISO located at: ')
        print "\033[1m "+ statusMsgISO + "\033[0m"+ self.buildLiveCdFilename

        print  _("Build Complete...")


# ---------- MAIN ----------#

if __name__ == "__main__":
    APPDOMAIN='cooperationiws'
    LANGDIR='lang'
    # locale
    locale.setlocale(locale.LC_ALL, '')
    gettext.bindtextdomain(APPDOMAIN, LANGDIR)
    gettext.textdomain(APPDOMAIN)
    gettext.install(APPDOMAIN, LANGDIR, unicode=1)

    # check credentials
    rec = Cooperationiws()
      
       

