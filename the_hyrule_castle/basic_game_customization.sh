#!/bin/bash

$Monsterhp
$Myplayername
$Myplayerhp
$Myplayerhpmax
$Myplayerhalfhp
$Myplayerstr
$Monstername
$Monsterhpmax
$Monsterstr
$Bossname
$Bosshpmax
$Bosshp
$Bossstr
# Fonctions
Save_Player_Csv() {
    while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
	if [[ $id == 1 ]]; then
	    Myplayername=Link
	    Myplayerhp=60      
	    Myplayerhpmax=60
	    Myplayerhalfhp=$((60 / 2))
	    Myplayerstr=15
	fi 
    done < players.csv
}


Save_Monster_Csv() {
    while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
	if [[ $id == 12 ]]; then
	    echo "HERE"
	    Monstername=Bokoblin
	    Monsterhp=30
	    Monstermaxhp=30
	    Monsterstr=5
	fi
    done < enemies.csv
}


Save_Bosses_Csv() {
    while IFS=',' read -r id name hp mp str int def res spd luck race class rarity; do
	if [[ $id == 1 ]]; then
	    Bossname=Ganon
	    Bosshp=150
	    Bossmaxhp=150
	    Bossstr=20
	fi
    done < bosses.csv
}

Combat() {
    while [[ Monsterhp -gt  0 ]]; do
	echo ""
	echo ""
	echo "----------- Choose your action -------------"
	echo "          1                       2         "
	echo "====================="  "==================="
	echo "====== Attack ======="  "====== Heal ======="
	echo "====================="  "==================="
	read choix
	if [[ $choix != 1 ]] && [[ $choix != 2 ]]; then
	    echo "----------- Choose your action -------------"
	    echo "          1                       2         "
	    echo "====================="  "==================="
	    echo "====== Attack ======="  "====== Heal ======="
	    echo "====================="  "==================="
	    read  choix
	elif [[ $choix == 1 ]]; then
	    Monsterhp=$((Monsterhp - Myplayerstr))
	    echo "==> Link did 15 damages to Bokoblin ."
	    echo ""
	    echo ""
	    echo "-------------  Bokoblin  ---------""   15 ""/ " " 30 "
	    echo ""
	    echo ""
	    read ok
	elif [[ $choix == 2 ]]; then
	    echo $Myplayerhalfhp
	    echo $Myplayerhpmax
	    echo $Myplayerhp
	    
	    if [[ Myplayerhp -ge Myplayerhalfhp ]]; then
		Myplayerhp=Myplayerhpmax
		echo ""
		echo " Now you are full life !"
		echo ""
		echo "-----------------------------------"" Link ""------------" "60" " / " "60"
		read ok
	    else
		Myplayerhp=$((Myplayerhp + Myplayerhalfhp))
		echo "==> You use Heal ! "
		echo "------------------------------------- Myplayername ------------- Myplayerhp / Myplayerhpmax"
		read ok
	    fi
	fi
	if [[ Monsterhp -gt 0 ]]; then 
	    echo "==> Now Bokoblin can attack"
	    echo ""
	    Myplayerhp=$((Myplayerhp - Monsterstr))
	    echo "==> Bokoblin attacked and dealt 5 damages to Link !"
	    echo ""
	    echo " -------------------------------------------------------------------------- Link --------- 55 / 60 "
	else
	    echo "                                -------------------- Bokoblin is dead. ---------------------"
	fi
    if [[ Myplayerhp -le 0 ]]; then
	echo "----------------------------------------- Game Over -----------------------------------------"
	read ok
	exit 0
    else echo ""
    fi
done
}
                                                                                      # Fin des fonctions

                                                                                             #Liste de Variables 
floor=1
                                                                                              #Début du code

Save_Player_Csv
Save_Monster_Csv
Save_Bosses_Csv

echo "               ------------------------------"
echo "     ------------------- Welcome -------------------" 
echo "---------------------- To      The -----------------------"
echo "     ------------ World    of     Zelda ------------"
echo "            ----------------------------------"
echo""
echo""
read ok
clear
echo "===> New Game"
read ok
clear
echo "Welcome to Hyrule Castle at 10 floors
you'r Link your objectif is to kill the enemys each floor.
At the 10 floor there are "Ganon" the big enemy of this game, that you have will exterminate.
It's your mision.
Stay strong be focus.
AND KILL EM .

Good Luck and see you see Link"
read ok
clear




