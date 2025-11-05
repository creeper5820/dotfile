set container_name alliance-alliance-develop-1
set container_path /home/creeper/workspace/alliance/

set developer_name ubuntu

set nvim_path /opt/nvim-linux-x86_64/bin/nvim
set nvim_port 6666
set nvim_host localhost

# 主命令入口
function rmcs
    switch $argv[1]
        case zsh
            __rmcs_zsh
        case nvim
            __rmcs_nvim
        case '*'
            echo "󰘳  用法: rmcs [zsh|nvim]"
    end
end

function __rmcs_zsh
    cd $container_path
    echo "  启动容器 $container_name..."
    docker start $container_name
    echo "  进入容器 shell..."
    docker exec -it $container_name zsh
end

function __rmcs_nvim
    cd $container_path
    echo "  启动容器 $container_name..."
    docker start $container_name

    set timeout 10
    set success 0
    set port $nvim_port

    echo "  检查可用端口并启动 nvim headless 服务..."

    while true
        if nc -z $nvim_host $port
            echo "  端口 $port 已被占用，尝试下一个..."
            set port (math $port + 1)
        else
            echo "  使用端口 $port 启动 nvim 服务..."
            docker exec -u $developer_name -d $container_name $nvim_path --headless --listen $nvim_host:$port
            break
        end
    end

    for i in (seq 1 $timeout)
        if nc -z $nvim_host $port
            echo "  nvim 服务已启动在端口 $port"
            set success 1
            break
        else
            echo "  等待 nvim 服务启动中... ($i/$timeout)"
            sleep 1
        end
    end

    if test $success -eq 1
        echo "  启动 neovide..."
        nohup neovide --server=$nvim_host:$port >/dev/null 2>&1 &
    else
        echo "  nvim 服务未能在 $timeout 秒内启动，neovide 未启动"
    end
end
