#!/bin/bash

while true; do
    clear
    echo -e "\033[31m"
    figlet -w 200 -f poison "NMAP"
    echo -e "\033[0m"
    echo -e "\033[32mA tool to utilize nmap\033[0m"

    echo ""
    echo -e "\033[33mChoose an option:\033[0m"
    echo -e "\033[34m1.\033[0m Scan local network"
    echo -e "\033[34m2.\033[0m Scan specific IP address"
    echo -e "\033[34m3.\033[0m Scan specific port on an IP address"
    echo -e "\033[34m4.\033[0m OS Detect"
    echo -e "\033[34m5.\033[0m TCP/IP fingerprint"
    echo -e "\033[34m6.\033[0m Exit"

    read -p "Enter your choice: " choice
    echo ""

    case $choice in
        1)
            echo -e "\033[32mScanning local network...\033[0m"
            nmap -v -sP 192.168.1.0/255
            echo ""
            read -n 1 -s -r -p "Press any key to go back to main menu..."
            ;;
        2)
            read -p "Enter IP address to scan: " ip_address
            echo ""
            echo -e "\033[32mScanning IP address: $ip_address ...\033[0m"
            nmap -v $ip_address
            echo ""
            read -n 1 -s -r -p "Press any key to go back to main menu..."
            ;;
        3)
            read -p "Enter IP address to scan: " ip_address
            read -p "Enter port number to scan: " port_number
            echo ""
            echo -e "\033[32mScanning port $port_number on IP address: $ip_address ...\033[0m"
            nmap -v -p $port_number $ip_address
            echo ""
            read -n 1 -s -r -p "Press any key to go back to main menu..."
            ;;
        4)
            read -p "Enter IP address to scan: " ip_address
            nmap -v -O -T4 -Pn  $ip_address
            echo ""
            read -n 1 -s -r -p "Press any key to go back to main menu..."
            ;;
        5)
            read -p "Enter IP address to scan" ip_address
            nmap -v -O -sV -T4 -Pn -p U:53,111,137,T:21-25,80,139,8080 $ip_address
            echo""
            read -n 1 -s -r -p "Press any key to go back to main menu..."
            ;;

        6)  echo -e "\033[32mExiting...Goodbye\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[31mInvalid option, please try again.\033[0m"
            read -n 1 -s -r -p "Press any key to go back to main menu..."
            ;;
    esac
done
