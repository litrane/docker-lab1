#!/bin/bash
generate_docker_compose_file(){
    echo -e "version: '3'\n"
    echo -e "services:"

    n=0
    portStart=16900
    portEnd=19888
    sshPort=2205
    BINARY_IMAGE="theta:latest"
    # validator config
    while ((n < $1)); do
        let nodeid=`expr \( $n \) % 4`
        let CHAIN=`expr \( $n \) / 4`
        #echo "  subchainvalidator-$CHAIN-$nodeid: "

        nodeName=" subchainvalidator-$CHAIN-$nodeid"
        echo " $nodeName:"
        echo "   container_name: $nodeName"
        echo "   image: $BINARY_IMAGE"
        echo "   ports:"
        if [ `expr $n % 4 ` -eq 0 ]; then
            echo "   - \"$portStart:16900\""
            echo "   - \"$portEnd:19888\""
            let portStart=portStart+1
            let portEnd=portEnd+1
        fi
        echo "   - \"$sshPort:22\""
        echo "   networks:"
        echo "     thetanet:"
        id=`expr $n + 5`
        echo -e "       ipv4_address: 10.10.1.$id\n"
    
        let n=n+1
        let sshPort=sshPort+1
    done

    echo "networks:"
    echo "  thetanet:"
    echo "    external:"
    echo "      name: thetanet"

}
generate_docker_compose_file $1  &> docker-compose-subchain.yml