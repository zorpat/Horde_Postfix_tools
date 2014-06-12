#!/bin/bash

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
# Automatic Horde user DB settings
# 
# Version: 0.2-stable
# 
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
# 
# Usage:
#	- change variables to meet your requirements
#	- cp mailbox_postcreation_script.sh /usr/local/bin/
#	- chmod a+x mailbox_postcreation_script.sh
#	- Edit "/var/www/postfixadmin/config.inc.php" and set:
#		$CONF['mailbox_postcreation_script'] = '/usr/local/bin/mailbox_postcreation_script.sh';
# 
#
# Settings automatically set:
#   1. Set Horde default identity "from address" to mailaddress given by Postfixadmin
#   2. Set Horde users "full name" to mailaddress given by Postfixadmin
#   3. Set Horde to save sent messages to "default_sent_foldername"
#   4. Set Horde timezone to "Europe/Berlin" (could be easily changed to any other timezone over the world)
#   5. Set Horde to use 24 hours time formatting
#   6. Set Horde to activate "new mail notification" by refreshing mailbox once every minute an playing the "reminder.wav" soundfile
#   7. Set Horde to use a trash folder defined by "default_trash_foldername"
#   8. Set Horde to always save attachments
#   9. Set Horde Kronolith to visualize the "week view" as default (calendar app)
#  10. Set Horde Kronolith to alarm user of coming on events by playing the "doorbell.wav" soundfile + popup
#  11. Set Horde Kronolith to start week on monday (sunday is the default first day of week)
#
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

#*************************************************
# !! Set this variables as needed !!
#*************************************************

# Database settings (MySQL)
db_horde="horde"
db_user="horde"
db_passwd="horde_password"

# Horde settings
default_sent_foldername="Sent"
default_trash_foldername="Trash"

#################################################################################################################################
#        D O N T   C H A N G E   A N Y T H I N G   B E L O W   T H I S   L I N E   !!                                           #
#################################################################################################################################

lfrom_addr=$(expr length "$1")
ldefault_sent_foldername=$(expr length "$default_sent_foldername")

mysql -u"$db_user" -p"$db_passwd" <<EOF
use "$db_horde";
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'horde', 'first_week_day', 1);
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'horde', 'identities', 'a:1:{i:0;a:16:{s:16:"default_identity";i:0;s:9:"from_addr";s:$lfrom_addr:"$1";s:8:"fullname";s:$lfrom_addr:"$1";s:2:"id";s:18:"Standardidentität";s:10:"identities";s:6:"a:0:{}";s:10:"properties";N;s:8:"location";s:0:"";s:12:"replyto_addr";a:0:{}s:10:"alias_addr";a:0:{}s:10:"tieto_addr";a:0:{}s:8:"bcc_addr";a:0:{}s:9:"signature";s:0:"";s:10:"sig_dashes";i:1;s:14:"signature_html";s:0:"";s:14:"save_sent_mail";i:1;s:16:"sent_mail_folder";s:$ldefault_sent_foldername:"$default_sent_foldername";}}');
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'horde', 'timezone', 'Europe/Berlin');
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'horde', 'twentyFour', 1);
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'imp', 'newmail_audio', 'reminder.wav');
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'imp', 'newmail_notify', 1);
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'imp', 'refresh_time', 60);
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'imp', 'save_attachments', 'always');
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'imp', 'trash_folder', '$default_trash_foldername');
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'imp', 'use_trash', 1);
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'kronolith', 'defaultview', 'week');
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'kronolith', 'event_alarms', 'a:1:{s:6:"notify";a:1:{s:5:"sound";s:12:"doorbell.wav";}}');
INSERT INTO horde.horde_prefs (pref_uid, pref_scope, pref_name, pref_value) VALUES ('$1', 'kronolith', 'week_start_monday', 1);
EOF
