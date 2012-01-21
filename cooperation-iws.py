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

class Cooperationiws:


# ---------- INIT ---------- # 
  
    def __init__(self):
        # vars
 	self.appName = "Cooperation-iws"
        self.appVersion = "1.1.2"
        self.scriptDir = os.getcwd() + '/stages/'
	self.xmlDir = os.getcwd() + '/xml/'
	self.phpDir = os.getcwd() + '/lib/php/'
	self.artworkDir= os.getcwd() + '/artwork/'
	self.ciwsRootDir = os.getcwd()
        self.mountDir = '/media/cdrom'
        self.tmpDir = "tmp"
        self.customDir = ""
        self.createRemasterDir = False
        self.createCustomRoot = False
        self.createInitrdRoot = False
        self.isoFilename = ""
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
        self.execModulesEnabled = False
        self.casperPath = ""
        self.ReqApache = "B"
	self.scriptParams = '#!/bin/bash\n\n'
	self.buildIso=True		
	self.buildSquashRoot = True
	self.hardyStagesScriptsDir="lenny"	
	self.intrepidStagesScriptsDir="lenny"	
	self.jauntyStagesScriptsDir="lenny"	
	self.lennyStagesScriptsDir="lenny"	
	self.lucidStagesScriptsDir="wheezy"	
	self.squeezeStagesScriptsDir="wheezy"	
	self.wheezyStagesScriptsDir="wheezy"	
	
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
                    dest="artwork", default="default" ,
                    help="Artwork for system: [ wheezy | default | ciws_gnome ]")
	parser.add_option( "--cms", 
                    dest="cms", default="" ,
                    help="Kind of CMS")
	#Deprecated, only here for compatibility purpose
	parser.add_option( "--aufs", action="store_true",
                    dest="aufs", default=False ,
                    help="Deprecated")
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
	parser.add_option( "--timezone", 
                    dest="timezone", default="Europe/Paris" ,
                    help="Time zone as in /usr/share/localtime/*/*")
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
                    dest="debianLiveFlavor", default="gnome" ,
                    help="Debian flavor (xfce, gnome, kde)")
	parser.add_option( "--arch", 
                    dest="arch", default="686" ,
                    help="Debian architecture (686, amd64)")
	parser.add_option( "--encryption", 
                    dest="encryption", default="disabled",
                    help="Debian live encryption")
	parser.add_option( "--encryptionpassphrase", 
                    dest="encryptionpassphrase", default="01234567890123456789",
                    help="Debian live encryption passphrase")
	parser.add_option( "--dist", 
                    dest="dist", default="debian" ,
                    help="Linux distribution")
	parser.add_option( "--distvers", 
                    dest="distvers", default="lenny" ,
                    help="Version of the Linux distribution, hardy,intrepid,jaunty,lenny,wheezy")



        (options, args) = parser.parse_args()
        
        #Init parameters and variables

	self.commandLine = True
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
	self.checkbuttonLocalMirror = True
	self.ciwsDepot = options.webappmirror
	self.comboboxWebAppMirrors = ""
	self.user = options.username
	if self.user != "" and self.checkUserName() == False:
		print _("You need to specify a username with at least 6 characters in this field of characters: [a-z0-9_-*.]")
		exit(0)
	self.password = options.password
	self.userFull = options.userfullname
	self.timezone = options.timezone
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
	self.encryption = options.encryption
	self.encryptionpassphrase = options.encryptionpassphrase
	self.locale = options.locale
	self.ServerArch=options.arch
	self.LiveCdArch=commands.getoutput('echo ' + self.ServerArch + ' | cut -d\'-\' -f1')
	self.distType=options.dist
	self.distVers=options.distvers
	
	self.moduleDir = self.scriptDir + "/" + self.distType + "/" + self.distVers + '/modules/'	

	if options.listmodules == True:
		self.listModules()
		exit(0)
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

