#!/bin/bash

#init.sh
clear

#global_variable
main_ico="(ctf)"
dolla="$"
sec_menu=
#return_value
re_main_io=


#main_menu
main_menu () {
	main_io
	main_comparision
}
main_io () {
	echo -n "$main_ico $dolla "
	read io_read
	re_main_io=$io_read
}
#comparision
main_comparision () {
	if [ $re_main_io == "install_pakg" ]
	then
		echo "installing packages"
	elif [ $re_main_io == "forensic" ]
	then
		clear
		forensic
	elif [ $re_main_io == "shell" ]
	then
		shell_emu
	elif [ $re_main_io == "t" ]
	then
		tmux
	elif [ $re_main_io == "man" ]
	then
		echo "showing man"
	elif [ $re_main_io == "ls" ]
	then
		ls
	elif [ $re_main_io == "c" ]
	then
		clear
	elif [ $re_main_io == "q" ]
	then
		clear
		exit
	else
		echo "command not found"
	fi
}
#forensic
forensic () {
	while true
	do
		echo -n "${main_ico} forensic ${dolla} "
		read forensic_read
		if [ $forensic_read == "show_exif" ]
		then
			file_io
			touch exifdata.txt
			exiftool $re_fname > exifdata.txt
			nano exifdata.txt
			rm exifdata.txt
		elif [ $forensic_read == "shell" ]
		then
			shell_emu
		elif [ $forensic_read == "t" ]
		then
			tmux
		elif [ $forensic_read == "show_finf" ]
		then
			file_io
			touch analyse_for_hidden_files.txt
			binwalk $re_fname > analyse_for_hidden_files.txt
			nano analyse_for_hidden_files.txt
			rm analyse_for_hidden_files.txt
		elif [ $forensic_read == "show_s" ]
		then
			file_io
			touch string.txt
			strings $re_fname > string.txt
			nano string.txt
		elif [ $forensic_read == "extract_finf" ]
		then
			file_io
			binwalk --extract --dd=".*" $re_fname
		elif [ $forensic_read == "show_hex" ]
		then
			file_io
			hexedit $re_fname
		elif [ $forensic_read == "sudo-show_packets" ]
		then
			sudo wireshark
		elif [ $forensic_read == "show_packets" ]
		then
			wireshark
		elif [ $forensic_read == "recover_del_files" ]
		then
			echo "building"
		elif [ $forensic_read == "c" ]
		then
			clear
		elif [ $forensic_read == "b" ]
		then
			clear
			break
		else
			echo "command not found"
		fi
	done
}
#file_io
file_io () {
	echo " | "
	echo " |---[available files]---> "
	echo "{"
	ls
	echo "}"
	echo " | "
	echo -n " |------[file name]------> "
	read fname
	re_fname=$fname
}
#bash
shell_emu () {
	while true
	do  
		echo -n "(path) ---[pwd]-->"
		pwd
		echo -n "$main_ico --[shell]--> "
		read bash_command
		if [ $bash_command == "q" ]
		then
			break
		else
			$bash_command
		fi
	done
}
#main_loop
while true
do
	main_menu
done
