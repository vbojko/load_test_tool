  
    curl -O https://raw.githubusercontent.com/vbojko/load_test_tool/main/binary/ubuntu_18-04/wrk
    sudo chmod +x wrk
    sudo cp wrk /usr/bin/
    #copy wrkscript from github
    curl -O https://raw.githubusercontent.com/vbojko/load_test_tool/main/wrkscript.sh
    sudo chmod +x wrkscript.sh
    