# ---------- Set proper scripts variables ---------- #
    
    def setScriptVariable(self):
	if self.distVers == "hardy":
		self.stagesScriptsDir=self.hardyStagesScriptsDir
   	if self.distVers == "intrepid":
		self.stagesScriptsDir=self.intrepidStagesScriptsDir
   	if self.distVers == "jaunty":
		self.stagesScriptsDir=self.jauntyStagesScriptsDir
   	if self.distVers == "lenny":
		self.stagesScriptsDir=self.lennyStagesScriptsDir
   	if self.distVers == "squeeze":
		self.stagesScriptsDir=self.squeezeStagesScriptsDir
  	if self.distVers == "wheezy":
		self.stagesScriptsDir=self.wheezyStagesScriptsDir
	if self.distVers == "lucid":
		self.stagesScriptsDir=self.lucidStagesScriptsDir


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
        if commands.getoutput('which genisoimage') == '':
            print _('genisoimage NOT FOUND (needed for ISO generation)')
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
	if self.distType == "debian":
		for root, dirs, files in os.walk(os.path.join(self.customDir, "remaster")):
			for d in dirs:
				if d == "casper":
					self.casperPath="casper"
				if d == "live":
		    			self.casperPath="live"
		if self.casperPath =="":
			print _('Unknown debian Live cd: Aborting')
            		exit(0)


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
                        
		
	for root, dirs, files in os.walk(self.scriptDir):
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
					self.scriptParams +='APACHE=\"' + self.ReqApache + '\"\n'
				elif modProps[self.modReqApache] == "False":
					self.otherApacheInstance = True
					
			    	
				
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
	self.setScriptVariable()
	if self.checkCustomDir() == True:
		if self.debianLive == True:			
			self.setupDebianLive()           		
		else:
			self.setupWorkingDirectory()
		self.cmdLoadModules()
		self.customize()
		self.build()
		
	
	exit(0)


# ---------- Setup ---------- #

    def setupWorkingDirectory(self):

	#### RUN  STAGE 0 START

	print " "
	print _("RUN STAGE 0...")
	print " "
	os.system('bash \"' + os.path.join(self.scriptDir, self.distType + "/" + self.stagesScriptsDir + "/scripts/stage_0_start.sh") + '\" \"' + self.isoFilename + '\" \"' + self.mountDir + '\" \"' + self.customDir + '\"')
	print " "
	print _("STAGE 0 COMPLETED")	
	print " "

	# check version of the input livecd    
	self.checkLiveCdVersion()
	
	#### RUN  STAGE 1 CHROOT CREATION	
	
	print " "
	print _("RUN STAGE 1...")
	print " "
	os.system('bash \"' + os.path.join(self.scriptDir, self.distType + "/" + self.stagesScriptsDir + "/scripts/stage_1_chroot_creation.sh") + '\" \"' + self.customDir + '\" \"' + self.casperPath + '\"')
	print " "
        print _("STAGE 1 COMPLETED")	
	print " "

        return False


# ---------- Debian Live option ---------- #
    
    def setupDebianLive(self):
        
	print " "
	print _("RUN STAGE 0-1 DEBIAN LIVE...")
	print " "

	os.system('bash \"' + self.scriptDir + '/debian/debianlive.sh\" \"' + self.DebianLiveType + '\" \"' + self.DebianLiveReleaseType + '\" \"' + self.LiveCdArch + '\" \"' + self.debMirror + '\" \"' + self.debMirrorSecurity + '\" \"' + self.keyLang + '\" \"' + self.locale + '\" \"' + self.host + '\" \"' + self.user + '\" \"' + self.encryption + '\" \"' + self.encryptionpassphrase + '\" \"' + self.customDir + '\" \"' + self.ciwsDepot + '\" ')
		
	self.distVers = self.DebianLiveReleaseType	
	
	self.checkLiveCdVersion()
 	
	
