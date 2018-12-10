#!/bin/bash
#Autor: Gustavo Suris#
#Data: 10/12#
#Cadeira de programação em Redes de Computadores#
#Professor: Diego Tumelero#
#Função: Permite realização de backup de arquivos e diretórios utilizando as ferramentas rsync e scp#

#Abre Menu#
menu(){
#Limpa tela#
clear

#Opções do menu#
echo "-----Escolha o método de backup-----"
echo "1 - RSYNC"
echo "2 - SCP"
echo "3 - SAIR"

#Faz a leitura da opcão digitada pelo usuário#
read bkp

#Funcao case para determinar o que cada opção faz#
case "$bkp" in
1) rsyncmethod ;;
2) scpmethod ;;
3)
clear
sair
;;
*) echo "Opção inválida:" $op
op_inv
;;
esac
}
	#Opção de utilização do método rsync para backup#
	rsyncmethod(){
	clear
    #Abre Menu#
	menu(){
	echo "1 - LOCAL -> REMOTO"
    echo "2 - REMOTO -> LOCAL"
    echo "3 - SAIR"
	  
	#Faz a leitura da opcão digitada pelo usuário#
    read rsyncmenu1
		
	#Funcao case para determinar o que cada opção faz#
    case "$rsyncmenu1" in
    1) rsynclocalremoto ;;
    2) rsyncremotolocal ;;
    3)
            clear
            sair
        ;;
    *) echo "Opção inválida:" $op
                op_inv
        ;;
    esac
	}
	
		#Opção de cópia local->remoto#
		rsynclocalremoto(){
		clear
		#Abre Menu#
		menu(){
		echo "1 - Arquivos"
		echo "2 - Diretórios"
		echo "3 - SAIR"
	 	
		#Faz a leitura da opcão digitada pelo usuário#
		read rsyncmenu2
		
		#Funcao case para determinar o que cada opção faz#
		case "$rsyncmenu2" in
		1) arquivos ;;
		2) diretorios ;;
		3)
        clear
        sair
		;;
		*) echo "Opção inválida:" $op
        op_inv
		;;
		esac
		}
		read pause
		menu
		}	
		
			#Opção de cópia de arquivos local -> remoto#
			arquivos(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um arquivo"
			echo "2 - Vários arquivos"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read rsyncmenu3
			
			#Funcao case para determinar o que cada opção faz#
			case "$rsyncmenu3" in
			1) umarquivo;;
			2) variosarquivos ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo local -> remoto#
				umarquivo(){
				clear
				echo "Informe o caminho absoluto do arquivo local"
				read arquivorsync1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor de destino"
				read caminho
				rsync -a $arquivorsync1 -e 'ssh -p $porta' $usuario@$ip:$caminho
				}
				
				#Opção de cópia de vários arquivos local -> remoto#
				variosarquivos(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois arquivos"
				echo "2 - Três arquivos"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read rsyncmenu4
			
				#Funcao case para determinar o que cada opção faz#
				case "$rsyncmenu4" in
				1) doisarquivos;;
				2) tresarquivos ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
				}
					
					#Opção de cópia de dois arquivos local -> remoto#
					doisarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 local"
					read arquivorsync1
					echo "Informe o caminho absoluto do arquivo 2 local"
					read arquivorsync2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					rsync -a $arquivorsync1 $arquivorsync2 -e 'ssh -p $porta' $usuario@$ip:$caminho
					}
					
					#Opção de cópia de tres arquivos local -> remoto#
					tresarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 local"
					read arquivorsync1
					echo "Informe o caminho absoluto do arquivo 2 local"
					read arquivorsync2
					echo "Informe o caminho absoluto do arquivo 3 local"
					read arquivorsync3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					rsync -a $arquivorsync1 $arquivorsync2 $arquivorsync3 -e 'ssh -p $porta' $usuario@$ip:$caminho
					}
	
			#Opção de cópia de diretórios local -> remoto#
			diretorios(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um diretório"
			echo "2 - Vários diretórios"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read rsyncmenu5
			
			#Funcao case para determinar o que cada opção faz#
			case "$rsyncmenu5" in
			1) umdiretorio;;
			2) variosdiretorios ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo local -> remoto#
				umdiretorio(){
				clear
				echo "Informe o caminho absoluto do diretório local"
				read diretoriorsync1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor de destino"
				read caminho
				rsync -a -r $diretoriorsync1 -e 'ssh -p $porta' $usuario@$ip:$caminho
				}
				
				#Opção de cópia de vários diretórios local -> remoto#
				variosdiretorios(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois diretórios"
				echo "2 - Três diretórios"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read rsyncmenu6
			
				#Funcao case para determinar o que cada opção faz#
				case "$rsyncmenu6" in
				1) doisdiretorios;;
				2) tresdiretorios ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
					
					#Opção de cópia de dois diretorios local -> remoto#
					doisdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretório 1 local"
					read diretoriorsync1
					echo "Informe o caminho absoluto do diretório 2 local"
					read diretoriorsync2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					rsync -a -r $diretoriorsync1 $diretoriorsync2 -e 'ssh -p $porta' $usuario@$ip:$caminho
					}
					
					#Opção de cópia de tres diretorios local -> remoto#
					tresdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretorio 1 local"
					read arquivorsync1
					echo "Informe o caminho absoluto do diretorio 2 local"
					read arquivorsync2
					echo "Informe o caminho absoluto do diretorio 3 local"
					read arquivorsync3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					sync -a -r $diretoriorsync1 $diretoriorsync2 $diretoriorsync3 -e 'ssh -p $porta' $usuario@$ip:$caminho
					}
										
		#Opção de cópia remoto->local#
		rsyncremotolocal(){
		clear
		#Abre Menu#
		menu(){
		echo "1 - Arquivos"
		echo "2 - Diretórios"
		echo "3 - SAIR"
	 	
		#Faz a leitura da opcão digitada pelo usuário#
		read rsyncmenu7
		
		#Funcao case para determinar o que cada opção faz#
		case "$rsyncmenu7" in
		1) arquivos ;;
		2) diretorios ;;
		3)
        clear
        sair
		;;
		*) echo "Opção inválida:" $op
        op_inv
		;;
		esac
		}
		read pause
		menu
		}	
		
			#Opção de cópia de arquivos remoto -> local#
			arquivos(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um arquivo"
			echo "2 - Vários arquivos"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read rsyncmenu8
			
			#Funcao case para determinar o que cada opção faz#
			case "$rsyncmenu8" in
			1) umarquivo;;
			2) variosarquivos ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo remoto -> local#
				umarquivo(){
				clear
				echo "Informe o caminho absoluto do arquivo remoto"
				read caminhorsync1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor local"
				read caminholocal
				rsync -a -e 'ssh -p $porta' $usuario@$ip:$caminhorsync1 $caminholocal
				}
				
				#Opção de cópia de vários arquivos remoto -> local#
				variosarquivos(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois arquivos"
				echo "2 - Três arquivos"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read rsyncmenu9
			
				#Funcao case para determinar o que cada opção faz#
				case "$rsyncmenu9" in
				1) doisarquivos;;
				2) tresarquivos ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
					
					#Opção de cópia de dois arquivos remoto -> local#
					doisarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 remoto"
					read caminhorsync1
					echo "Informe o caminho absoluto do arquivo 2 remoto"
					read caminhorsync2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					rsync -a -e 'ssh -p $porta' $usuario@$ip:$caminhorsync1 $usuario@$ip:$caminhorsync2 $caminholocal
					}
					
					#Opção de cópia de tres arquivos remoto -> local#
					tresarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 remoto"
					read caminhorsync1
					echo "Informe o caminho absoluto do arquivo 2 remoto"
					read caminhorsync2
					echo "Informe o caminho absoluto do arquivo 3 remoto"
					read caminhorsync3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					rsync -a -e 'ssh -p $porta' $usuario@$ip:$caminhorsync1 $usuario@$ip:$caminhorsync2 $usuario@$ip:$caminhorsync3 $caminholocal
					}
	
			#Opção de cópia de diretórios local -> remoto#
			diretorios(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um diretório"
			echo "2 - Vários diretórios"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read rsyncmenu10
			
			#Funcao case para determinar o que cada opção faz#
			case "$rsyncmenu10" in
			1) umdiretorio;;
			2) variosdiretorios ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo remoto -> local#
				umdiretorio(){
				clear
				echo "Informe o caminho absoluto do diretório remoto"
				read caminhorsync1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor local"
				read caminholocal
				rsync -arz -e 'ssh -p $porta' $usuario@$ip:$caminhorsync1 $caminholocal
				}
				
				#Opção de cópia de vários diretórios remoto -> local#
				variosdiretorios(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois diretórios"
				echo "2 - Três diretórios"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read rsyncmenu11
			
				#Funcao case para determinar o que cada opção faz#
				case "$rsyncmenu11" in
				1) doisdiretorios;;
				2) tresdiretorios ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
					
					#Opção de cópia de dois diretorios remoto -> local#
					doisdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretório 1 remoto"
					read caminhorsync1
					echo "Informe o caminho absoluto do diretório 2 remoto"
					read caminhorsync2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					rsync -arz -e 'ssh -p $porta' $usuario@$ip:$caminhorsync1 $usuario@$ip:$caminhorsync2 $caminholocal
					}
					
					#Opção de cópia de tres diretorios remoto -> local#
					tresdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretório 1 remoto"
					read caminhorsync1
					echo "Informe o caminho absoluto do diretório 2 remoto"
					read caminhorsync2
					echo "Informe o caminho absoluto do diretório 3 remoto"
					read caminhorsync3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					rsync -arz -e 'ssh -p $porta' $usuario@$ip:$caminhorsync1 $usuario@$ip:$caminhorsync2 $usuario@$ip:$caminhorsync3 $caminholocal
					}
					
	#Opção de utilização do método scp para backup#
	scpmethod(){
	clear
    #Abre Menu#
	menu(){
	echo "1 - LOCAL -> REMOTO"
    echo "2 - REMOTO -> LOCAL"
    echo "3 - REMOTO -> REMOTO"
	echo "3 - SAIR"
	  
	#Faz a leitura da opcão digitada pelo usuário#
    read scpcmenu1
		
	#Funcao case para determinar o que cada opção faz#
    case "$scpcmenu1" in
    1) scplocalremoto ;;
    2) scpremotolocal ;;
	3)
            clear
            sair
        ;;
    *) echo "Opção inválida:" $op
                op_inv
        ;;
    esac
	}
	
		#Opção de cópia local->remoto#
		scplocalremoto(){
		clear
		#Abre Menu#
		menu(){
		echo "1 - Arquivos"
		echo "2 - Diretórios"
		echo "3 - SAIR"
	 	
		#Faz a leitura da opcão digitada pelo usuário#
		read scpmenu2
		
		#Funcao case para determinar o que cada opção faz#
		case "$scpmenu2" in
		1) arquivos ;;
		2) diretorios ;;
		3)
        clear
        sair
		;;
		*) echo "Opção inválida:" $op
        op_inv
		;;
		esac
		}
		read pause
		menu
		}	
		
			#Opção de cópia de arquivos local -> remoto#
			arquivos(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um arquivo"
			echo "2 - Vários arquivos"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read scpmenu3
			
			#Funcao case para determinar o que cada opção faz#
			case "$scpmenu3" in
			1) umarquivo;;
			2) variosarquivos ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo local -> remoto#
				umarquivo(){
				clear
				echo "Informe o caminho absoluto do arquivo local"
				read arquivoscp1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor de destino"
				read caminho
				scp -P $porta $arquivoscp1 $usuario@$ip:/$caminho
				}
				
				#Opção de cópia de vários arquivos local -> remoto#
				variosarquivos(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois arquivos"
				echo "2 - Três arquivos"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read scpmenu4
			
				#Funcao case para determinar o que cada opção faz#
				case "$scpmenu4" in
				1) doisarquivos;;
				2) tresarquivos ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
				}
					
					#Opção de cópia de dois arquivos local -> remoto#
					doisarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 local"
					read arquivoscp1
					echo "Informe o caminho absoluto do arquivo 2 local"
					read arquivoscp2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					scp -P $porta $arquivoscp1 $arquivoscp2 $usuario@$ip:/$caminho
					}
					
					#Opção de cópia de tres arquivos local -> remoto#
					tresarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 local"
					read arquivoscp1
					echo "Informe o caminho absoluto do arquivo 2 local"
					read arquivoscp2
					echo "Informe o caminho absoluto do arquivo 3 local"
					read arquivoscp3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					scp -P $porta $arquivoscp1 $arquivoscp2 $arquivoscp3 $usuario@$ip:/$caminho
					}
	
			#Opção de cópia de diretórios local -> remoto#
			diretorios(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um diretório"
			echo "2 - Vários diretórios"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read scpmenu5
			
			#Funcao case para determinar o que cada opção faz#
			case "$scpmenu5" in
			1) umdiretorio;;
			2) variosdiretorios ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo local -> remoto#
				umdiretorio(){
				clear
				echo "Informe o caminho absoluto do diretório local"
				read diretoriorscp1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor de destino"
				read caminho
				scp -P $porta -r $diretoriorscp1 $usuario@$ip:/$caminho
				}
				
				#Opção de cópia de vários diretórios local -> remoto#
				variosdiretorios(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois diretórios"
				echo "2 - Três diretórios"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read scpmenu6
			
				#Funcao case para determinar o que cada opção faz#
				case "$scpmenu6" in
				1) doisdiretorios;;
				2) tresdiretorios ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
					
					#Opção de cópia de dois diretorios local -> remoto#
					doisdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretório 1 local"
					read diretoriorscp1
					echo "Informe o caminho absoluto do diretório 2 local"
					read diretoriorscp2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					scp -P $porta -r $diretoriorscp1 $diretoriorscp2 $usuario@$ip:/$caminho
					}
					
					#Opção de cópia de tres diretorios local -> remoto#
					tresdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretorio 1 local"
					read diretoriorscp1
					echo "Informe o caminho absoluto do diretorio 2 local"
					read diretoriorscp2
					echo "Informe o caminho absoluto do diretorio 3 local"
					read diretoriorscp3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor de destino"
					read caminho
					scp -P $porta -r $diretoriorscp1 $diretoriorscp2 $diretoriorscp3 $usuario@$ip:/$caminho
					}
										
		#Opção de cópia remoto->local#
		scpremotolocal(){
		clear
		#Abre Menu#
		menu(){
		echo "1 - Arquivos"
		echo "2 - Diretórios"
		echo "3 - SAIR"
	 	
		#Faz a leitura da opcão digitada pelo usuário#
		read scpmenu7
		
		#Funcao case para determinar o que cada opção faz#
		case "$scpmenu7" in
		1) arquivos ;;
		2) diretorios ;;
		3)
        clear
        sair
		;;
		*) echo "Opção inválida:" $op
        op_inv
		;;
		esac
		}
		read pause
		menu
		}	
		
			#Opção de cópia de arquivos remoto -> local#
			arquivos(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um arquivo"
			echo "2 - Vários arquivos"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read scpmenu8
			
			#Funcao case para determinar o que cada opção faz#
			case "$scpmenu8" in
			1) umarquivo;;
			2) variosarquivos ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo remoto -> local#
				umarquivo(){
				clear
				echo "Informe o caminho absoluto do arquivo remoto"
				read caminhorscp1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor local"
				read caminholocal
				scp -P $porta $usuario@$ip:/$caminhorscp1 $caminholocal
				}
				
				#Opção de cópia de vários arquivos remoto -> local#
				variosarquivos(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois arquivos"
				echo "2 - Três arquivos"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read scpmenu9
			
				#Funcao case para determinar o que cada opção faz#
				case "$scpmenu9" in
				1) doisarquivos;;
				2) tresarquivos ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
					
					#Opção de cópia de dois arquivos remoto -> local#
					doisarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 remoto"
					read caminhorscp1
					echo "Informe o caminho absoluto do arquivo 2 remoto"
					read caminhorscp2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					scp -P $porta $usuario@$ip:/$caminhorscp1 $usuario@$ip:/$caminhorscp2 $caminholocal
					}
					
					#Opção de cópia de tres arquivos remoto -> local#
					tresarquivos(){
					clear
					echo "Informe o caminho absoluto do arquivo 1 remoto"
					read caminhorscp1
					echo "Informe o caminho absoluto do arquivo 2 remoto"
					read caminhorscp2
					echo "Informe o caminho absoluto do arquivo 3 remoto"
					read caminhorscp3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					scp -P $porta $usuario@$ip:/$caminhorscp1 $usuario@$ip:/$caminhorscp2 $usuario@$ip:/$caminhorscp3 $caminholocal
					}
	
			#Opção de cópia de diretórios local -> remoto#
			diretorios(){
			clear
			#Abre Menu#
			menu(){
			echo "1 - Um diretório"
			echo "2 - Vários diretórios"
			echo "3 - SAIR"
	 	
			#Faz a leitura da opcão digitada pelo usuário#
			read scpmenu10
			
			#Funcao case para determinar o que cada opção faz#
			case "$scpmenu10" in
			1) umdiretorio;;
			2) variosdiretorios ;;
			3)
			clear
			sair
			;;
			*) echo "Opção inválida:" $op
			op_inv
			;;
			esac
			}
			read pause
			menu
			}	
				
				#Opção de cópia de um arquivo remoto -> local#
				umdiretorio(){
				clear
				echo "Informe o caminho absoluto do diretório remoto"
				read caminhorscp1
				echo "Informe a porta do conexão"
				read porta
				echo "Informe o usuário do conexão"
				read usuario
				echo "Informe o IP da conexão"
				read ip
				echo "Informe o caminho absoluto do servidor local"
				read caminholocal
				scp -P $porta -r $usuario@$ip:/$caminhorscp1 $caminholocal
				}
				
				#Opção de cópia de vários diretórios remoto -> local#
				variosdiretorios(){
				clear
				#Abre Menu#
				menu(){
				echo "1 - Dois diretórios"
				echo "2 - Três diretórios"
				echo "4 - Sair"
	 	
				#Faz a leitura da opcão digitada pelo usuário#
				read scpmenu11
			
				#Funcao case para determinar o que cada opção faz#
				case "$scpmenu11" in
				1) doisdiretorios;;
				2) tresdiretorios ;;
				3)
				clear
				sair
				;;
				*) echo "Opção inválida:" $op
				op_inv
				;;
				esac
				}
				read pause
				menu
				}
				
					
					#Opção de cópia de dois diretorios remoto -> local#
					doisdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretório 1 remoto"
					read caminhorscp1
					echo "Informe o caminho absoluto do diretório 2 remoto"
					read caminhorscp2
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					scp -P $porta -r $usuario@$ip:/$caminhorscp1 $usuario@$ip:/$caminhorscp2 $caminholocal
					}
					
					#Opção de cópia de tres diretorios remoto -> local#
					tresdiretorios(){
					clear
					echo "Informe o caminho absoluto do diretório 1 remoto"
					read caminhorscp1
					echo "Informe o caminho absoluto do diretório 2 remoto"
					read caminhorscp2
					echo "Informe o caminho absoluto do diretório 3 remoto"
					read caminhorscp3
					echo "Informe a porta do conexão"
					read porta
					echo "Informe o usuário do conexão"
					read usuario
					echo "Informe o IP da conexão"
					read ip
					echo "Informe o caminho absoluto do servidor local"
					read caminholocal
					scp -P $porta -r $usuario@$ip:/$caminhorscp1 $usuario@$ip:/$caminhorscp2 $usuario@$ip:/$caminhorscp3 $caminholocal
					}
	
}

#Opção que permite usuário sair do script#
sair(){
    clear
}

#Opção escolhida quando digitado um número fora do range 1-3 do menu#
op_inv(){
    echo "Opcao invalida, retornando ao menu principal"
    read pause
    menu
}
menu