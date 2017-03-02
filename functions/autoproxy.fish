function autoproxy -d "Automatically set/unset proxy" --on-event fish_prompt
        if set -q autoproxy_check_command
                if eval $autoproxy_check_command
                        if set -q autoproxy_notifications; and test $autoproxy_notifications = "yes"
                                if not set -q __autoproxy_set
                                        set_color yellow; echo "Setting proxy"; set_color normal
                                end
                        end
                        proxy
                        set -g __autoproxy_set
                else
                        if set -q autoproxy_notifications; and test $autoproxy_notifications = "yes"
                                if set -q __autoproxy_set
		                        set_color green; echo "Unsetting proxy"; set_color normal
                                end
                        end
                        noproxy
                        set -e __autoproxy_set
                end
        end
end