# ---------- Customize Live ---------- #

    def customize(self):
        print _("INFO: Customizing...")
	
        #Set Global variable for chroot

	self.scriptParams +='LIVEUSER=\"' + self.user + '\"\n'

	self.scriptParams +='LANG=\"' + self.locale + '\"\n'

	self.scriptParams +='KEYB=\"' + self.keyLang + '\"\n'

	self.scriptParams +='TZ=\"' + self.timezone + '\"\n'

	self.scriptParams +='ARCH=\"' + self.LiveCdArch + '\"\n'

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
        	self.scriptParams +='ENCRYPTION=\"' + self.encryption + '\"\n'
        
	fscriptParams=open(os.path.join(self.customDir, "chroot") + '/tmp/scripts_params', 'w')
	fscriptParams.write(self.scriptParams)
	fscriptParams.close()
	
	fscriptParamsOut=open(self.customDir + '/scripts_params', 'w')
	fscriptParamsOut.write(self.scriptParams)
	fscriptParamsOut.close()

	
	#### RUN STAGE 2 BEFORE CHROOT

	print " "
	print _("RUN STAGE 2...")
 	print " "
        os.system('bash \"' + os.path.join(self.scriptDir, self.distType + "/" + self.stagesScriptsDir + "/scripts/stage_2_before_chroot.sh") + '\" \"' + self.ciwsRootDir + '\" \"' + self.scriptDir + "/" + self.distType + "/" + self.stagesScriptsDir + '/scripts/\" \"' + self.xmlDir + '\" \"' + self.phpDir + '\" \"' + self.artworkDir + '\" \"' + self.customDir + '\" \"' + self.ciwsDepot + '\" \"' + self.artwork + '\" \"' + self.keyLang + '\" \"' + self.moduleFilename + '\"' )
	print " "
	print _("STAGE 2 COMPLETED")	
	print " "
    
       	print _('Running modules...')


	#### PREPARE STAGE 3 IN CHROOT : KERNEL LEVEL (.kmod)

	modExecKernelChroot = '#!/bin/bash\n\ncd /tmp ;\n'
	modExecKernelChroot = 'export DEBIAN_FRONTEND=noninteractive\n'
	modExecKernelChroot += 'export DISPLAY=127.0.0.1:5.0 \n'
 	modExecKernelChroot += 'export LC_ALL=C \n'
 	modExecKernelChroot += 'bash \"/tmp/stage_3_in_chroot.sh\"' + ' ;\n '
	if self.execModulesEnabled == True:
            modExecKernelChroot += 'echo Running OS:  \n'
	    for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.kmod', ext):
                        modExecKernelChroot += 'echo -------------------------------------------------\n'
                        modExecKernelChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecKernelChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecKernelChroot += 'echo -------------------------------------------------\n'
                        modExecKernelChroot += 'echo -------------------------------------------------\n'
                        modExecKernelChroot += 'echo "'+ os.path.basename(execMod) +'" >> /tmp/ls.log \n'
                        modExecKernelChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n'
	    
	
	
	fModExecChroot=open(os.path.join(self.customDir, "chroot/tmp/kernel-chroot-exec.sh"), 'w')
        fModExecChroot.write(modExecKernelChroot)
        fModExecChroot.close()
        os.popen('chmod a+x ' + os.path.join(self.customDir, "chroot/tmp/kernel-chroot-exec.sh"))
 
       
	#### PREPARE STAGE 4 IN CHROOT : SERVER LEVEL (.smod)

	modExecModulesChroot = '#!/bin/bash\n\ncd /tmp ;\n'
	modExecModulesChroot = 'export DEBIAN_FRONTEND=noninteractive\n'
	modExecModulesChroot += 'export DISPLAY=127.0.0.1:5.0 \n'
 	modExecModulesChroot += 'export LC_ALL=C \n'
 	modExecModulesChroot += 'bash \"/tmp/stage_4_in_chroot.sh\"' + ' ;\n '	

	if self.execModulesEnabled == True:
            
            modExecModulesChroot += 'echo Running Servers:  \n'
	    for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.smod', ext):
                        modExecModulesChroot += 'echo -------------------------------------------------\n'
                        modExecModulesChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecModulesChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecModulesChroot += 'echo -------------------------------------------------\n'
                        modExecModulesChroot += 'echo -------------------------------------------------\n'
                        modExecModulesChroot += 'echo "'+ os.path.basename(execMod) +'" >> /tmp/ls.log \n'
                        modExecModulesChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n'
			
	modExecModulesChroot += '\necho \'--------------------\'\necho \'Servers Modules Finished...\'\n\n'

	#### PREPARE STAGE 5 IN CHROOT : LAMPP INIT LEVEL 
	
	if self.ReqApache == "A":    
		modExecModulesChroot += 'bash \"/tmp/stage_5_lampp_in_chroot.sh\"' + ' ;\n '
		
	
	#### PREPARE STAGE 6 IN CHROOT : MODULE LEVEL (.rmod)


	modExecModulesChroot += 'bash \"/tmp/stage_6_in_chroot.sh\"' + ' ;\n '
	if self.execModulesEnabled == True:	   		
            modExecModulesChroot += 'echo Running Core:  \n'
	    
            for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "chroot/tmp/")):
                for execMod in sorted(execModFiles):
                    ext = os.path.basename(execMod)
                    if re.search('.rmod', ext):
                        modExecModulesChroot += 'echo -------------------------------------------------\n'
                        modExecModulesChroot += 'echo ------------Cooperation-iws----------------------\n'
                        modExecModulesChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
                        modExecModulesChroot += 'echo -------------------------------------------------\n'
                        modExecModulesChroot += 'echo -------------------------------------------------\n'
                        modExecModulesChroot += 'bash \"/tmp/' + os.path.basename(execMod) + '\"' + ' ;\n '
	
            modExecModulesChroot += '\necho \'--------------------\'\necho \'Modules Finished...\'\n\n'
	if self.artwork != "":  
		modExecModulesChroot += 'bash \"/tmp/' + self.artwork + '.artchroot\"' + '   ;\n '

	#### PREPARE STAGE 7 IN CHROOT : LAMPP END LEVEL 

	if self.ReqApache == "A":
		modExecModulesChroot += 'echo Running Core_end \n'
		modExecModulesChroot += 'bash \"/tmp/stage_7_lampp_in_chroot.sh\"' + ' ;\n '
		modExecModulesChroot += 'sleep 5\n'
	    

        
        fModExecChroot=open(os.path.join(self.customDir, "chroot/tmp/modules-chroot-exec.sh"), 'w')
        fModExecChroot.write(modExecModulesChroot)
        fModExecChroot.close()
        os.popen('chmod a+x ' + os.path.join(self.customDir, "chroot/tmp/modules-chroot-exec.sh"))
        os.popen('echo "normal" > '+os.path.join(self.customDir, "chroot/tmp/in_chroot"))
  
 	
	#### PREPARE STAGE 8 OUT OF CHROOT

	modExecAfterChroot = '#!/bin/bash\n\n'
        if self.artwork != "":
		modExecAfterChroot += 'bash \"' + os.path.join(self.ciwsRootDir, self.artworkDir + "/" + self.artwork + ".artscript") + '\" \"' + self.customDir + '\" ' + ' ;\n '
		modExecAfterChroot += 'bash \"' + os.path.join( self.scriptDir, self.distType + "/" + self.stagesScriptsDir + "/scripts/stage_8_out_of_chroot.sh") + '\" \"' + self.customDir + '\" ' + ' ;\n '

	if self.execModulesEnabled == True:
		for execModRoot, execModexecModDirs, execModFiles in os.walk(os.path.join(self.customDir, "scripts/")):
		        for execMod in sorted(execModFiles):
		            ext = os.path.basename(execMod)
		            if re.search('.rmod', ext):
		                modExecAfterChroot += 'echo -------------------------------------------------\n'
		                modExecAfterChroot += 'echo ------------Cooperation-iws----------------------\n'
		                modExecAfterChroot += 'echo Running Module: ' + os.path.basename(execMod) + '\n'
		                modExecAfterChroot += 'echo -------------------------------------------------\n'
		                modExecAfterChroot += 'echo -------------------------------------------------\n'
				modExecAfterChroot += 'echo "'+ os.path.basename(execMod) +'" >> /tmp/ls.log \n'
		                modExecAfterChroot += 'bash \"' + os.path.join(self.customDir, "scripts/") + os.path.basename(execMod) + '\"' + ';\n '
			modExecAfterChroot += '\necho \'--------------------\'\necho \'Modules Finished...\'\n\n'		
	fModExec=open(os.path.join(self.customDir, "scripts/out-of-chroot-exec.sh"), 'w')
	fModExec.write(modExecAfterChroot)
	fModExec.close()
	os.popen('chmod a+x ' + os.path.join(self.customDir, "scripts/out-of-chroot-exec.sh"))

	
	#### RUN STAGE 3 IN CHROOT
  
	print " "
	print _("RUN STAGE 3...")
	print " "
	os.system('chroot \"' + os.path.join(self.customDir, "chroot/") + '\" /tmp/kernel-chroot-exec.sh')
	print " "
	print _("STAGE 3 COMPLETED")	
	print " "

	
	#### RUN STAGE 4,(5),6,(7) IN CHROOT

	print " "
	print _("RUN STAGES 4 TO 7...")
	print " "
	if commands.getoutput('cat '  +  os.path.join(self.customDir, "chroot/tmp/in_chroot")  + ' | grep \'normal\'') != '':        
		os.system('chroot \"' + os.path.join(self.customDir, "chroot/") + '\" /tmp/modules-chroot-exec.sh')
	print " "
 	print _("STAGES 4 TO 7 COMPLETED")	
	print " "

       
	#### RUN STAGE 8 OUT OF CHROOT

	print " "
	print _("RUN STAGE 8...")
	print " "
	os.system('bash \"' + os.path.join(self.customDir, "scripts/out-of-chroot-exec.sh")+ '\"')
	os.popen ('cp '	 + os.path.join(self.customDir, "chroot/tmp/ls.log") + ' '+self.customDir)        
	print " "
	print _("STAGE 8 COMPLETED")
	print " "

	#### RUN MANUAL TERMINAL IF INSTALLATION IS NOT SILENT	
	if self.silent == False:
			self.launchTerminal()

		
	#### RUN STAGE 9 FINISHING AND SHUTING DOWN
	
	print " "
	print _("RUN STAGE 9...")
	print " "
	os.system('chroot \"' + os.path.join(self.customDir,"chroot/") +'\" /tmp/stage_9_in_chroot.sh')
	print " "
	print _("STAGE 9 COMPLETED")
	print " "

	        	