while [[ $floor != 10 ]]; do	
    echo  echo "------------------------------ Floor  -----------------------------------------"
    echo ""
    echo "You will Fight versus Bokoblin ( Strength : 5 , Life : 30 )"
    echo ""
    echo "Good Luck"
    read ok
    echo $Monsterhp
    while [[ $Monsterhp -gt  0 ]]; do
    echo ""
    echo ""
    echo "----------- Choose your action -------------"
    echo "          1                       2         "
    echo "====================="  "==================="
    echo "====== Attack ======="  "====== Heal ======="
    echo "====================="  "==================="
    read choix
    if [[ $choix != 1 ]] && [[ $choix != 2 ]]; then
        echo "----------- Choose your action -------------"
        echo "          1                       2         "
        echo "====================="  "==================="
        echo "====== Attack ======="  "====== Heal ======="
        echo "====================="  "==================="
        read  choix
	  elif [[ $choix == 1 ]]; then
        Monterhp=$((Bosshp - Myplayerstr))
        echo "==> Link did 15 damages to Bokoblin ."
        echo ""
        echo ""
        echo "---------------------------------------------------------------------------  Bokoblin  ---------""   15 ""/ " "30"
        echo ""
        echo ""
        read ok
    elif [[ $choix == 2 ]]; then
        if [[ Myplayerhp -ge Myplayerhalfhp ]]; then
            Myplayerhp=$Myplayerhpmax
            echo ""
            echo " Now you are full life !"
            echo ""
            echo "------------------------------------------------------------------------"" Link ""------------" "60" " / " "60"
            read ok
        else
            Myplayerhp=$((Myplayerhp + Myplayerhalfhp))
            echo "==> You use Heal ! "
            echo "------------------------------------------------------------------------- Link ------------- Myplayerhp / Myplayerhpmax"
            read ok
        fi
    fi
    if [[ Monsterhp -gt 0 ]]; then
        echo "==> Now Bokoblin can attack"
        echo ""
        Myplayerhp=$((Myplayerhp - Bossstr))
        echo "==> Bokoblin attacked and dealt 5 damages to Link !"
        echo ""
        echo " -------------------------------------------------------------------------- Link --------- 55 / 60"
    else
        echo "                                -------------------- Bokoblin is dead. ---------------------"
	fi
done


    Combat	                                                                                            #Boucle pour réaliser les 9 premiers étages	
    
	
    if [[ $Bokoblin -le 0 ]]; then
	floor=$((floor + 1))
    fi		       
done			
clear	

		echo "------------------------------ You enter in the Boss Floor   -----------------------------------------"
echo ""
echo "You will Fight versus Ganon ( Strength : 20, Life : 150 )"
echo ""
echo "Good Luck"
read ok
clear

while [[ $Bosshp -gt  0 ]]; do
    echo ""
    echo ""
    echo "----------- Choose your action -------------"
    echo "          1                       2         "
    echo "====================="  "==================="
    echo "====== Attack ======="  "====== Heal ======="
    echo "====================="  "==================="
    read choix
    if [[ $choix != 1 ]] && [[ $choix != 2 ]]; then
	echo "----------- Choose your action -------------"
	echo "          1                       2         "
	echo "====================="  "==================="
	echo "====== Attack ======="  "====== Heal ======="
	echo "====================="  "==================="
	read  choix
    elif [[ $choix == 1 ]]; then
	Bosshp=$((Bosshp - Myplayerstr))
	echo "==> Link did 15 damages to Ganon ."
	echo ""
	echo ""
	echo "---------------------------------------------------------------------------  Ganon  ---------""   $Bosshp ""/ " "150"
	echo ""
	echo ""
	read ok
    elif [[ $choix == 2 ]]; then
	
	if [[ $Myplayerhp -ge $Myplayerhalfhp ]]; then
	    Myplayerhp=$Myplayerhpmax
	    echo ""
	    echo " Now you are full life !"
	    echo ""
	    echo "------------------------------------------------------------------------"" Link ""------------" "$60" " / " "60"
	    read ok
	else
	    Myplayerhp=$((Myplayerhp + Myplayerhalfhp))
	    echo "==> You use Heal ! "
	    echo "------------------------------------------------------------------------- $Myplayername ------------- $Myplayerhp / $Myplayerhpmax"
	    read ok
	fi
    fi
    if [[ $Ganon -gt 0 ]]; then
	echo "==> Now Ganon can attack"
	echo ""
	Myplayerhp=$((Myplayerhp - Bossstr))
	echo "==> Ganon attacked and dealt 20 damages to Link !"
	echo ""
	echo " -------------------------------------------------------------------------- Link --------- 40 / 60"
    else
	echo "                                -------------------- Ganon is dead. ---------------------"
	echo "                             -------------------------- Congratulation ---------------------------"
    fi
    if [[ $Myplayerhp -le 0 ]]; then
	echo "----------------------------------------- Game Over -----------------------------------------"
	read ok
	exit 1                                                                                                                                                                                                                              
    fi
done
