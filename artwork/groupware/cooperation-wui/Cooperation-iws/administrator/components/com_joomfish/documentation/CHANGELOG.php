<?
/**
 * Joom!Fish - Multi Lingual extention and translation manager for Joomla!
 * Copyright (C) 2003-2008 Think Network GmbH, Munich
 *
 * All rights reserved.  The Joom!Fish project is a set of extentions for
 * the content management system Joomla!. It enables Joomla!
 * to manage multi lingual sites especially in all dynamic information
 * which are stored in the database.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,

 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307,USA.
 *
 * The "GNU General Public License" (GPL) is available at
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 * -----------------------------------------------------------------------------
 * $Id: CHANGELOG.php 1175 2008-09-09 04:36:06Z akede $
 *
*/

// no direct access
defined( 'JPATH_BASE' ) or die( 'Restricted access' );
?>

1. Copyright and disclaimer
---------------------------
This application is opensource software released under a variant of the GPL.
Please see source code and the LICENSE file for more details.

Copyright 2003-2008 Think Network GmbH, Munich
- All Rights Reserved.


2. Changelog
------------
This is a non-exhaustive (but still near complete) changelog for
the Joom!Fish 2.x, including beta and release candidate versions.

The Joom!Fish 2.x is based on the JoomFish 1.8 releases but includes some
drastic technical changes.


Legend:

* -> Security Fix
# -> Bug Fix
+ -> Addition
^ -> Change
- -> Removed
! -> Note

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

==== 09 September 2008 Joom!Fish 2.0 RC public release =====

2008-09-09 Alex Kempkens
 # updated versioning information for release preparations

2008-09-08 Alex Kempkens
 # fixed [#12241] List length
 # fixed [#12657] Translation of "other parameters" of mod_mainmenu

2008-09-08 Ivo Apostolov
 # Commit of Geraint's bug fix in the jfrouter

2008-09-05 Alex Kempkens
 # [#10295] You have an error in your SQL syntax
 ! affects only CE files menu.xml, content.xml was already fixed

2008-09-01 Ivo Apostolov
 # Varios new strings in the language files. Thanks Rued.
 + Adding en-GB.com_joomfish.menu.ini. Thanks Rued.
 
==== 27 August 2008 Joom!Fish 2.0 RC1 donors and contributors release =====

2008-08-27 Ivo Apostolov
 # Changing language files headers in order to be easier manipulated with the Translation Manager Extension
 ^ Setting the release date of RC1 version - 27 August 2008
 ^ Aligning XML files to contain same data

2008-08-26 Ivo Apostolov
 # Fixing the load of mod_translate without saving. Thanks Geraint
 + Adding pre-defined ordering of mod_jflanguageselection
 ^ Small change on the default mod_jflanguageselection display
 # Small fix of the description of mod_translate
 + Adding language files for the search plugins
 + Adding language files for mod_translate
 
2008-08-26 Geraint Edwards
 # fixed bad file location in jfrouter plugin config
 # removed setting locale in jfrouter (JLanguage does this for us now)
 + Added check an overwriting site module installation si that we don't get duplicate installed
 + Added default module visibiliy on ALL pages for new module install

2008-08-25 Ivo Apostolov
 ^ Changing the module default display type
 # Changing the revision in version.php
 + Adding new attribute in the installation routine of the system plugins. By adding "order" we prevent incorrect ordering of our plugins by putting them directly on positions -101 and -100.
 # Moving the language file for the JFrouter to the proper folder
 - Removed slugs plugin
 - Removed prePostTranslation plugin
 - Removed ContentLocalization plugin
 # Update of the installation manifest

2008-08-23 Geraint Edwards	
 # Ensure content element files are loaded from the correct path by JoomFishManager following move of this file to classes subdirectory
 
2008-08-22 Geraint Edwards	
 # Rationalised treatment of strip slashes when saving translations - html fields are allowed HTML all other are stripped if necessary
 # Fixed minor regression config should not be obtained dynamically in JoomFishManager
 # Remove readmore button in html editor for translations pending more advance treatment of readmore in JF 2.1
 
2008-18-19 Ivo Apostolov
 # Replacement of mosConfig_livesite with JURI::root() in mod_translate
 # Fixing cPanel donate image handling by adding JURI::root() in the URL

2008-18-19 Ivo Apostolov
 # Fixing minor bug in the orphan view (non closed table)
 ^ Replacing irrelevant texts from the postinstall info
 # Fixing the module language file, now ready for RC. Adding Bulgarian translation.
 + Adding language file for the plugin jfalternative
 + Adding language files for system plugins

