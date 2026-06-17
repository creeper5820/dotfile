function ue
    set ue_root /home/creeper/app/ue5

    set -l editor $ue_root/Engine/Binaries/Linux/UnrealEditor
    set -l runubt $ue_root/Engine/Build/BatchFiles/RunUBT.sh

    if not command -q tmux
        echo "错误: 未找到 tmux，请先安装 tmux。" >&2
        return 1
    end

    if not test -x $editor
        echo "错误: UnrealEditor 不存在或不可执行: $editor" >&2
        return 1
    end

    if test (count $argv) -eq 0
        tmux new-session -d -s ue -n UnrealEditor -- $editor
        echo "已启动 Unreal Editor"
        echo "tmux session: ue"
        echo "连接: tmux attach -t ue"
        return 0
    end

    set -l command $argv[1]

    switch $command
        case open
            if test (count $argv) -lt 2
                echo "错误: 缺少项目文件。" >&2
                _ue_help >&2
                return 1
            end

            set -l project_path $argv[2]
            if not test -f $project_path
                echo "错误: 项目文件不存在: $project_path" >&2
                return 1
            end

            set -l project_abs (realpath $project_path)
            set -l project_file (basename $project_abs)
            set -l project_name (string replace -r '\.uproject$' '' $project_file)
            set -l session_suffix (string replace -ra '[^A-Za-z0-9_.-]' '_' $project_name)
            set -l session_name ue.$session_suffix

            if tmux has-session -t $session_name 2>/dev/null
                echo "tmux session 已存在: $session_name"
                echo "连接: tmux attach -t $session_name"
                return 0
            end

            set -l editor_args $argv[3..-1]
            tmux new-session -d -s $session_name -n $project_name -- $editor $project_abs $editor_args

            echo "已启动 UE: $project_abs"
            echo "tmux session: $session_name"
            echo "连接: tmux attach -t $session_name"

        case stop
            if test (count $argv) -ne 2
                echo "错误: 缺少 session 名。" >&2
                _ue_help >&2
                return 1
            end

            set -l target $argv[2]
            set -l project_name (basename $target)
            set project_name (string replace -r '\.uproject$' '' $project_name)

            if string match -q 'ue.*' $project_name
                set -l session_name $project_name
            else
                set -l session_suffix (string replace -ra '[^A-Za-z0-9_.-]' '_' $project_name)
                set -l session_name ue.$session_suffix
            end

            if not tmux has-session -t $session_name 2>/dev/null
                echo "错误: tmux session 不存在: $session_name" >&2
                return 1
            end

            tmux kill-session -t $session_name
            echo "已停止 UE: $session_name"

        case gen_compile_commands
            if test (count $argv) -lt 2
                echo "错误: 缺少目录路径。" >&2
                _ue_help >&2
                return 1
            end

            set -l dir (realpath $argv[2])
            if not test -d $dir
                echo "错误: 目录不存在: $dir" >&2
                return 1
            end

            if not test -x $runubt
                echo "错误: RunUBT.sh 不存在或不可执行: $runubt" >&2
                return 1
            end

            set -l uprojects (find $dir -maxdepth 1 -name "*.uproject" -type f)
            if test (count $uprojects) -eq 0
                echo "错误: 在 $dir 中未找到 .uproject 文件。" >&2
                return 1
            end
            if test (count $uprojects) -gt 1
                echo "错误: 在 $dir 中找到多个 .uproject 文件: $uprojects" >&2
                return 1
            end

            set -l project_abs $uprojects[1]
            set -l project_file (basename $project_abs)
            set -l project_name (string replace -r '\.uproject$' '' $project_file)
            set -l target_name {$project_name}Editor

            echo "生成 compile_commands: $project_name"
            echo "目标: $target_name"
            echo "输出: $dir"

            $runubt \
                -Mode=GenerateClangDatabase \
                -Project="$project_abs" \
                -OutputDir="$dir" \
                $target_name Linux Development

        case '*'
            echo "错误: 未知命令: $command" >&2
            _ue_help >&2
            return 1
    end
end

function _ue_help
    echo "用法:"
    echo "  ue open <Project.uproject> [UnrealEditor 参数...]"
    echo "  ue stop <ProjectName|ue.ProjectName|Project.uproject>"
    echo "  ue gen_compile_commands <path>"
end
