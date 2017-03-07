function autoproxy -d "Automatically set/unset proxy" --on-event fish_prompt
  fish_debug "autoproxy: entering autoproxy function"
    if set -q autoproxy_check_command
      # echo ... | source instead of "eval" to avoid a warning from exec-path-from-shell in Emacs
      if echo $autoproxy_check_command | source
        if __autoproxy_notif_requested; and not set -q __autoproxy_set
        fish_info "autoproxy: Setting proxy"
        proxy
        set -U __autoproxy_set
      end
    else
      if __autoproxy_notif_requested; and set -q __autoproxy_set
		    fish_info "autoproxy: Unsetting proxy"
        noproxy
        set -e __autoproxy_set
      end
    end
  end
end