2008-08-19 Ivo Apostolov
 ^ Minor GUI changes in the "Manage Translations" and "Statistics" to reflect the overall design of the images.
 + New language string "DETAIL" for the content elements toolbar

2008-08-15 Alex Kempkens
 # completed refactoring of view elements
 # integrated post install information based on /help/en-GB/postinstall.html
 ! translators note. You can translate all files within /help/ to your language. The files will be
 ! automatically used with changing the administrator language in Joomla!
 # fixed statistics mode
 # changed welcome to Joom!Fish information
 # fixed links in help dialogs
 # merged latest changes to branch
 # refactored manage translations dialog

2008-08-15 Geraint Edwards
 # Fix untranslated menus for logged in users - we must not allow any database calls within the translation routine 
 + Added method upgrade to installer
 
2008-08-12 Geraint Edwards
 # Fix mod_jflanguageselection to handle ssl correctly

2008-08-11 Alex Kempkens
 ! merge from trunk to refactoring branch completed
 # fixed several problems with new default view class references
 # refactored translation view with table layout and view reference
 # refactored translation edit
 # refactored translation orphans

2008-08-10 Alex Kempkens
 + new default view class
 # updated elements view to new base view class
 # updated elements view to Joomla! generic view templ files 
 # update installer methods and views related
 # updated various language texts
 # updated xml and primary files to new Joomla! 1.5 standards
 # moved JoomFishManager to own classes directory
 # updated frontend module and system plugins

2008-08-09 Alex Kempkens
 # Added help screens for all pages
 # Started refactoring of views to simplify the default view usage
 # fixed footer license link
 # standardized the sub menu navigation
 # split of management and statistic fuctions

2008-08-05 Geraint Edwards
 # Some Joomfish cache files were not being removed on expiry.  Add a garbage handler to the jfdatabase::onAfterRender method to take care of this
 
2008-08-03 Geraint Edwards
 + Add "Apply" button when editing translations

 2008-07-28 Geraint Edwards
 # Fixed JS copying and deleting of textarea params

 2008-07-23 Geraint Edwards
 # Remove option to delete language from languages overview - we don't have a method and have not defined what this should do.  Should it uninstall the Joomla language files?

 2008-07-23 Geraint Edwards
 # Force reload of content element cache when saving translations see http://www.joomfish.net/forum/viewtopic.php?f=28&t=1567&p=7387#p7387

2008-07-22 Alex Kempkens
 # Fixed broken link to license file

2008-07-21 Geraint Edwards
 # RSS feed from joomfish.net is incorrect and always gives error in the cPanel.
 # Remove broken "Display #10" at the top of various overview lists
 # remove checkboxes on CE installer list
 # Corrected check of plugin ordering - should be the order in the list not the value of the ordering field
 # fixed basic router to deal with pdf and feeds correctly when SEF with extensions is enabled
 # Finished fixing url parameters to allow selection of article in menu translation
 # remove reference to JPATH_COMPONENT_ADMINISTRATOR in JLoader::register - always refer to Joomfish in the path so we can inherit from Joomfish elsewhere
 
2008-07-18 Geraint Edwards
 # Fixed variety of bugs from Ivo's Beta2Bugs doc - deletion of CE, deletion of orphans, count of transltion for donate link in CPanel, back link in CE installer, irrelevant href link in lang config, date formatting in backend, 
 + Added content attribute translation
 + Added translation of URLs for weblinks
 # Fixed problem with untranslated section and category titles on front page
 # Added trap for setreftable cache file being unwritable
 + Added basic router workaround for contact router problem with missing slug data

2008-07-14 Geraint Edwards
 # Fixed problem with translation where 2 fields with the same name were being incorrectly translated (see http://www.joomfish.net/forum/viewtopic.php?f=16&t=1523&p=7108#p7107)
 # Fixed call to onBeforeTranslation that resulted in items not being translated if the plugin returned true
 
2008-07-11 Geraint Edwards
 # Fixed various problems with 302 redirect and cookies see : http://www.joomfish.net/forum/viewtopic.php?f=28&t=1472&p=6899#p6888
 # Fixed bad call to translateListWithIDs when processing fallbacks - could lead to recursion with badly configured language configuration
 # Added missing handler for getNumRows to JFDatabase
 + Add ignoreifblank to ContentElementTableField to allow modules to ignore "content" field if original is blank
 ^ Replace usage of JPATH_COMPONENT and JPATH_COMPONENT_ADMINISTRATOR for future flexibility
 
