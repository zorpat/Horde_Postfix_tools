Postfix tool for setting up base settings in Horde
==================================================

Install steps (preferred for latest stable release):
----------------------------------------------
 - wget https://github.com/zorpat/Horde-GERMAN-default-settings-creator-for-Postfixadmin/archive/v0.1-stable.tar.gz
 - tar -zxvf V0.1-stable.tar.gz
 - change variables to meet your requirements
 - cp mailbox_postcreation_script.sh /usr/local/bin/
 - chmod a+x mailbox_postcreation_script.sh
 - Edit "/var/www/postfixadmin/config.inc.php" and set:
	$CONF['mailbox_postcreation_script'] = '/usr/local/bin/mailbox_postcreation_script.sh';
	
Settings automatically set by this script:
------------------------------------------
   1. Set Horde default identity "from address" to mailaddress given by Postfixadmin
   2. Set Horde users "full name" to mailaddress given by Postfixadmin
   3. Set Horde to save sent messages to "default_sent_foldername"
   4. Set Horde timezone to "Europe/Berlin" (could be easily changed to any other timezone over the world)
   5. Set Horde to use 24 hours time formatting
   6. Set Horde to activate "new mail notification" by refreshing mailbox once every minute an playing the "reminder.wav" soundfile
   7. Set Horde to use a trash folder defined by "default_trash_foldername"
   8. Set Horde to always save attachments
   9. Set Horde Kronolith to visualize the "week view" as default (calendar app)
  10. Set Horde Kronolith to alarm user of coming on events by playing the "doorbell.wav" soundfile + popup
  11. Set Horde Kronolith to start week on monday (sunday is the default first day of week)