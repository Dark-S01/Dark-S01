#!/system/bin/sh

r="\033[1;36m"
g="\033[1;32m"


clear
echo -e "\033[1;33mCODER DARK-S"


echo -e '


\033[1;31m ██████ ██████   █████   ██████ ██   ██ ███████ ██████  
\033[1;36m██      ██   ██ ██   ██ ██      ██  ██  ██      ██   ██ 
\033[1;33m██      ██████  ███████ ██      █████   █████   ██████  
\033[1;32m██      ██   ██ ██   ██ ██      ██  ██  ██      ██   ██ 
\033[1;34m █████  ██   ██ ██   ██  ██████ ██   ██ ███████ ██   ██  
                           
  Telegram - @Dark_S_Hacker                                                      
'

 


echo -e "\033[1;36m𝗣𝗔𝗦𝗦𝗪𝗢𝗥𝗗 𝗖𝗥𝗔𝗖𝗞𝗜𝗡𝗚 𝗧𝗢𝗢𝗟 "

banner() {
  
    
    echo "    _______       _______       _______      _______     "
    echo "  /        \    /        \    /        \    /       \    "
    echo " /          \  /          \  /          \  /         \   "
    echo "/            \/            \/            \/           \  "
    echo "|   Username  |   Password  |   Tools     |   Exit     |"
    echo "|_____________|_____________|_____________|____________|"
    echo "TYPE - 1"
}


# Function to display username and password tools
tools() {
    clear
    echo "Username and Password Tools"
    echo "---------------------------"
    echo "1. Generate Strong Password"
    echo "2. Check Password Strength"
    echo "3. Crack Password (Dictionary Attack)"
    echo "4. Back to Main Menu"
    echo -n "Enter your choice: "
    
    read choice

    case $choice in
        1) generate_password ;;
        2) check_password_strength ;;
        3) crack_password ;;
        4) main_menu ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
}

# Function to generate strong password
generate_password() {
    clear
    echo "Generate Strong Password"
    echo "-----------------------"
    echo -n "Enter password length (min 8): "
    read length
    if [ $length -lt 8 ]; then
        echo "Password length must be at least 8 characters."
        sleep 2
        generate_password
    else
        password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $length | head -n 1)
        echo "Generated password: $password"
        sleep 2
        tools
    fi
}

# Function to check password strength
check_password_strength() {
    clear
    echo "Check Password Strength"
    echo "---------------------"
    echo -n "Enter password: "
    read password
    if [ ${#password} -lt 8 ]; then
        echo "Password is too short. It should be at least 8 characters."
    elif [[ $password == *[a-z]* && $password == *[A-Z]* && $password == *[0-9]* ]]; then
        echo "Password is strong."
    else
        echo "Password is weak. It should contain at least one lowercase letter, one uppercase letter, and one digit."
    fi
    sleep 2
    tools
}
nc  ftp

# Function to crack password (dictionary attack)
crack_password() {
    clear
    echo "Crack Password (Dictionary Attack)"
    echo "-------------------------------"
    echo -n "Enter password hash: "
    read hash
    echo -n "Enter dictionary file: "
    read dict
    for password in $(cat $dict); do
        if [ $(echo -n $password | md5sum | cut -d ' ' -f 1) == $hash ]; then
            echo "Password cracked: $password"
            sleep 2
            tools
            return
        fi
    done
    echo "Password not found in dictionary."
    sleep 2
    tools
}

# Main menu
main_menu() {
    banner
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1) tools ;;
        2) echo "Not implemented yet." ;;
        3) echo "Not implemented yet." ;;
        4) exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
    main_menu
}

# Start the script
main_menu