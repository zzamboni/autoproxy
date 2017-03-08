function autoproxy -d "Automatically set/unset proxy" --on-event fish_prompt
  fish_debug "autoproxy: entering autoproxy function"
    if set -q autoproxy_check_command
      # echo ... | source instead of "eval" to avoid a warning from exec-path-from-shell in Emacs
      echo $autoproxy_check_command | source
      set result $status
      if test $result -eq 0
        if __autoproxy_notif_requested; and not set -q __autoproxy_set
          fish_info "autoproxy: Setting proxy"
        end
        proxy
        set -U __autoproxy_set
      else
        if __autoproxy_notif_requested; and set -q __autoproxy_set
          fish_info "autoproxy: Unsetting proxy"
        end
        noproxy
        set -e __autoproxy_set
      end
    end
    return $result
  end 
