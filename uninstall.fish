# autoproxy uninstall hook
#
# You can use this file to do custom cleanup when the package is uninstalled.
# You can use the variable $path to access the package path.
functions -e autoproxy __autoproxy_notif_requested