2008-07-10 Geraint Edwards
 - Remove frontend component files from installation since they are not used anywhere

2008-07-03 Geraint Edwards
 # Correct use of ACL for frontend translation
 # Fix stripping of paramaters in translation slashes were getting dropped so textarea params were not translated properly
 

 # Fixing Czech language flag [#11406] Default country flag for czech language is wrong

2008-06-21 Geraint Edwards
 # Joomfish routine to find site default language was obtaining the current user's admin language!!  This is now fixed.
 # Fix translation preview - note that some editors are still broken e.g. xstandard (poor coding assuptions) and JCE/TinyMCE needed a workaround of a bug
 
2008-06-20 Geraint Edwards
 # Removed subtable from polls.xml content element file
 # replaced stray mosRedirect from translate controller
 ^ replace JURI::base() with JURI::root() in joomfish footer
 ^ remove redundance variables in joomfish.class.php
 # Add handler for initial config of jfrouter where sefprefix have not been saved
 ^ Improve check on legacy mode in jfdatabase
 # fixed declaration of JFDatabase::loadRowList ($translation field was missing)
 # Remove module caching option from language switching module - its too dangerous
 + Add sef URL caching option to language switching module 
 
 
2008-06-15 Ivo Apostolov
 # Fixing of copy function in JCE (by Geraint) - forum http://www.joomfish.net/forum/viewtopic.php?f=28&t=1319
 # Applying the fix on the installation (removing comments from SQL files) - forum version by Geraint, http://www.joomfish.net/forum/viewtopic.php?f=28&t=1314
 ^ Resizing two flags for consistency
	
2008-06-14 Ivo Apostolov
 ^ Moving the no translations available JText to the missing translations plugin
 + Language file for missing_translations plugin
 + Adding the lang files in missing_translations.xml 

2008-06-09 Ivo Apostolov
 + Adding Egyptian flag
 ^ Fixing CSS validation issue in the module


==== Joom!Fish 2.0 Beta 2 public release =====
 
2008-06-03 Geraint Edwards
 # Fixed overwrite global config - it was not in the config.xml file and hence ignored!
 ~ changed language specific global config to include the default text string to allow easy translation

2008-06-02 Ivo Apostolov
 - Removed all languages except English from the core (conference meeting)
 ^ Changed joomfish.xml to reflect the language files removal
 ! Language files moved to the documentation folder

2008-06-01 Geraint Edwards
 # Add models/manage.php to install xml file

2008-06-01 Ivo Apostolov
 # Fix of images wrong URLs in views/translate/tmpl/orphanes.php

2008-06-01 Geraint Edwards
 + Added utility method to JoomfishManager getLanguagesIndexedById
 # fix page navigation on content elements overview
 
2008-06-01 Ivo Apostolov
 # fixing the translations overview screen (incomplete usage of JText causing incorrect visualisation)
 # additing to the installer status_r.png, status_y.png and status_g.png used in views/translate/tmpl/overview.php

2008-06-01 Ivo Apostolov
 # fixing install file (using cap for translateconfig)
 # hardcoded database prefix in joomfish.sql

2008-05-30 Alex Kempkens
 # ampersand bug; http://www.joomfish.net/forum/posting.php?mode=reply&f=28&t=1181
 # refactored module loading of classes

2008-04-13 Alex Kempkens
 # Notice JoomFish 2.0 - J! 1.5.2, http://www.joomfish.net/forum/viewtopic.php?f=15&t=903

2008-04-12 Alex Kempkens
 # removed some php short tags
 # fixed wrong links in cpanel status (thx for the hint Mark)
 # fixed broken links in help dialogs
 + new information and postinstall page within help view
 + added cpanel icon statistic function
 # fixed sub-menu links

2008-04-11 Alex Kempkens
 # updated help screen layout based on patch from Mark - thx
 # updated versioning and copyright years

2008-02-18 Alex Kempkens
 # fixed wrong text presentation in the cpanel
 + Integrated help dialog
 # fixed News RSS integration

2008-02-18 Alex Kempkens
 + first integration of language manager
 ! Geraint did several other dialogs already .... 

2008-01-03 Alex Kempkens
 + Integration of CPanel MVC

2008-12-30 Alex Kempkens
 + Inital setup of files and structures

 === Base of work procress is JoomFish 1.8 release                              ===
