; This file is a make file for ucf online based on buildkit
;
; Use this file to build a full distro including Drupal core and
; Open atrium install profile, plus ldap module (with patches) using the following command:
;
;     $ drush make distro.make [directory]

api = 2
core = 6.x

projects[drupal][type] = core
projects[drupal][version] = "6.22"

projects[openatrium][type] = "profile"
projects[openatrium][download][type] = "git"
projects[openatrium][download][url] = "http://git.drupal.org/project/openatrium.git"
projects[openatrium][download][branch] = "master"

projects[adminrole][subdir] = contrib
projects[og_ldap][subdir] = contrib

projects[ldap_integration][subdir] = contrib
projects[ldap_integration][version] = 1.0-beta2

; initial patch to ldap module for features implementation. 
; http://drupal.org/node/692670
; patch against 6.x-1.0-beta2 to ease testing - addresses only 'ldapauth' table schema, not including variables
projects[ldap_integration][patch][692670-7] = http://drupal.org/files/issues/ldapauth_features_integration-692670-7.patch
; this patch replaces all constants addressed in #1 to global variables
projects[ldap_integration][patch][692670-8] = http://drupal.org/files/issues/ldapauth_features_integration-692670-8.patch
