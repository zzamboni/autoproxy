function __autoproxy_notif_requested
        set -q autoproxy_notifications; and test $autoproxy_notifications = "yes"
end
