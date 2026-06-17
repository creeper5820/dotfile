complete -c ue -f
complete -c ue -n 'not __fish_seen_subcommand_from open stop gen_compile_commands' -a open -d '启动 Unreal Editor'
complete -c ue -n 'not __fish_seen_subcommand_from open stop gen_compile_commands' -a stop -d '停止 Unreal Editor tmux session'
complete -c ue -n 'not __fish_seen_subcommand_from open stop gen_compile_commands' -a gen_compile_commands -d '生成 compile_commands.json'
complete -c ue -n '__fish_seen_subcommand_from open' -a '(fd -e uproject . 2>/dev/null || find . -name "*.uproject" -type f 2>/dev/null)' -d 'Unreal Project'
complete -c ue -n '__fish_seen_subcommand_from stop' -a '(tmux list-sessions -F "#{session_name}" 2>/dev/null | string match -r "^ue\\." | string replace -r "^ue\\." "")' -d 'UE tmux session'
complete -c ue -n '__fish_seen_subcommand_from gen_compile_commands' -a '(__fish_complete_directories)' -d '项目目录'
