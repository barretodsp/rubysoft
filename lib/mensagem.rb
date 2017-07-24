module Mensagem
	class << self
		def boas_vindas
			puts "Ola! Atraves deste sistema voce podera solicitar seu UFF mail."
			puts "Digite a sua matricula"
		end
		def seleciona_uffmail_desejado(sugestoes)
			puts "Escolha uma sugestao abaixo:"
			puts sugestoes
		end
		def escolha_incorreta(quantidade)
			puts "Escolha incorreta! Favor, escolher uma opcao entre 1 - #{quantidade}."
		end
		def aviso_cadastro(uffmail_escolhido)
			puts "A criacao de seu e-mail #{uffmail_escolhido} sera feita nos proximos minutos."
		end
		def envio_sms(tel)
			puts "Um SMS foi enviado para #{tel} com a sua senha de acesso."
		end
		def status_inativo()
			puts "Nao sera possivel realizar esta solicitacao. Motivo: Matricula Inativa."   
		end
		def mat_inexistente()
			puts "Numero de matricula inexistente. Verifique se ha erros na digitacao e tente novamente."   
		end
		def uffmail_existente 
			puts "Aluno ja possui uffmail."
		end
	end
end
