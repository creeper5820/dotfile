set rmcs_path $HOME/workspace/alliance/main/RMCS
set rmcs_exec $HOME/workspace/alliance/main/RMCS/.script/host/rmcs

function rmcs
    cd $rmcs_path
    $rmcs_exec $argv
end
