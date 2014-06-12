Tools to use with Horde and Postfixadmin
========================================

Settings automatically set by "mailbox_postcreation_script.sh" script:
----------------------------------------------------------------------
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

Install steps (preferred for latest stable release):
----------------------------------------------
 - wget https://github.com/zorpat/Horde_Postfix_tools/archive/v0.1-stable.tar.gz
 - tar -zxvf V0.1-stable.tar.gz
 - open script you wanna use with you favourite editor (nano, vi, ..)
 - Follow installation instruction on the beginning of every script

Install steps for harcore users (always last beta):
 - git clone --depth 1 https://github.com/zorpat/Horde_Postfix_tools.git
 - open script you wanna use with you favourite editor (nano, vi, ..)
 - Follow installation instruction on the beginning of every script

Check if updated is needed:
 - git pull --dry-run
 
Update:
 - "cd" into GIT project root folder
 - git pull

Update to a specifix commit:
 - git pull
 - git checkout <commit hash> (e.g. git chekout ca8c910)

To go back to "master":
 - git checkout master