# ---------- Launch chroot terminal if install is not silent ---------- #

    def launchTerminal(self):
        try:
            # HACK: create temporary script for chrooting
            scr = '#!/bin/bash\n#\n#\t(c) cooperation-iws, 2011\n#\nexport HOME=/root\nchroot ' + os.path.join(self.customDir, "chroot/") + '\n'
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

 	except Exception, detail:
            errText = _('Error launching terminal: ')
            print errText, detail
            pass

        return


# ---------- Build ---------- #

    def build(self):

	if os.path.exists(os.path.join(self.customDir, "chroot")):
		
		#### RUN STAGE 10 AFTER CHROOT		
		print " "
		print _("RUN STAGE 10...")
		print " "
		os.system('bash \"' + os.path.join(self.scriptDir, self.distType + "/" + self.stagesScriptsDir + "/scripts/stage_10_after_chroot.sh") + '\" \"' + self.customDir + '\" ')
		print " "
		print _("STAGE 10 COMPLETED")
		print " "
	        
	if self.encryption != "disabled":		
		
		#### RUN STAGE 11 ENCRYPTION
		print " "
	        print _("RUN STAGE 11...")
		print " "
	        os.system('bash \"' + os.path.join(self.scriptDir, self.distType + "/" + self.stagesScriptsDir + "/scripts/stage_11_encryption_after_chroot.sh") + '\"  \"' + self.encryption + '\" \"' + self.encryptionpassphrase + '\" \"' + self.customDir + '\"')
		print " "
	        print _("STAGE 11 COMPLETED")	
		print " "
	
	# build iso
	if self.buildIso == True:
	    		
		#### RUN STAGE 12 FINISHING		
		
		print " "
		print _("RUN STAGE 12...")
		print " "
	        os.system('bash \"' + os.path.join(self.scriptDir, self.distType + "/" + self.stagesScriptsDir + "/scripts/stage_12_finishing.sh") + '\" \"' + self.customDir + '\" \"' + self.isoname + '\" \"' + self.LiveCdArch + '\" ')
		print " "
	        print _("STAGE 12 COMPLETED")
		print " "
	        		
	# print status message
       
        statusMsgISO = _('Finished. ISO located at: ')
        print "\033[1m "+ statusMsgISO + "\033[0m"+ self.customDir + '/' + self.isoname 

       


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
      
       

